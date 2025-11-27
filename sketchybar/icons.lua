local settings = require("settings")

local icons = {
  sf_symbols = {
    plus = "􀅼",
    loading = "􀖇",
    apple = "􀣺",
    gear = "􀍟",
    cpu = "􀫥",
    clipboard = "􀉄",

    switch = {
      on = "􁏮",
      off = "􁏯",
    },
    volume = {
      _100="􀊩",
      _66="􀊧",
      _33="􀊥",
      _10="􀊡",
      _0="􀊣",
    },
    battery = {
      _100 = "􀛨",
      _75 = "􀺸",
      _50 = "􀺶",
      _25 = "􀛩",
      _0 = "􀛪",
      charging = "􀢋"
    },
    wifi = {
      upload = "􀄨",
      download = "􀄩",
      connected = "􀙇",
      disconnected = "􀙈",
      router = "􁓤",
    },
    media = {
      back = "􀊊",
      forward = "􀊌",
      play_pause = "􀊈",
    },
    workspaces = {
      ["1"] = "􀎞",
      ["2"] = "􂊬",
      ["3"] = "􀩼",
      ["4"] = "􁢙",
      ["5"] = "􀏹",
      ["6"] = "􀢟",
      ["7"] = "􀒂",
      ["8"] = "􀒃",
      ["9"] = "􀒄",
      ["10"] = "􀒅",
    },
    active_workspaces = {
      ["1"] = "􀎟",
      ["2"] = "􂊭",
      ["3"] = "􀪏",
      ["4"] = "􁣂",
      ["5"] = "􀏺",
      ["6"] = "􀢠",
      ["7"] = "􀊼",
      ["8"] = "􀊽",
      ["9"] = "􀊿",
      ["10"] = "􀊾",
    }
  },

  -- Alternative NerdFont icons
  nerdfont = {
    plus = "",
    loading = "",
    apple = "",
    gear = "",
    cpu = "",
    clipboard = "Missing Icon",

    switch = {
      on = "󱨥",
      off = "󱨦",
    },
    volume = {
      _100="",
      _66="",
      _33="",
      _10="",
      _0="",
    },
    battery = {
      _100 = "",
      _75 = "",
      _50 = "",
      _25 = "",
      _0 = "",
      charging = ""
    },
    wifi = {
      upload = "",
      download = "",
      connected = "󰖩",
      disconnected = "󰖪",
      router = "Missing Icon"
    },
    media = {
      back = "",
      forward = "",
      play_pause = "",
    },
    numbers = {
      ["1"] = "󰎦",
      ["2"] = "󰎩",
      ["3"] = "󰎬",
      ["4"] = "󰎮",
      ["5"] = "󰎰",
      ["6"] = "󰎵",
      ["7"] = "󰎸",
      ["8"] = "󰎻",
      ["9"] = "󰎾",
      ["10"] = "󰎣",
      ["1.active"] = "󰎤",
      ["2.active"] = "󰎧",
      ["3.active"] = "󰎪",
      ["4.active"] = "󰎭",
      ["5.active"] = "󰎱",
      ["7.active"] = "󰎶",
      ["8.active"] = "󰎹",
      ["9.active"] = "󰎼",
      ["10.active"] = "󰎡",
    }
  },
}

if not (settings.icons == "NerdFont") then
  return icons.sf_symbols
else
  return icons.nerdfont
end
