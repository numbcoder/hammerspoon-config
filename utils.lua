-----------------------------------------------
------------- util functions ------------------
-----------------------------------------------

function tolerance(a, b) return math.abs(a - b) < 32 end

-- resize window
function resize(x, y, w, h)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  local ww = max.w / w
  local hh = max.h / h
  local xx = max.x + (x * ww)
  local yy = max.y + (y * hh)

  if tolerance(f.x, xx) and tolerance(f.y, yy) and tolerance(f.w, ww) and tolerance(f.h, hh) then
    if w > h then
      x = (x + 1) % w
    elseif h > w then
      y = (y + 1) % h
    else
      x = (x == 0) and 0.9999 or 0
      y = (y == 0) and 0.9999 or 0
    end
    return resize(x, y, w, h)
  end
  f.x = xx
  f.y = yy
  f.w = ww
  f.h = hh
  return win:setFrame(f)
end

-- move window to center of the screen
function center()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.x = (max.w - max.x - f.w) / 2
  f.y = (max.h - max.y - f.h) / 2
  win:setFrame(f)
end

-- map key to key
function keyMap(fromMods, fromKey, toMods, toKey)
  local event = hs.eventtap.event.newKeyEvent(toMods, toKey, true)
  local action = function()
    --hs.eventtap.keyStroke(toMods, toKey)
    event:post()
  end
  hs.hotkey.bind(fromMods, fromKey, action, nil, action)
end
