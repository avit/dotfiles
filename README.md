# Andrew's Dotfiles

Sets up a shell environment with helpful "rc" files for working with with common tools. This package is organized as plugins that can be installed and organized independently.

## Install

Clone this repository to your home directory, e.g.:

    git clone --recursive https://github.com/avit/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles

All installation is handled through the `rake` task. Run the default `rake` task for more info or see `rake -T` for a list of available plugins:

    rake git:install   # ~/.gitexcludes ~/.gitconfig
    rake install       # Install all / zsh / git / ruby / tmux / vim
    rake ruby:install  # ~/.autotest ~/.gemrc ~/.irbrc ~/.railsrc ~/.rdebugrc
    rake tmux:install  # ~/.tmux.conf
    rake vim:install   # ~/.vimrc ~/.gvimrc ~/.vim
    rake zsh:install   # ~/.zshrc

Each of these tasks runs the installer for a particular plugin. `rake install` will run all of them. Note that some of these will prompt you for user input such as your name and email for the git config.
