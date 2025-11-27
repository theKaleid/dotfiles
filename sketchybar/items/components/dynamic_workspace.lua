local colors = require("colors")
local icons = require("icons")

-- Dynamic workspace
local create_dynamic_workspace = function () 
  local dynamic_workspace = sbar.add("item", {
    icon = {
      string = icons.active_workspaces["1"],
      font = {
        size = 10,
      },
      width = 0,
      color = colors.bg2,
      padding_left = 3,
      padding_right = 4,
      align = "center",
    },
    background = {
      color = colors.transparent,
      border_width = 0,
      height = 20,
      padding_left = 0,
      padding_right = 0,
      corner_radius = 6,
    },
    label = {
      drawing = false,
    },
    padding_left = 0,
    padding_right = 0,
    y_offset = 0,
  })

  -- Events
  dynamic_workspace:subscribe("mouse.clicked", function(env)
    sbar.trigger("swap_menus_and_spaces")
  end)

  dynamic_workspace:subscribe("aerospace_workspace_change", function (env)
    local selected = env.FOCUSED_WORKSPACE

    dynamic_workspace:set({
      icon = {
        string = icons.active_workspaces[selected],
      },
    })
  end)

  return dynamic_workspace
end 

return create_dynamic_workspace
