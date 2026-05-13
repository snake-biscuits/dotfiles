# Version Control Tools

## User Scripts
 * scripts live in `~/.scripts`
   - added to `$PATH` in `.bashrc`
 * always open with a shebang
   - `#!/usr/bin/env bash`
 * need exectutable permissions
   - `chmod +x ~/.scripts/*`

### `report`
Check the status of repos in PWD (includes PWD)
 * `fetch` - fetch all repositories
 * `quick` - list all repositiories age (colour) & rank
 * `dirty` - list uncommitted changes
 * launching with no arguments pipes `quick` into `column`

> TODO: rank summaries & age gradient


## GitHub TUI
 * `lazygit`
   - installed, keep forgetting to use
   - at a glance, it's a TUI GitHub Desktop equivalent
 * `gh` [GitHub CLI](https://cli.github.com/)
   - **TODO: INSTALL**
   - `$pacman -S github-cli`
   - `github/hub` was last updated 2 years ago, appears identical
   - can check issues & prs etc. from a terminal
