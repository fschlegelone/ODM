# ODM - One Dotfile Manager 󱣇

[![License](https://gist.githubusercontent.com/fschlegelone/7ba6ac2cf19fbd45c306ea28364eea3a/raw/1ecbe7f0227b67a9b33752f195eb002878f8dc1f/license_mit_mauve.svg)](LICENSE)

## Description 

### The first Dotfile Manager that doesnt suck!

The goal of ODM is to get rid of all bullshit we know from other Dotfile Managers and keep the critical process of managing your dotfiles as simple & secure as possible.

## Supported Platforms ☑︎

Since the Dotfile problem typically occurs on Unixish Operating Systems such as Linux & MacOS, Windows is not supported by this awesome Dotfile Manager.

- [Linux](https://www.linux.org/)
- [MacOS](https://www.apple.com/macos)
- [Docker](https://www.docker.com/) & [Podman](https://podman.io/) (Coming soon..)

## Prerequisites 

Prerequisites are automatically installed by ODMs Initialization Script.
If you can't or dont wanna use it, you can manually install them.

- [Git](https://git-scm.com/)
- [Gum](https://github.com/charmbracelet/gum)

## Installation 

2 Simple Steps to get started.

**note: Sudo rights required.**
**: Repository needs to be cloned to ~/ODM**

1. Clone the repository

   ```shell
   git clone https://github.com/fschlegelone/one_dotfile_manager.git ~/ODM
   ```

2. Run Main Script
   ```shell
   ~/ODM/run.sh
   ```

## Usage 󰣿

Make sure you understand these concepts before rushing into the usage:

1. The Dotfile Storage is your **Single Point of Truth** for all your dotfiles. It is located at `~/ODM/dotfiles`.
   If you delete a file there, it's gone.
   If you add a file to it, it overrides the dotfile in your home directory on the next sync.
2. The Dotfile Sync is the process of copying the dotfiles from the Dotfile Storage to your home directory.
   It is triggered by the `sync` command.
3. The Dotfile Storage can be backed up using the 'backup' command.
   It creates a tarball of the dotfiles and stores it in `~/ODM/backups`.
   !NOT WORKING YET!
