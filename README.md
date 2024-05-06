# :hatching_chick: awesome dotfiles

![Screenshot of my shell prompt](https://i.imgur.com/PeSa8rv.png)

A port of [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles) to work with
[zsh](https://www.zsh.org/).

I use [iTerm](https://www.iterm2.com/), [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh),
[zgen](https://github.com/tarjoilija/zgen), and [Starship](https://github.com/starship/starship).

## What's included

| File                                                                                                 | Purporse                                                                                         |
| ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| [.aliases](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.aliases)                   | A collection of useful aliases.                                                                  |
| [.curlrc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.curlrc)                     | Some basic settings for curl such like hiding curl as  an user agent.                            |
| [.editorconfig](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.editorconfig)         | Consistent coding styles between different editors and IDE.                                      |
| [.exports](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.exports)                   | Consistent coding styles between different editors and IDE.                                      |
| [.extra](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.extra)                       | Everything extra you want to set. I use it for personal settings which i don't want to check in. |
| [.functions](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.functions)               | Functions to be used by aliases.                                                                 |
| [.gdbinit](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.dgbinit)                   | Settings for the DGB Debugger.                                                                   |
| [.gitconfig](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.gitconfig)               | Git configuration settings.                                                                      |
| [.inputrc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.inputrc)                   | Readline configuration.                                                                          |
| [.macos](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.macos)                       | MacOS configuration and useful settings.                                                         |
| [.screenrc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.screenrc)                 | Screen configuration.                                                                            |
| [.starship.toml](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.theme)               | Settings for Starship Prompt.                                                                    |
| [.tmux.conf](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.tmux.conf)               | Tmux configuration.                                                                              |
| [.wgetrc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.wgetrc)                     | Wget configuration.                                                                              |
| [.zshrc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.zshrc)                       | ZSH configuration. This loads the zgen plugin manager and oh-my-zsh with it's plugins            |
| [install-dnssec.sh](https://github.com/soerenmartius/awesome-dotfiles/blob/master/install-dnssec.sh) | Install script for setting up DNSSEC with dnscrypt and dnsmask                                   |
| [bootstrap.sh](https://github.com/soerenmartius/awesome-dotfiles/blob/master/bootstrap.sh)           | Install script. Copies all dotfiles to your $HOME directory                                      |

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and
remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails.
Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a
symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/soerenmartius/awesome-dotfiles.git && cd awesome-dotfiles && source bootstrap.sh
```

To update, `cd` into your local `awesome-dotfiles` repository and then:

```bash
source bootstrap.sh
```

**Note:** Running `source bootstrap.sh` won't copy `.macos` and `.brew.sh`.

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

To perform a dry-run and list files which will be overwritten in your home directory:

```bash
set -- -n; source bootstrap.sh
```

**Note:** Once `boostrap.sh` copied all relevant files you should reload your configuration `source ~/.zshrc`.

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/soerenmartius/awesome-dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,.osx,LICENSE}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands
without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Soren Martius"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="soeren.martius@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global core.fileMode false
git config --global user.signingkey YOURGPGKEYID

```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably
better to [fork this repository](https://github.com/soerenmartius/awesome-dotfiles/fork) instead, though.

### Zgen

[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and all related plugins are loaded using [zgen](https://github.com/tarjoilija/zgen).
The configuration is located in `~/.zshr` and will automatically reload if you add changes to that file. If you are
willing to add more plugins for `oh-my-zsh` you do that using `zgen load`.

### Customize Starship Prompt

You can overwrite settings for the Starship Prompt in `~/.starship.toml`.
For details please read the [documentation](https://starship.rs/config/).

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./.macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](https://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

Some of the functionality of these dotfiles depends on formulae installed by `brew.sh`. If you don’t plan to run `brew.sh`, you should look carefully through the script and manually install any particularly important ones. A good example is Bash/Git completion: the dotfiles use a special version from Homebrew.

### Install DNSSEC

This reposiory comes with a handy [install script](https://github.com/soerenmartius/awesome-dotfiles/blob/master/install-dnssec.sh)
that helps you setting up
[DNSSEC](https://de.wikipedia.org/wiki/Domain_Name_System_Security_Extensions)
with [dnscrypt](https://www.dnscrypt.org/) and
[dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html).

```bash
source install-dnssec.sh
```

## Feedback

Suggestions/improvements are
[welcome](https://github.com/soerenmartius/awesome-dotfiles/issues)!

## Author

[Soren Martius](https://www.linkedin.com/in/soerenmartius/)

## Thanks to…

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)

```
# sudo: auth account password session
auth       optional       /opt/homebrew/lib/pam/pam_reattach.so
auth       sufficient     pam_tid.so
```
