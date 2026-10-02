# :hatching_chick: awesome dotfiles

![Screenshot of my shell prompt](https://i.imgur.com/PeSa8rv.png)

A port of [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles) to [zsh](https://www.zsh.org/),
grown into the full setup I replicate across my Macs.

I use [Ghostty](https://ghostty.org/) attached to one persistent [tmux](https://github.com/tmux/tmux) session,
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) loaded through [zgen](https://github.com/tarjoilija/zgen),
[Starship](https://github.com/starship/starship), [Neovim](https://neovim.io/) with
[AstroNvim](https://astronvim.com/), and the [1Password SSH agent](https://developer.1password.com/docs/ssh/)
for all SSH keys. tmux windows and running [Claude Code](https://claude.com/claude-code) sessions survive a reboot.

## What's included

| File                                                                                                                       | Purpose                                                                                            |
| -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| [.aliases](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.aliases)                                         | A collection of useful aliases.                                                                    |
| [.asdfrc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.asdfrc)                                           | asdf settings (reads `.nvmrc`, `.terraform-version` and friends as legacy version files).          |
| [.condarc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.condarc)                                         | conda: no auto-activated base environment, TLS verification on.                                    |
| [.curlrc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.curlrc)                                           | Some basic settings for curl such like hiding curl as an user agent.                               |
| [.editorconfig](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.editorconfig)                               | Consistent coding styles between different editors and IDEs.                                       |
| [.exports](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.exports)                                         | Environment variables: editor, history, locale, `$PATH`, Go, GNU tools, the 1Password SSH socket.  |
| [.extra](#add-custom-commands-without-creating-a-new-fork)                                                                 | Everything extra you want to set. I use it for personal settings which I don't want to check in.   |
| [.functions](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.functions)                                     | Functions to be used by aliases.                                                                   |
| [.gdbinit](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.gdbinit)                                         | Settings for the GDB debugger.                                                                     |
| [.gitconfig](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.gitconfig)                                     | Git configuration. Identity and signing key stay in `~/.extra`, see below.                         |
| [.inputrc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.inputrc)                                         | Readline configuration.                                                                            |
| [.macos](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.macos)                                             | macOS configuration and useful settings.                                                           |
| [.screenrc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.screenrc)                                       | Screen configuration.                                                                              |
| [.ssh/config](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.ssh/config)                                   | Points ssh at the 1Password agent. No keys live on disk.                                           |
| [.starship.toml](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.starship.toml)                             | Settings for the Starship prompt.                                                                  |
| [.tmux.conf](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.tmux.conf)                                     | tmux configuration: Ctrl-a prefix, vi keys, TPM with tmux-resurrect and tmux-continuum.            |
| [.tool-versions](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.tool-versions)                             | Global asdf tool versions (terraform, terramate, nodejs, pnpm, opentofu, golangci-lint).            |
| [.wgetrc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.wgetrc)                                           | Wget configuration.                                                                                |
| [.zprofile](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.zprofile)                                       | Homebrew `shellenv` for login shells (Apple Silicon).                                              |
| [.zshenv](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.zshenv)                                           | Rust toolchain on `$PATH` for every zsh, interactive or not.                                        |
| [.zshrc](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.zshrc)                                             | ZSH configuration. Loads zgen and oh-my-zsh with its plugins, then every toolchain that is installed. |
| [.config/ghostty/config](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.config/ghostty/config)             | Ghostty: every window goes through `tmux-work`.                                                    |
| [.config/nvim](https://github.com/soerenmartius/awesome-dotfiles/tree/master/.config/nvim)                                 | Neovim configuration based on AstroNvim.                                                           |
| [.config/alacritty](https://github.com/soerenmartius/awesome-dotfiles/tree/master/.config/alacritty)                       | Alacritty configuration with the Dracula theme. Legacy, Ghostty replaced it.                       |
| [.local/bin/tmux-work](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.local/bin/tmux-work)                 | Starts or joins the `work` tmux server and restores the last snapshot after a reboot.              |
| [.local/bin/claude-resurrect](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.local/bin/claude-resurrect)   | Relaunches a saved Claude Code pane so it resumes its conversation.                                 |
| [.local/bin/tmux-resurrect-claude-ids](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.local/bin/tmux-resurrect-claude-ids) | Post-save hook that stamps Claude Code panes with their session ID.                      |
| [install-dnssec.sh](https://github.com/soerenmartius/awesome-dotfiles/blob/master/install-dnssec.sh)                       | Optional install script for DNSSEC with dnscrypt and dnsmasq.                                       |
| [brew.sh](https://github.com/soerenmartius/awesome-dotfiles/blob/master/brew.sh)                                           | Homebrew formulae, casks, fonts and Mac App Store apps installed on my machines.                    |
| [bootstrap.sh](https://github.com/soerenmartius/awesome-dotfiles/blob/master/bootstrap.sh)                                 | Install script. Copies all dotfiles to your `$HOME` directory and installs zgen and TPM.            |

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and
remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails.
Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I keep it in `~/dev/awesome-dotfiles`.) The bootstrapper script
pulls in the latest version, installs [zgen](https://github.com/tarjoilija/zgen) and
[TPM](https://github.com/tmux-plugins/tpm) if they are missing, copies the files to your home folder and installs the
tmux plugins.

```bash
git clone https://github.com/soerenmartius/awesome-dotfiles.git && cd awesome-dotfiles && source bootstrap.sh
```

To update, `cd` into your local `awesome-dotfiles` repository and then:

```bash
source bootstrap.sh
```

**Note:** Running `source bootstrap.sh` won't copy `.macos` and `brew.sh`; run those from the repository.

To update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

To perform a dry-run and list files which will be overwritten in your home directory:

```bash
set -- -n; source bootstrap.sh
```

**Note:** Once `bootstrap.sh` copied all relevant files you should reload your configuration with `source ~/.zshrc`.

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/soerenmartius/awesome-dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,brew.sh,.macos,LICENSE,CODEOWNERS}
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
`bootstrap.sh` never copies `.extra`, so a stale copy in the clone can't overwrite the one in your home directory.

The checked-in `.gitconfig` deliberately has no `[user]` section. My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Soren Martius"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="soeren.martius@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Commit signing: public half of the 1Password SSH key (see .gitconfig)
GIT_SIGNING_KEY="ssh-ed25519 AAAA..."
git config --global user.signingkey "$GIT_SIGNING_KEY"
mkdir -p ~/.config/git
echo "$GIT_AUTHOR_EMAIL $GIT_SIGNING_KEY" > ~/.config/git/allowed_signers
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably
better to [fork this repository](https://github.com/soerenmartius/awesome-dotfiles/fork) instead, though.

### Zgen

[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and all related plugins are loaded using
[zgen](https://github.com/tarjoilija/zgen). The configuration is located in `~/.zshrc` and will automatically reload
if you add changes to that file. If you want to add more plugins for `oh-my-zsh` you do that using `zgen load`.

Toolchains (asdf, rustup, uv, bun, Java, gcloud, miniconda, Windsurf, rbenv) are wired up further down in `~/.zshrc`,
each guarded by an existence check, so the same file works on a machine that only has some of them installed.

Shell navigation: [fzf](https://github.com/junegunn/fzf) gives `Ctrl-T` (files) and `Alt-C` (directories),
[zoxide](https://github.com/ajeetdsouza/zoxide) gives `z <part of a path>`, and
[atuin](https://github.com/atuinsh/atuin) replaces `Ctrl-R` with a searchable history that can sync between machines
after `atuin register` or `atuin login`.

### Customize Starship Prompt

`~/.zshrc` points Starship at `~/.starship.toml`, which `bootstrap.sh` installs from
[.starship.toml](https://github.com/soerenmartius/awesome-dotfiles/blob/master/.starship.toml).
For details please read the [documentation](https://starship.rs/config/).

### Terminal: Ghostty and a persistent tmux session

Ghostty is configured to run `~/.local/bin/tmux-work` in every window. That script

* joins the tmux session `main` on the server socket `work` if the server is already running,
* otherwise starts the server, restores the last [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
  snapshot, arms [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) autosave (every 15 minutes) and
  then attaches. Several Ghostty windows opening at once wait for that single restore instead of racing it.

The restore is driven from the launcher rather than continuum's own boot hook, because continuum silently skips the
restore when it sees more than one tmux client during the server's first second, which is exactly what happens when
macOS reopens several terminal windows at login. Add Ghostty to *System Settings → General → Login Items* and a
reboot brings every window back on its own.

Running [Claude Code](https://claude.com/claude-code) sessions come back too:

* `.tmux.conf` relaunches saved `claude` panes through `~/.local/bin/claude-resurrect`, which resumes the saved
  conversation (`--resume <id>`) instead of starting a new one.
* `~/.local/bin/tmux-resurrect-claude-ids` runs after every save and stamps each Claude pane with its session ID,
  taken from Claude Code's own process records in `~/.claude/sessions`.
* The `claude` function in `.zshrc` gives new interactive sessions an explicit `--session-id` up front.

Useful keys: the prefix is `Ctrl-a`; `prefix + Ctrl-s` saves a snapshot, `prefix + Ctrl-r` restores one,
`prefix + r` reloads the config, `prefix + |` and `prefix + -` split in the current directory, `prefix + g` opens
lazygit in a popup, `prefix + t` a scratch shell. Snapshots live in `~/.local/share/tmux/resurrect`.

Ghostty forwards macOS-style keys to tmux: `Cmd+1` to `Cmd+9` and `Cmd+0` switch windows, `Cmd+T` opens a window,
`Cmd+D` / `Cmd+Shift+D` split, `Cmd+Shift+[` / `]` move between windows. Every pane shows its title above it, which
for Claude Code is the current conversation summary, and a bell from any window (Claude finishing or waiting for
input) highlights that window and bounces the dock icon.

### SSH keys in 1Password

SSH keys are stored in 1Password and served by its [SSH agent](https://developer.1password.com/docs/ssh/agent/).
`.ssh/config` sets `IdentityAgent` to the agent socket and `.exports` sets `SSH_AUTH_SOCK` to the same path, so both
`ssh` and tools that talk to the agent directly (git, `ssh-add -l`) find the keys. Enable the agent under
*1Password → Settings → Developer* on a new machine. Nothing else needs to be copied.

### Commit signing with 1Password

`.gitconfig` signs every commit with an SSH key stored in 1Password. This is my setup; if you don't use
1Password, see [Without 1Password](#without-1password) below, otherwise every commit fails.

On a new machine:

1. Turn on the 1Password SSH agent (see above).
2. Copy the key's public half (open the key in 1Password, or run `ssh-add -L` to list the agent's keys) into
   `~/.extra` as `GIT_SIGNING_KEY`, as in the [`~/.extra` example](#add-custom-commands-without-creating-a-new-fork).
3. Add it on GitHub as a **Signing Key** so commits show as Verified. That is a separate entry from the
   authentication key, even for the same key: save the public key to a file and run
   `gh ssh-key add key.pub --type signing --title "1Password signing"`.

Migrating from GPG: replace the old `git config --global user.signingkey <GPG key id>` line in `~/.extra`.
Otherwise Git tries to load the GPG key id as an SSH key and fails with `Couldn't load public key`.

#### Without 1Password

Override the signing settings from `~/.extra`. Either turn signing off:

```bash
git config --global commit.gpgsign false
```

or sign with a plain key file instead of 1Password:

```bash
git config --global gpg.ssh.program ssh-keygen
git config --global user.signingkey ~/.ssh/id_ed25519.pub
```

### Touch ID for sudo

`brew.sh` installs `pam-reattach`, which makes Touch ID work for `sudo` inside tmux as well. Create
`/etc/pam.d/sudo_local` with:

```
# sudo_local: local config file which survives system update and is included for sudo
auth       optional       /opt/homebrew/lib/pam/pam_reattach.so
auth       sufficient     pam_tid.so
```

### Neovim

`.config/nvim` is an [AstroNvim](https://astronvim.com/) configuration. `brew.sh` installs Neovim; the plugins
install themselves on the first start.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./.macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](https://brew.sh/) formulae (after installing
Homebrew, of course):

```bash
./brew.sh
```

Some of the functionality of these dotfiles depends on formulae installed by `brew.sh`. If you don’t plan to run
`brew.sh`, you should look carefully through the script and manually install any particularly important ones:
`zsh`, `starship`, `tmux`, `direnv`, `gh`, `neovim` and the GNU tools referenced in `.exports`. The Mac App Store
section at the end needs `mas` and a signed-in App Store.

### Install DNSSEC

This repository comes with an optional [install script](https://github.com/soerenmartius/awesome-dotfiles/blob/master/install-dnssec.sh)
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
