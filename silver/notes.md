## Niri in Display Manager

`lightdm` wasn't listing `niri` as an option

```sh
$ sudo mv /usr/{local/,}share/wayland-sessions/niri.desktop
```

should probably add an icon


## Onscreen keyboard
Cinnamon's virtual keyboard doesn't seem to launch from fuzzel
Would be neat to have a virtual keyboard underneath wezterm in the same column


## systemd niri processes

[Wiki Reference](https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup)

> Unlike `spawn-at-startup`, `systemd` lets you easily monitor their status and output, and restart or reload them.


## Backspace sends firefox back a page
setting `browser.backspace_action` to `1` in `about:config` fixed it
