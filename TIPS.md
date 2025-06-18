# General Linux Tips

Some of the most powerful linux tools live in the terminal
It helps to be a super user
Arch especially expects you to be one

> TODO: point people towards "awesome-X" lists on GitHub

## Which Linux Distro?
Do not choose Arch as a first Distro!
Arch frequently breaks and it's your job to fix it
You have to build and maintain almost everything yourself
Highly controlable at high risk to your machine
Can learn a lot from the experience, but it can be draining

Something Debian would be better:
 * Linux Mint
 * Debian
 * Ubuntu

## Read The Manual
Lots of linux software comes with manpages
A standardised form of documentation
Not super helpful for a beginner
Handy if you forgot a command or want to find a feature

lots of manpages are also available online in html form
if you prefer reading them in a web browser

`pacman -Si <package>` can also give links to official sites

### `man`
read up on a specific piece of software

> TODO: sections, `intro.1` & how to search

`/` searches down, `<Esc>` cancels search
`?` searches up


### `apropos`
search based on keywords
`-s 1` to filter only section 1 manpages


### `whatis`
prints the summary from the top of a manpage


## Common Keyboard Shortcuts

> **NOTE: terminals don't have an undo button!**
> -- **make sure you know what you're doing isn't going to break anything**
> -- **be cautious when running code you found online**

> TODO: legacy of `ed`, `sed` & `awk`
> TODO: vim control scheme

`q` / `Ctrl+Q` to quit

`Ctrl + C` / `Ctrl + X` can interrupt running processes
like undo, but not entirely

`:` to start a command (vim-like)

`/` & `?` search for regular expressions (forward & backward)
`less`, `man` & `vim` all use this
the search gets typed in near the bottom left of the terminal if you can't see it
cancel a search with `<Esc>`
arrow keys might not work to fix mistakes, but backspace should

### Regex
**Reg**ular **Ex**pressions are a common tool for searching text

> TODO: find and replace with groups
