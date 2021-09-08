# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Essentials
antigen bundle command-not-found
antigen bundle sudo
antigen bundle web-search

# Programming
antigen bundle git
antigen bundle git-extras
antigen bundle git-flow
antigen bundle golang

# System 
antigen bundle firewalld
antigen bundle ufw

# Zsh.
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle chrissicool/zsh-256color

# OS Dependent
case "$DISTRO" in
  debian|raspbian|ubuntu|elementary|mint)
    antigen bundle ubuntu
    ;;
  osx)
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
    ;;
  centos|fedora)
    antigen bundle centos
    antigen bundle yum
    antigen bundle dnf
    ;;
  windows)
    antigen bundle cygwin
    ;;
  *)
    ;;
esac

# Load the theme.
antigen theme romkatv/powerlevel10k 

# Tell Antigen that you're done.
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi
if [ -f ~/.custom_aliases ]; then
    source ~/.custom_aliases
fi

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/shell/.p10k.zsh.
[[ ! -f ~/.dotfiles/shell/.p10k.zsh ]] || source ~/.dotfiles/shell/.p10k.zsh
