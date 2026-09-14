![cat gif](https://lh4.googleusercontent.com/-FPZu4NDqRQ8/T88afJDgWtI/AAAAAAAAGYE/T5pRX9BcdY0/s360/100.gif "cat gif")

## New machine setup

1. Clone this repo to `~/config`:
   ```
   git clone git@github.com:jonesdeini/config.git ~/config
   ```
2. Install [mise](https://mise.jdx.dev) (not managed by this repo --
   it has to exist before anything else here can run):
   ```
   curl https://mise.run | sh          # macOS
   sudo pacman -S mise                 # Arch
   ```
   Make sure it's on `PATH` (`mise.run` installs to `~/.local/bin`,
   which needs adding by hand on a shell that hasn't loaded this
   repo's fish config yet -- `export PATH="$HOME/.local/bin:$PATH"`).
3. Install fish and kitty -- neither is in mise's registry (they're
   apps, not CLI dev tools), so they need their own OS-level install:
   ```
   # fish
   #   macOS: download the .pkg from https://fishshell.com and run it
   sudo pacman -S fish                 # Arch

   # kitty
   curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin  # macOS -> /Applications/kitty.app
   sudo pacman -S kitty                # Arch
   ```
4. `mise install chezmoi` -- named explicitly, since there's no
   `~/.config/mise/config.toml` yet for a bare `mise install` to read
   (that file is itself one of the things chezmoi is about to deploy).
5. `` $(mise which chezmoi) init --source ~/config --apply `` -- points
   chezmoi at this repo (recorded for future runs via
   `.chezmoi.toml.tmpl`, no need to pass `--source` again) and writes
   every managed file into `$HOME`, config.toml included. `mise which`
   just prints the installed binary's path, so this works in whatever
   shell you're bootstrapping from -- no activation needed for a
   one-off call.
6. `mise install` -- config.toml exists now, so this picks up the
   rest of the declared tools (`claude`, `github-cli`, `zoxide`).
7. `chsh -s /usr/local/bin/fish` (macOS) or `chsh -s /usr/bin/fish`
   (Arch) if fish isn't already the login shell.

Done -- open a new shell, everything (aliases, prompt, `mise
activate`, `zoxide`) is live.

## Day to day

- Edit files in this repo, then run `chezmoi apply` to sync them out
  to `$HOME`. They're real files chezmoi writes, not symlinks --
  editing the deployed copy in `$HOME` directly does *not* edit the
  repo.
- To add a CLI tool: add it under `[tools]` in
  `dot_config/mise/config.toml`, then `chezmoi apply && mise install`.
- `chezmoi diff` previews what `apply` would change before you commit
  to it.

## Why chezmoi, and why it's installed via mise

[Omarchy's manual](https://github.com/basecamp/omarchy) points at GNU
Stow for this same job, but Stow isn't a distributable binary -- on
macOS it needs Homebrew or MacPorts, neither of which this setup uses.
chezmoi ships as a single static binary, so `mise install` handles it
exactly like any other tool here.

That does mean chezmoi depends on mise, which depends on... nothing
managed by this repo -- mise is a hard prerequisite either way (step 2
above), since `claude`/`github-cli`/`zoxide` already needed it before
chezmoi did. The one cost: on a *brand new* machine, nothing in this
repo can be applied until mise's own install succeeds. If that's ever
a problem, chezmoi also has its own standalone installer
(`sh -c "$(curl -fsLS get.chezmoi.io)"`, same category as `mise.run`)
that works with no mise involved at all.
