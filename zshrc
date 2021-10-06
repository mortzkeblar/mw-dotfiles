if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following loads are required at this point so antigen bundles can find
# tools installed for mikroways. If this dotfiles are going to be installed
# without ansible role from mikroways, some utilities shall be installed
#
# Load language managers
[[ -f ~/.zshrc.language-managers ]] && source ~/.zshrc.language-managers

# Load Mikroways personalizations
[[ -f ~/.zshrc.mikroways ]] && source ~/.zshrc.mikroways

# Ensure tmux accepts UTF8
alias tmux="tmux -u"

# SSH alias with s
alias s=ssh

# Use vim-gtk3 as EDITOR
export EDITOR=vim

# Ctrl+U works like bash
bindkey "^u" backward-kill-line

# Alias for common extensions
alias -s {yaml,yml,json,js,rb,py,md}=$EDITOR

# Fix GPG AGENT 
export GPG_TTY=$TTY

source ~/.antigen.zsh/antigen.zsh

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#
antigen bundle bundler
antigen bundle common-alias
antigen bundle direnv
antigen bundle git
antigen bundle git-extras
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme romkatv/powerlevel10k

# Mikroways bundles
[[ -f ~/.zshrc.mikroways.antigen.bundles ]] && \
  source ~/.zshrc.mikroways.antigen.bundles

# User bundles
[[ -f ~/.zshrc.user.antigen.bundles ]] && \
  source ~/.zshrc.user.antigen.bundles

# Tell Antigen that you're done.
antigen apply

# Do not share hsitory between sessions
unsetopt share_history

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fuzzy find
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Load custom autocmplete
fpath=($HOME/.zsh/completion $fpath)

# Load Other User personalizations
[ -f ~/.zshrc.user ] && source ~/.zshrc.user
