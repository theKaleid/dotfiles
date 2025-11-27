local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")
local creat_dynamic_workspace = require("items.components.dynamic_workspace")
local creat_spaces = require("items.components.aerospace_spaces")

local ICON_WIDTH = settings.icon_width

sbar.add("event", "aerospace_workspace_change")

local function create_padding(size)
  return sbar.add("item", {
    width = size,
    padding_left = 0,
    padding_right = 0,
    icon = {
      drawing = false,
    },
    label = {
      drawing = false,
    },
    background = {
      drawing = false
    }
  })
end

local padding_before = create_padding(5)
local dynamic_workspace = creat_dynamic_workspace()
local spaces = creat_spaces()
local padding_after = create_padding(5)
local items = {}

table.insert(items, padding_before.name)
table.insert(items, dynamic_workspace.name)
for i, space in ipairs(spaces) do
  table.insert(items, space.name)
end
table.insert(items, padding_after.name)


local is_closed = false

local function toggle_workspace()
  is_closed = not is_closed

  sbar.animate("tanh", 30, function()
    dynamic_workspace:set({
      icon = {
        width = is_closed and ICON_WIDTH or 0,
      },
      background = {
        color = is_closed and colors.blue or colors.transparent,
      },
      padding_left = is_closed and 0 or 0,
      padding_right = is_closed and 0 or 0,
    })
    for _, space in ipairs(spaces) do
      if space == dynamic_workspace.name or space == padding_before.name or space == padding_after.name then
        goto continue
      end
      sbar.animate("tanh", 30, function()
        sbar.set(space, {
          icon = {
            width = is_closed and 0 or ICON_WIDTH,
            color = is_closed and colors.transparent or colors.grey,
          },
        })
      end)
      ::continue::
    end
  end)
end

dynamic_workspace:subscribe("swap_menus_and_spaces", function(env)
  toggle_workspace()
end)

sbar.add('bracket', "widget.spaces", items, {
  background = {
    color = colors.bg2,
    border_color = colors.grey,
    border_width = 1,
    height = 30,
  }
})

