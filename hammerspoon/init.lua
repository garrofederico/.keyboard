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
  p = 'Pycharm'
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