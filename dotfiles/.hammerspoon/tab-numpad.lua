-- TAB-numpad:
local keyCodes = hs.keycodes.map

tabNumpad = {}
tabNumpad.isTabDowned = false
tabNumpad.canEmitTab = false
tabNumpad.timeoutTimer = nil
tabNumpad.skipProcessing = false
tabNumpad.skipTimer = nil

tabNumpad.keyMap = {
  ["space"] = "0",
  ["n"] = "1",  ["m"] = "2",  [","] = "3",
  ["h"] = "4",  ["j"] = "5",  ["k"] = "6",
  ["y"] = "7",  ["u"] = "8",  ["i"] = "9",
}

tabNumpad.watcher = hs.eventtap.new({
    hs.eventtap.event.types.keyDown,
    hs.eventtap.event.types.keyUp }, function(e)

    local keyCode = e:getKeyCode()
    local type = e:getType()
    local isKeyUp = hs.eventtap.event.types[type] == "keyUp"
    local flags = e:getFlags()

    if tabNumpad.skipProcessing then
      return false
    end

    -- When tab is pressed down, set isTabDowned and a timer
    -- that dictates the window in which a key up translates
    -- to the tab key:
    if keyCode == keyCodes["tab"] and not isKeyUp then
      tabNumpad.isTabDowned = true
      tabNumpad.canEmitTab = true
      tabNumpad.timeoutTimer = hs.timer.doAfter(0.1, function() tabNumpad.canEmitTab = false end)
      return true
    end

    -- When tab is lifted, emit a tab if we are within the timeout window:
    if keyCode == keyCodes["tab"] and isKeyUp then
      tabNumpad.isTabDowned = false
      if not tabNumpad.canEmitTab then return false end
      tabNumpad.skipProcessing = true
      tabNumpad.skipTimer = hs.timer.doAfter(0.07, function() tabNumpad.skipProcessing = false end)
      hs.eventtap.keyStroke({}, "tab", 10)
      return true
    end

    -- Don't bother doing anything if tab is not downed, or if
    -- we are doing a key up:
    if not tabNumpad.isTabDowned or isKeyUp then
      return false
    end

    -- Now the actual keymap:

    local mods = {}
    if flags.ctrl then table.insert(mods, "ctrl") end
    if flags.cmd then table.insert(mods, "cmd") end
    if flags.alt then table.insert(mods, "alt") end
    if flags.shift then table.insert(mods, "shift") end

    for orig, new in pairs(tabNumpad.keyMap) do
      if keyCode == keyCodes[orig] then
        hs.eventtap.keyStroke(mods, new, 10)
        return true
      end
    end

    return false
end)

tabNumpad.watcher:start()
