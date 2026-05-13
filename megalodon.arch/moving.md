## TODOs
 - [ ] **OVERHEATING / CRASHES**
       case is know to have poor airflow, more fans?
       is cpu fan good?
       is there a software solution?
	   cpu is overclocking up to 4.8Hz, could we set a limit?
   - [x] ran `sensors-detect`
   - [x] set up `waybar-temperature`
   - [ ] use `notify-send` to warn when CPU temp is high (75C+)
         might need `chrontab` to dispatch a script to check temp?
   - [x] try moving to top of rack for better airflow
   - [ ] could be main NVMe
     - [ ] put gpu on a riser
 - [x] dotfiles repo
   - [x] list of installed software and why (software.md)
   - [ ] summaries & links to guides followed (sources.md)
 - [x] get ownership of harddrives as user, not root
       `$ sudo chown -R bikkie /home/bikkie/drives/`
 - [x] move files over from old PC
       `scp` via OpenSSH
 - [ ] move over Anki flashcards
       haven't done them in a while
 - [x] need `GDK_DISABLE=vulkan` to run Gtk4 apps
       added `export GDK_DISABLE=vulkan` to `~/.bash_profile`
 - [ ] `sway`
   - [ ] split into multiple files & include them
     - [ ] `hardware` (output & input)
     - [ ] `keybinds`
     - [ ] `theme`
   - [ ] Corsair K83
     - [x] volume scrollwheel
     - [ ] scroll with joystick
     - [ ] two-finger scrolling
     - [ ] bind rear buttons
   - [x] bind media keys (via `playerctl`)
 - [ ] `playerctl`
   - [ ] prioritise `mpd` if other players are paused
 - [x] `waybar`
   - [x] power menu
 - [x] notepadqq crashing within seconds
   - [x] installed `qt5-wayland`
   - [x] installed `mathjax2`
   - [x] disabled "Settings > Preferences > General > Backup Open Documents"
         from [GitHub Issue #1108](https://github.com/notepadqq/notepadqq/issues/1108)
 - [ ] file browser (`nautilus`)
   - [ ] open archives w/ `p7zip-gui`
         currently extracts instead
   - [ ] try `dolphin`
 - [ ] `nvim`
   - [ ] not yanking to clipboard (`"*y`) like Ctrl+Shift+C in terminal
     wl-copy & wl-paste (wl-clipboard) aren't being detected?
     `"+y` works fine, ":help quotestar" explains the difference
     `"+p` can paste! didn't know that!
   - [x] set shiftwidth etc. to 2 spaces for html (ftplugin)
 - [ ] clipboard history tool
       would be **nice-to-have**
 - [x] `mpd`
   - [x] `rmpc`
   - [x] `playerctl` interface via `mpd-mpris`
   - [ ] upnp
   - [ ] metadata
     - [ ] 1 folder per disc
     - [ ] album art (covers, discs, booklets)
       - [ ] separate images in `.zip` w/ `.mp3`s
       - [ ] find songs with no cover art
   - [ ] disc ripping
   - [ ] `.wav` -> `.mp3` w/ metadata
 - [ ] Display Manager
   - [ ] `gdm`
     apparently works well with sway
     configuration looks like a pretty rough experience
   - [ ] configs
     - [ ] `sway.desktop`
     - [ ] `niri.desktop`
     - [ ] `kodi.desktop`
           [Wiki](https://wiki.debian.org/Kodi#Starting_Kodi_using_a_display_manager)
 - [ ] `niri`


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
