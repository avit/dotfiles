# .zprofile -- loaded if login shell        .zshenv .zprofile .zshrc .zlogin
# .zshenv -- always loaded                  .zshenv .zprofile .zshrc .zlogin
# .zshrc -- loaded if interactive shell     .zshenv .zprofile .zshrc .zlogin

. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
