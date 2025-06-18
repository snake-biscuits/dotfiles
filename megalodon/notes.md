> TODO: writing `.desktop` entries (`desktop-file-edit`?)


## No Sound
```bash
$ pulseaudio --start
```

## Foobar
```bash
$ wine ~/.wine/drive_c/"Program Files (x86)"/foobar2000/foobar2000.exe
```

## CD Playback
```bash
$ mplayer -cdrom-device /dev/cdrom cdda://
```
> NOTE: CDDA can be indentified with a database keyed to track count and lengths

## Screenshot
```bash
$ grim -g "$(slurp)" - | swappy -f -
```

## Bottles
```bash
$ flatpak run com.usebottles.bottles
```

## System Crash Logs
```bash
$ journalctl --since=today
$ journalctl --boot=-0  # errors noticed on startup
$ journalctl --boot=-1  # log of previous boot until crash
```

## GTK4 SIGSEGV
https://superuser.com/questions/1856407/both-pavucontrol-and-pwvucontrol-throw-segfault-errors-post-system-update
https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg1992482.html
```bash
$ GDK_DISABLE=vulkan pavucontrol
```

```bash
# ~/.bash_profile
export GDK_DISABLE=vulkan
```

> TODO: remove environment variable once a fix comes out


## Restart waybar
```bash
$ nohup waybar &
```
`nohup` keeps it open when the terminal is closed
ending with `&` disconnects the terminal so you can keep using it
will still get some output to stdout though
also copies stdout to nohup.out

> Super+Shift+C to reload the sway config also works


## Get font for specific character
Ctrl+Shift+U in terminal to get unicode character list
```bash
$ fc-list :charset=<code>
```
where `<code>` is hexadecimal after `U+`

> NOTE: firefox puts the codes in boxes for missing characters
> -- can use this to google the missing charset & find a font for it
> -- did this for Hangul (korean alphabet)


## `.jsonc`
```bash
$ bat --generate-config-file
$ nvim `bat --config-file`
# add: --map-syntax "*.jsonc:JSON"
```

```bash
$ sed 's/\/\/.*//' *.jsonc | jq '.'
```
> NOTE: only catches inline comments


## ImageMagick
```bash
$ magick display file.ext
```


## SSH
Veronica Explains on YouTube: [OpenSSH for Absolute Beginners](https://www.youtube.com/watch?v=3FKsdbjzBcc)

```bash
$ # on server
$ systemctl status sshd  # check if it's running
$ systemctl start sshd
$ systemctl stop sshd
```

On the **client**, register host ip in `/etc/hosts`
```
192.168.1.XXX  remote_hostname
```

> NOTE: if the server isn't on Ethernet, it's ip address may drift

`~/.bashrc` equivalent goes in `~/.ssh/rc` on host

> NOTE: `.bashrc` runs after `~/.ssh/rc` & can override environment variables
> NOTE: any `echo` or `printf` on connect will mess with `scp` (file transfers)

```bash
# in server `~/.bashrc`, `~/.bash_profile` or `~/.ssh/rc`
if [[ -z "$SSH_CONNECTION" ]]; then  # we are NOT connected over ssh
if [[ -n "$SSH_CONNECTION" ]]; then  # we ARE connected over ssh
# you can use this to set an alternate $PS1
```

```bash
$ # on client
$ ssh-keygen -t ed25519 -f ~/.ssh/<server_hostname> -C "<user>@<client_hostname>"
$ ssh-copy-id -i ~/.ssh/<server_hostname> <user>@<server_hostname>
```

On the **server** in `/etc/ssh/sshd_config`, change these settings
```
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
```
make sure these lines aren't commented out!

On the **client**, create / append to `~/.ssh/config`:
```
Host <server_hostname>
    HostName <ip address>
    IdentityFile ~/.ssh/<server_hostname>
    User <user>
```


## Reinstall Steam
```bash
$ rm -rf ~/.local/share/Steam
$ sudo pacman -S --overwrite="*" steam
```

> NOTE: removes all installed games
> -- including NorthstarProton! gotta reinstall...


## Add new Syntax to `bat`
Need to write a file in `~/.config/bat/syntaxes/`
USDA syntax for vim: [superfunc/usda-syntax](https://github.com/superfunc/usda-syntax)

### Manpage excerpt: Adding Custom Languages
bat supports Sublime Text .sublime-syntax language files,
and can be customized to add additional languages to your local installation.
To do this, add the .sublime-syntax language files to `$(bat --config-dir)/syntaxes`
and run `bat cache --build`.

Example:
```bash
$ mkdir -p "$(bat --config-dir)/syntaxes"
$ cd "$(bat --config-dir)/syntaxes"

$ # Put new '.sublime-syntax' language definition files
$ # in this folder (or its subdirectories), for example:
$ git clone https://github.com/tellnobody1/sublime-purescript-syntax

$ # And then build the cache.
$ bat cache --build
```

Once the cache is built, the new language will be visible in `bat --list-languages`.
If you ever want to remove the custom languages, you can clear the cache with `bat cache --clear`.


## iPhone Screen Sharing

> NOTE: cannot share AppleTV Video due to DRM, but will share audio

```bash
$ systemctl start avahi-daemon
$ uxplay
```


## mpd

Installed `mpd`, `mpc` & `rmpc`; it was hell

Build a **full** config in `~/.config/mpd/mpd.conf`
`touch` / `mkdir` all folders & files listed

essential plugins: `output` (pulse), `decoder` (flac), `archive_plugin` (zzip)

> NOTE: `.rar` is unsupported, I need to rezip my music

```sh
$ systemctl --user start mpd
$ # TODO: enable socket
$ mpc enable <ouput name>
$ mpc update
$ mpc ls  # to find your music
$ mpc add <song name>
$ mpc play
```

`man mpc` is your friend

> TODO: how to use sticker to update track metadata
> -- or will i have to extract and clean up the files myself?

> TODO: playerctl & mediakeys config

> TODO: upnp plugin


## ISO Image Burning
`balena-etcher` doesn't like wayland
needs a GUI `polkit` of some kind

`justdd` works great
make sure to run it from terminal otherwise it tries to open `polkit` in `/dev/tty` & fails
