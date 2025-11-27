local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local ICON_WIDTH = settings.icon_width

local function get_spaces_from_aerospace()
  local handle = io.popen("aerospace list-workspaces --all")
  if not handle then
    return
  end

  local result = handle:read("*a")
  handle:close()

  local workspaces = {}

  for sid in string.gmatch(result, "%S+") do
    table.insert(workspaces, sid)
  end
  return workspaces
end

local function create_workspace_item(sid)
  local space = sbar.add('item', 'aerospace.space.' .. sid, {
    icon = {
      string = icons.workspaces[sid],
      font = {
        size = 12,
      },
      color = colors.grey,
      highlight_color = colors.bg2,
      padding_left = 3,
      padding_right = 4,
      align = "center",
      width = ICON_WIDTH,
    },
    background = {
      drawing = false,
      color = colors.blue,
      border_width = 1.5,
      height = 20,
      padding_left = 0,
      padding_right = 0,
      corner_radius = 6,
      border_color = colors.grey,
    },
    label = {
      drawing = false,
    },
    padding_left = 0,
    padding_right = 0,
    click_script = "aerospace workspace " .. sid,
  })

  return space
end


local create_workspaces = function()
  local spaces = {}
  local aerospace_spaces = get_spaces_from_aerospace()
  if not aerospace_spaces then
    return spaces
  end
  for _, sid in ipairs(aerospace_spaces) do
    local space = create_workspace_item(sid)

    space:subscribe("aerospace_workspace_change", function (env)
      local selected = env.FOCUSED_WORKSPACE == sid

      space:set({
        icon = {
          string = selected and icons.active_workspaces[sid] or icons.workspaces[sid],
          highlight = selected,
        },
        background = {
          drawing = selected,
        }
      })
    end)

    table.insert(spaces, space)
  end

  return spaces
end

return create_workspaces
