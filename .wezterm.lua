local wezterm = require 'wezterm'

local config = {}

config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = 'nightfox'
config.window_background_opacity = 1
config.font_size = 10
config.font = wezterm.font 'Fira Code'
config.default_domain = 'WSL:Ubuntu'
config.wsl_domains = wezterm.default_wsl_domains()
--config.wsl_domains = {
--  {
--    name = 'WSL:Ubuntu',
--    distribution = 'Ubuntu',
--    default_cwd = "~"
--  },
--}

config.keys = {
  {key="t", mods="CTRL|SHIFT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
  {key="f", mods="CTRL|META", action=wezterm.action.ToggleFullScreen},
  {key="|", mods="CTRL|SHIFT", action=wezterm.action.SplitHorizontal{domain = 'CurrentPaneDomain'}},
    {
    key = "L",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ShowLauncherArgs { flags = "LAUNCH_MENU_ITEMS" },
  },
  -- {key = 'L', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay},
  {
    key = "P",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SpawnCommandInNewTab {
      args = { "powershell.exe" },
    },
  },
--  {key = 'v', mods="CTRL", action = wezterm.action_callback(function(window, pane)
--    wezterm.run_child_process({ 'sh', '-c', 'echo hello world'})
--  end)}
}

for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivateTab(i - 1),
  })
  -- F1 through F8 to activate that tab
  table.insert(config.keys, {
    key = 'F' .. tostring(i),
    action = wezterm.action.ActivateTab(i - 1),
  })
end

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
--config.hide_tab_bar_if_only_one_tab = true

config.launch_menu = {
  {
    label = "WSL",
    args = { "wsl.exe" },
  },
  {
    label = "PowerShell",
    domain = { DomainName = "local" },
    args = { "powershell.exe" },
  },
  {
    label = "Command Prompt",
    domain = { DomainName = "local" },
    args = { "cmd.exe" },
  },
}




return config
