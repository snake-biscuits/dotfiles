## TODOs
 - [ ] **CPU OVERHEATING**
       case is know to have poor airflow, more fans?
       is cpu fan good?
       is there a software solution?
	   cpu is overclocking up to 4.8Hz, could we set a limit?
   - [x] ran `sensors-detect`
   - [x] set up `waybar-temperature`
   - [ ] use `notify-send` to warn when CPU temp is high (75C+)
         might need `chrontab` to dispatch a script to check temp?
   - [x] try moving to top of rack for better airflow
 - [ ] dotfiles repo
 - [ ] summaries & links to guides followed (sources.md)
 - [ ] list of installed software and why (software.md)
 - [x] get ownership of harddrives as user, not root
       `$ sudo chown -R bikkie /home/bikkie/drives/`
 - [ ] Zenless Zone Zero graphical glitches & crashes
       `DXVK_CONFIG` environment variable might've fixed crashes
       ~~still get fullscreen polygons sometimes, idk why~~
       installing `amdvlk` seems to have helped (vulkan drivers)
       still getting CPU crashes
 - [x] ethernet (cable wasn't plugged all the way in)
 - [x] move files over from old PC
       set up openssh; use `scp`
 - [ ] move over Anki flashcards
       haven't done them in a while
 - [x] need `GDK_DISABLE=vulkan` to run Gtk4 apps
       added `export GDK_DISABLE=vulkan` to `~/.bash_profile`
 - [ ] sway config
   - [ ] trackpad gestures
   - [ ] bind media keys (Volume +/-)
 - [x] waybar config
   - [x] power menu
 - [x] notepadqq crashing within seconds
   - [x] installed `qt5-wayland`
   - [x] installed `mathjax2`
   - [x] disabled "Settings > Preferences > General > Backup Open Documents"
         from [GitHub Issue #1108](https://github.com/notepadqq/notepadqq/issues/1108)
 - [ ] open archives in nautilus with p7zip-gui rather than extracting
 - [ ] nvim
   - [ ] not yanking to clipboard (`"*y`) like Ctrl+Shift+C in terminal
     wl-copy & wl-paste (wl-clipboard) aren't being detected?
     `"+y` works fine, ":help quotestar" explains the difference
     `"+p` can paste! didn't know that!
   - [x] set shiftwidth etc. to 2 spaces for html (ftplugin)
 - [ ] a clipboard history tool like I have on Ubuntu? would be **nice-to-have**
 - [ ] ~~Foobar2000~~
   - [ ] Eole theme javascript winapi is crashing
         need more 32-bit wine packages?
 - [x] mpd
   - [x] rmpc
   - [ ] media keys
   - [ ] playerctl
   - [ ] upnp


### Configs (dotfiles)
 - [x] vim
       `.vim/vimrc`
 - [x] nvim
       `.config/nvim/init.lua`
       `.config/nvim/lua/config/lazy.lua`
       `.config/nvim/lua/options.lua`
       `.config/nvim/lua/plugins/init.lua`
       `.config/nvim/ftplugin/html.vim`
       `.config/nvim/ftplugin/json.vim`
       `.config/nvim/ftplugin/jsonc.vim`
 - [x] sway
       `.config/sway/config`
 - [x] waybar
       `.config/waybar/config.jsonc`
       `.config/waybar/power_menu.xml`
       `.config/waybar/style.css`
 - [x] wezterm
       `.wezterm.lua`
 - [x] wofi
       `.config/wofi/config`
       `.config/wofi/style.css`
