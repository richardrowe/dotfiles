-- left/right shift to parens on empty shift presses

local keyCodes = hs.keycodes.map

function activeFlags(flags)
  local count = 0
  for _, v in pairs(flags) do
    if v then
      count = count + 1
    end
  end
  return count
end

shiftParens = {}
shiftParens.canShiftParen = false
shiftParens.timeoutTimer = nil
shiftParens.skipStarts = false
shiftParens.skipTimer = nil

shiftParens.watcher = hs.eventtap.new({
    hs.eventtap.event.types.keyDown,
    hs.eventtap.event.types.keyUp,
    hs.eventtap.event.types.flagsChanged }, function(e)

    -- left shift: 0x38
    -- right shift: 0x3C
    local keyCode = e:getKeyCode()
    local type = e:getType()
    local isFlagsChangedType = hs.eventtap.event.types[type] == "flagsChanged"
    local flags = e:getFlags()

    -- For any other event, assume that it interrupts the shift press:
    if not isFlagsChangedType then
      shiftParens.canShiftParen = false
      return false
    end

    -- When we're outputting a parenthesis, since it uses <shift> as well, we
    -- need a way to ignore events for that particular output:
    if shiftParens.skipStarts then
      return false
    end

    -- If this is a non-shift related modifier event, interrupt the shift press:
    if activeFlags(flags) > 0 and not flags.shift then
      shiftParens.canShiftParen = false
      return false
    end

    -- If this is a modifier event where a shift key is exclusively downed,
    -- then we are in the 'shift':
    if flags.shift and activeFlags(flags) == 1 then
      shiftParens.canShiftParen = true
      -- Allow up to 100ms to release the shift
      shiftParens.timeoutTimer = hs.timer.doAfter(0.1, function() shiftParens.canShiftParen = false end)
      return false
    end

    -- If this a modifier event where the shift key has been lifted, try
    -- to output the appropriate parenthesis:
    if activeFlags(flags) == 0 and shiftParens.canShiftParen then
        shiftParens.canShiftParen = false
        local key = "9"
        if keyCode == 0x3C then key = "0" end
        shiftParens.skipStarts = true
        shiftParens.skipTimer = hs.timer.doAfter(0.07, function() shiftParens.skipStarts = false end)
        hs.eventtap.keyStroke({"shift"}, key, 10)
        return true
    end

    -- Anything else just assume an interrupt:
    shiftParens.canShiftParen = false
    return false

end)

shiftParens.watcher:start()
