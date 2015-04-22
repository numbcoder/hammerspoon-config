require 'utils'
-----------------------------------------------
-- Set hyper to ctrl + shift
-----------------------------------------------
local hyper = {"ctrl", "shift"}

--hs.window.animationDuration = 0

-----------------------------------------------
-- Auto Reload config on write
-----------------------------------------------
--hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()
--hs.alert.show("Config loaded")

-----------------------------------------------
-- Reload manual by hyper r
-----------------------------------------------
hs.hotkey.bind(hyper, 'r', function() hs.reload() end )
hs.alert("Config loaded")

-----------------------------------------------
-- App shortcuts
-----------------------------------------------
local appHyper = {"alt"}

local key2App = {
  [1] = 'Google Chrome',
  [2] = 'QQ',
  [3] = 'Safari',
  q = 'iTerm',
  w = 'MacVim',
  e = 'RubyMine',
  a = 'Finder',
  s = 'Sublime Text',
  x = 'Xcode',
  z = 'Dash',
  c = 'AppCleaner',
}
for key, app in pairs(key2App) do
  hs.hotkey.bind(appHyper, tostring(key), function() hs.application.launchOrFocus(app) end)
end

-- lock screen
hs.hotkey.bind(appHyper, 'l', hs.caffeinate.lockScreen)

-----------------------------------------------
-- hyper h, j, k, l for left, down, up, right half window
-----------------------------------------------
hs.hotkey.bind(hyper, "l", function() resize(1, 0, 2, 1) end)
hs.hotkey.bind(hyper, "h", function() resize(0, 0, 2, 1) end)
hs.hotkey.bind(hyper, "j", function() resize(0, 1, 1, 2) end)
hs.hotkey.bind(hyper, "k", function() resize(0, 0, 1, 2) end)
hs.hotkey.bind(hyper, "m", function() resize(0, 0, 1, 1) end)

-----------------------------------------------
-- hyper g, ; for horizontal, vertical fold window
-----------------------------------------------
local lx = 2
local lw = 3
hs.hotkey.bind(hyper, ";", function()
  resize(lx, 0, lw, 1)
  lx = (lx + 1) % lw
end)

local hy = 0
local hh = 3
hs.hotkey.bind(hyper, "g", function()
  resize(0, hy, 1, hh)
  hy = (hy + 1) % hh
end)

-----------------------------------------------
-- hyper f for fullscreen, c for center
-----------------------------------------------
--hs.hotkey.bind(hyper, "f", fullscreen)
hs.hotkey.bind(hyper, "f", function() hs.window.focusedWindow():maximize() end)
hs.hotkey.bind(hyper, "c", center)

-----------------------------------------------
-- hyper p, n for move between monitors
-----------------------------------------------
hs.hotkey.bind(hyper, "p", function() hs.window.focusedWindow():moveOneScreenEast(0) end)
hs.hotkey.bind(hyper, "n", function() hs.window.focusedWindow():moveOneScreenWest(0) end)

-----------------------------------------------
-- hyper 1, 2 for diagonal quarter window
-----------------------------------------------
hs.hotkey.bind(hyper, "1", function() resize(0, 0, 2, 2) end)
hs.hotkey.bind(hyper, "2", function() resize(1, 0, 2, 2) end)

-----------------------------------------------
-- Hyper i to show window hints
-----------------------------------------------
hs.hotkey.bind(hyper, "i", function() hs.hints.windowHints() end)


hs.hotkey.bind(hyper, "q", function() chatmode() end)

-----------------------------------------------
-- Hyper wsad to switch window focus
-----------------------------------------------
hs.hotkey.bind(hyper, 'w', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(hyper, 's', function() hs.window.focusedWindow():focusWindowSouth() end)
hs.hotkey.bind(hyper, 'a', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(hyper, 'd', function() hs.window.focusedWindow():focusWindowEast() end)
