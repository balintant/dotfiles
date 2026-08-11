# Dotfiles

Personal macOS bootstrap: `mise run apply` installs packages (brew, brew-cask,
mas), tool versions, and dotfiles from a single mise-driven config. Fork,
override in `mise.local.toml`, done.

## Usage

### Prerequisites

One-time, per machine. Run from the repo root:

```sh
# Install Homebrew, then mise
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/opt/homebrew/bin/brew install mise

# Trust this config
/opt/homebrew/bin/mise trust
```

### Setup

```sh
/opt/homebrew/bin/mise run apply
```

Runs `mise bootstrap --force-dotfiles` (packages + dotfile symlinks + tools),
then `mise install` and `mise upgrade`. Re-run any time the config changes — the
steps converge, so it's safe to repeat.

By default, apply runs unattended: overwrites conflicting dotfiles
(`--force-dotfiles`) and auto-confirms prompts (`--yes`). Pass `--safe` to
drop both and get interactive prompts for anything destructive:

```sh
/opt/homebrew/bin/mise run apply --safe
```

## Configuration

Fork the repo and edit the files under `.config/mise/conf.d/`. Pull upstream to
pick up new packages while keeping your own list.

Per-machine tweaks go in `mise.local.toml` at the repo root — same syntax as
any `conf.d/*.toml`, takes precedence, and is gitignored. Common use:
override `[vars]` consumed by templated dotfiles (mise `mode = "template"`).
Defaults live in `mise.toml`.

| Var              | Used by                                    |
| ---------------- | ------------------------------------------ |
| `git_user_name`  | `~/.config/git/config` → `user.name`       |
| `git_signingkey` | `~/.config/git/config` → `user.signingkey` |

Example `mise.local.toml`:

```toml
[vars]
git_user_name = "Your Name"
git_signingkey = "ssh-ed25519 AAAA..."
```

## Known issues

### Interactive license prompts

Some casks need `mise run apply --verbose` on first install so the interactive
license prompt is visible.

- [ ] `licecap`

### Mise brew-cask fallback

`mise run apply` ends with `brew bundle --global`, which reads `~/.Brewfile`
(symlinked from `dotfiles/home/.Brewfile`). This file holds casks that
mise's brew-cask backend can't install yet. Drop entries as mise gains
support and move them back to `packages-brew-cask.toml`.

- [ ] `arq` — binary artifact resolution fails
- [ ] `blender` — unsupported preflight step: `set_permissions`
- [ ] `docker-desktop` — unsupported postflight step: `symlink`
- [ ] `paragon-ntfs` — unsupported artifact type: `installer`
- [ ] `parallels` — xattr / preflight step failure
- [ ] `parallels-toolbox` — unsupported artifact type: `installer`

## Reference

Built on:

| Tool         | Description                                                                               |
| ------------ | ----------------------------------------------------------------------------------------- |
| [Homebrew][] | Bootstraps [Mise][]. Everything else is installed via mise (using Homebrew as a backend). |
| [Mise][]     | Single source of truth: packages (brew, brew-cask, mas), tool versions, and dotfiles.     |

Mise auto-loads every `.toml` in `.config/mise/conf.d/` (alphabetical order, all
merged).

| Path                                                                                | Purpose                                                                    |
| ----------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| [mise.toml](mise.toml)                                                              | Root mise config: `[env]`, `[settings]`, `[tools]`, defaults for `[vars]`. |
| [.config/mise/conf.d/dotfiles.toml](.config/mise/conf.d/dotfiles.toml)              | Dotfiles configuration.                                                    |
| [.config/mise/conf.d/macos.toml](.config/mise/conf.d/macos.toml)                    | macOS system defaults (Finder, trackpad, accessibility).                   |
| [.config/mise/conf.d/packages-brew-cask.toml](.config/mise/conf.d/packages-brew-cask.toml) | Packages installed from Homebrew Cask.                              |
| [.config/mise/conf.d/packages-brew.toml](.config/mise/conf.d/packages-brew.toml)    | Packages installed from Homebrew.                                          |
| [.config/mise/conf.d/packages-mas.toml](.config/mise/conf.d/packages-mas.toml)      | Packages installed from the Mac App Store.                                 |
| [.config/mise/conf.d/tasks.toml](.config/mise/conf.d/tasks.toml)                    | The `apply` task.                                                          |
| [dotfiles/home/](dotfiles/home/)                                                    | Files that get installed into `$HOME`.                                     |
| [dotfiles/home/.Brewfile](dotfiles/home/.Brewfile)                                  | Fallback casks for packages mise's brew-cask can't install.                |
| mise.local.toml                                                                     | Machine-local overrides. Gitignored.                                       |

## Mention

Check out [LaTotty's dotfiles](https://github.com/latotty/dotfiles) too.
We've been revamping our 5+ year old configs together!

[Homebrew]: https://brew.sh
[Mise]: https://mise.jdx.dev
