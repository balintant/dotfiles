# Toolset

| Tool         | Description                                                                                        |
| ------------ | -------------------------------------------------------------------------------------------------- |
| [Homebrew][] | Manages applications, system-wide binaries, and vscode plugins. (Including [Mise][] and [Stow][]). |
| [Mise][]     | Manages tools that are usually project specific (eg. nodejs version).                              |
| [Stow][]     | Symlinks the dotfiles, so it's easy to setup and maintain this repository.                         |

# Configuration

If you want to use this repository as the template of your own environment, you
should create a [fork](https://github.com/balintant/dotfiles/fork) and update
the configuration as you wish (starting with the files in the table below). This
way you will be able to pull my latest updates while maintaining your own,
personalised version of the configuration.

| File                                       | Description                                               |
| ------------------------------------------ | --------------------------------------------------------- |
| [Brewfile](./Brewfile)                     | Contains apps, packages and vs code extensions.           |
| [Gitconfig](./home/dot-gitconfig)          | Contains git configuration. Change at least the username. |
| [Mise](./home/dot-config/mise/config.toml) | Contains the tools that I regularly use.                  |

# Setup

After running the commands below, your whole environment will be set up and
ready for work.

```shell
# Install Homebrew and the packages managed by it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ./Brewfile

# Symlink the configuration files
stow -R --dotfiles -t "$HOME" home

# Trust & Install the packages managed by `mise`
mise trust
mise install
```

[Homebrew]: https://brew.sh
[Mise]: https://mise.jdx.dev
[Stow]: https://www.gnu.org/software/stow/

# Updates

You can update the [Brewfile](./Brewfile) with the following command:

```
brew bundle dump --force --file ./Brewfile
```

# Mention

Check out [LaTotty's dotfiles](https://github.com/latotty/dotfiles) too.
We've been revamping our 5+ year old configs together!
