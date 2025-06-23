## `.bashrc`
 - [ ] `ls` aliases
 - [ ] `alias bat='batcat'`
 - [ ] `$PS1`
   - [ ] time
   - [ ] match megalodon colours
   - [ ] show hostname on ssh
 - [ ] limit `cwd` depth to 3


## `.gitconfig`
> also need to set up ssh key
 - [ ] gpg signing


## Random screen dimming
why is it happening? seems like idle but it doesn't undo itself
only in Cinnamon-wayland?


## Wezterm window scales incorrectly
Fullscreen / maximise / snap to screen side doesn't move window
Appears to be a wayland issue:
```lua
config.enable_wayland = False
```
solution found in [wezterm issue](https://github.com/wezterm/wezterm/issues/6203)


## Scrolling firefox with touchscreen
Works in `wayland` but not `X`
