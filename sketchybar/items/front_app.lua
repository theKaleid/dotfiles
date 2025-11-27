local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")
local create_menu_items = require("items.menus")

sbar.add("item", { width = 7 })

local function is_vim_in_iterm(process_name)
  if process_name == "iTerm2" then
    -- You can use 'ps' to check if vim is running in the terminal
    local handle = io.popen("ps -o comm= | grep -i vim")
    if not handle then
      return false
    end
    local result = handle:read("*a")
    handle:close()
    return result:match("n?vim") ~= nil
  end
  return false
end

local front_app_icon = sbar.add("item", "front_app_icon", {
  display = "active",
  icon = {
    drawing = false,
    padding_left = 0,
    padding_right = 0,
  },
  width = 20,
  label = {
    color = colors.blue,
    font = {
      family = "sketchybar-app-font",
      style = "Regular",
      size = 12.0,
    },
    width = 16,
    padding_left = 4,
    padding_right = 0,
  },
  background = {
    border_color = colors.grey,
    border_width = 1.5,
    height= 20,
    corner_radius = 5,
    drawing = true,
  },
})

local front_app_icon_bracket = front_app_icon

local front_app = sbar.add("item", "front_app", {
  display = "active",
  icon = { drawing = false },
  label = {
    font = {
      style = settings.font.style_map["Black"],
      size = 12.0,
    },
  },
  background = {
    padding_left = 0,
    padding_right = 4,
  },
  padding_right = 4,
  padding_left = 6,
  updates = true,
})

local menu_items = create_menu_items()

local bracket_items = {
  front_app_icon_bracket.name,
  front_app.name,
}

for _, item in ipairs(menu_items) do
  table.insert(bracket_items, item.name)
end

local front_app_bracket = sbar.add("bracket", bracket_items, {
  background = {
    color = colors.bg2,
    height = 30,
    border_color = colors.grey,
    border_width = 1,
  }

})

--[[
front_app_bracket:subscribe("mouse.entered", function(env)
  sbar.animate("tanh", 20, function()
    front_app:set({
      label = {
        width = "dynamic",
      },
      padding_right = 4,
      padding_left = 6,
    })
    front_app_icon:set({
      background = {
        border_color = colors.grey,
      }
    })
  end)
end)
--]]

local menu_open = false

--[[
front_app_bracket:subscribe("mouse.exited", function(env)
  if menu_open then
    return
  end
  sbar.animate("tanh", 20, function()
    front_app:set({
      label = {
        width = 0,
      },
      padding_right = 0,
      padding_left = 0,
    })
    front_app_icon:set({
      background = {
        border_color = colors.transparent,
      }
    })
  end)
end)
--]]

front_app:subscribe("front_app_switched", function(env)
  local is_vim = is_vim_in_iterm(env.INFO)

  front_app:set({ label = {
    string = is_vim and "Vim" or env.INFO
  }})


  if is_vim == true then
    local icon = app_icons["Vim"]

    front_app_icon:set({
      label = {
        string = icon,
        color = colors.green,
        drawing = true,
      },
      background = {
        image = {
          drawing = false,
        },
      }
    })
    return
  end

  front_app_icon:set({
    label = {
      drawing = false,
    },
    background = {
      image = {
        string = 'app.' .. env.INFO,
        border_width = 0,
        border_color = colors.border,
        scale = 0.6,
        corner_radius = 0,
        drawing = true,
      },
    }
  })
end)

local function trigger_menu()
  menu_open = not menu_open
  sbar.trigger("swap_menus_and_spaces")
end

front_app:subscribe("mouse.clicked", function(env)
  trigger_menu()
end)
front_app_icon:subscribe("mouse.clicked", function(env)
  trigger_menu()
end)
