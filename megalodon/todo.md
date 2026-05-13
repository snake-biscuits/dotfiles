# TODO List


## Software

 * keep updating `software.jsonc`
   - log what gets installed & uninstalled (nix would've been smart)
 * try out `nix` (`pikman i nix-systemd-setup`)
   - can give us vesktop (need to wrap w/ `nixGL` via `home-manager`)
   - need to figure out what a nix python dev environment looks like


## Storage

Mount additional `btrfs` drives


```sh
$ lsblk --fs  # get uuids & filesystem formats
$ cp /etc/fstab ~/fstab.bak
$ sudoedit /etc/fstab
# UUID=... /data/nvme btrfs  ... 0 0
# UUID=... /data/ssd1 btrfs  ... 0 0
# NOTE: no subvolumes, keeping drives separate
$ mount --fake --all --verbose  # validate fstab
$ sudo mkdir /data/
$ sudo mkdir /data/{nvme,ssd{1,2}}
$ sudo mount --all --verbose
$ sudo chown -R $USER:$USER /data/  # after `sudo mount`
# NOTE: chown persists on reboot
# check lsblk, /etc/mtab & journal to confirm
$ rm ~/fstab.bak  # success!
```


## Setup

 * `Code/Repos/`
   - ~~copy from backup~~
   - ~~`git clean -fdx` (`--dry-run` first)~~
   - migrate to Codeberg
   - look at SourceHut
   - new `dotfiles/` entry for new `megalodon/` (keep `megalodon.arch/`)
 * ~~log in to firefox~~
 * music
   - mpd, mpc & rmpc
   - install w/ nix?
 * ~~video~~
   - ~~qbittorent, tor, mpv~~
 * vimwiki
   - neovim? (need to switch to regular markdown controls)
 * ~~neovim~~
   - ~~test clipboard (`"+y`, `Ctrl+Shift+C` etc.)~~  (no changes required)
 * btrfs
   - ~~mount drives~~
   - snapshots (automated with system updates, boot snapshot)
   - gui?
   - good quality guides
 * dev environment(s) (nix-shell?)
   - manage w/ nix flakes (stable GCC target & dependencies)
   - valgrind, gdb, gcc, make, cmake, python (uv?)
 * ~~copy backups~~
   - ~~learn rsync & take notes~~
   - ~~ssd1, ssd2 & nvme~~
   - ~~configs~~
   - ~~flycast saves (didn't back up ~/.local/)~~
   - ~~.gitconfig~~
   - ~~.ssh/ (ssh & gpg keys)~~
   - `silver` todo list (markdown file on desktop)
 * try zsh
 * check pikman for optional manpages we don't have
 * does the blu-ray player work now? can we get dvd playback?
 * vimwiki
 * ~~configure hypridle~~ (commented out of niri config)
 * harden `/etc/ssh/sshd_config`
   - disable text passwords

> NOTE: mDNS is provided by `avahi-daemon`, not `systemd-resolved`


## rsync

```
$ rsync --dry-run -ah --partial --info=progress2 --no-i-r from/ to/
# `from/` is different to `from`
# the latter will create a subfolder
# --dry-run for testing (-v helps too, but not for big copies)
# -ah for --archive (multiple flags) & --human-readable
# --partial for better behaviour when interrupted (--append-verify to follow up)
# --info=progress2 for shiny new progress line
# --no-i-r for more accurate progress indicator (check total size **before** copy)
```


## Switching Package Managers
### Reverse Dependencies
```sh
$ pacman -Sii ${package}
$ apt-cache rdepends --installed ${package}
```

### Files of Package
```sh
$ pacman -Fl ${package}
$ dpkg -L ${package}
```

### Package of File
```sh
$ pacman -Qo ${filepath}
$ dpkg -S ${filepath}
```


## nix
```sh
$ nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
$ nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl  # redundant?
$ nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
$ nix-channel --update
$ nvim ~/.config/home-manager/home.nix  # wrap graphical programs w/ nixGL
$ home-manager switch  # apply changes
```

> TODO: adding `~/.nix-profile` to paths (`$PATH` & `$XDG_DATA_DIRS`)

> TODO: enabing flakes in `~/.config/nix/nix.conf`

> TODO: `nix profile`

> TODO: nix dev environment(s)
