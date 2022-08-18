-- Specify your combination (your hyperkey)
local hyper = { "cmd", "alt", "ctrl", "shift" }
-- We use 0 to reload the configuration
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)
-- Notify about the config reload
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

-- these are only my favourite apps, you can replace it with yours
local applicationHotkeys = {
  o = 'Google Chrome',
  i = 'iTerm',
  u = 'Notion',
  p = 'Pycharm',
  y = 'Finder'
--  s = 'Slack',
--  e = 'IntelliJ IDEA',
--  q = 'WebStorm',
--  j = 'Music',

}
for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end


-- function to switch to previous window in focus
local previousWindow = hs.window.focusedWindow()
local currentWindow = hs.window.focusedWindow()
hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function()
    if previousWindow ~= currentWindow then
        previousWindow = currentWindow
    end
    currentWindow = hs.window.focusedWindow()
    end)


-- key to switch to previous window in focus
hs.hotkey.bind(hyper, "h", function()
  previousWindow:focus()
end)




-- just a test, to check if this is useful
-- function to switch to previous window
hs.hotkey.bind(hyper, "left", function()
    hs.window.focusedWindow():focusWindowWest()
end)

-- function to switch to previous focused window
hs.hotkey.bind(hyper, "right", function()
    hs.window.focusedWindow():focusWindowEast()
end)
