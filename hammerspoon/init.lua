-- CMQ timer {{{
CMD_Q_TIMER = nil
CMD_Q_ALERT = nil

local function cmdQCleanup()
  hs.alert.closeSpecific(CMD_Q_ALERT)
  CMD_Q_TIMER = nil
  CMD_Q_ALERT = nil
end

local function stopCmdQ()
  if CMD_Q_TIMER then
    CMD_Q_TIMER:stop()
    cmdQCleanup()
    hs.alert("quit canceled",0.5)
  end
end

local function startCmdQ()
  local frontmostApplication = hs.application.frontmostApplication()
  local cmdQDelay = 2

  if (frontmostApplication:name() ~= 'Safari') then
    local app = hs.application.frontmostApplication()
    CMD_Q_TIMER = hs.timer.doAfter(cmdQDelay, function() app:kill(); cmdQCleanup() end)
    CMD_Q_ALERT = hs.alert("hold to quit " .. app:name(), true)
  end
end

hs.hotkey.bind({"cmd"},"q",startCmdQ,stopCmdQ)
-- }}}

-- Relad config on file modify {{{
local function reloadConfig(files)
  local doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config Reloaded")
-- }}}

-- Switch apps shortcut {{{
hs.hotkey.bind({ "cmd" }, "1", function()
  hs.application.open('Slack')
end)

hs.hotkey.bind({ "cmd" }, "2", function()
  hs.application.open('Safari')
end)

hs.hotkey.bind({ "cmd" }, "3", function()
  hs.application.open('iTerm')
end)

hs.hotkey.bind({ "cmd" }, "4", function()
  hs.application.open('Google Chrome')
end)

hs.hotkey.bind({ "cmd" }, "5", function()
  hs.application.open('Discord')
end)

hs.hotkey.bind({ "cmd" }, "6", function()
  hs.application.open('Spotify')
end)

hs.hotkey.bind({ "cmd" }, "7", function()
  hs.application.open('Insomnia')
end)

hs.hotkey.bind({ "cmd" }, "8", function()
  hs.application.open('zoom.us')
end)
-- }}}

-- Mute system microphone globally {{{
local micMute = hs.loadSpoon("MicMute")
micMute:bindHotkeys({toggle={{"cmd", "shift"}, "m"}})
-- }}}
