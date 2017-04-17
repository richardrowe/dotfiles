-- vim movements

local vimMovements = require "vim-movements"
local shiftParens = require "shift-parens"
local tabNumpad = require "tab-numpad"

local tiling = require "hs.tiling"
local hotkey = require "hs.hotkey"
local mash = {"ctrl", "cmd"}

hotkey.bind(mash, "c", function() tiling.cycleLayout() end)
hotkey.bind(mash, "j", function() tiling.cycle(1) end)
hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
hotkey.bind(mash, "space", function() tiling.promote() end)
hotkey.bind(mash, "f", function() tiling.goToLayout("fullscreen") end)

-- If you want to set the layouts that are enabled
tiling.set('layouts', {
  'fullscreen', 'main-vertical'
})
