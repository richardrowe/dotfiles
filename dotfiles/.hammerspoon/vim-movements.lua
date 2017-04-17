-- vim navigation mappings
local keyCodes = hs.keycodes.map

farrows = {}

farrows.watcher = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(e)
    local flags = e:getFlags()
    local keyCode = e:getKeyCode()
    local mods = {}
    if not flags.fn then return false end
    -- Support additional modifiers:
    if flags.ctrl then table.insert(mods, "ctrl") end
    if flags.cmd then table.insert(mods, "cmd") end
    if flags.alt then table.insert(mods, "alt") end
    if flags.shift then table.insert(mods, "shift") end
    -- H:
    if keyCode == 0x04 then
      hs.eventtap.keyStroke(mods, "left", 100)
      return true
    end
    -- J:
    if keyCode == 0x26 then
      hs.eventtap.keyStroke(mods, "down", 100)
      return true
    end
    -- K:
    if keyCode == 0x28 then
      hs.eventtap.keyStroke(mods, "up", 100)
      return true
    end
    -- L:
    if keyCode == 0x25 then
      hs.eventtap.keyStroke(mods, "right", 100)
      return true
    end
    return false
end)

farrows.watcher:start()
