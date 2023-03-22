#             _
#     _______| |__  _ __ ___
#    |_  / __| '_ \| '__/ __|
#     / /\__ \ | | | | | (__
#    /___|___/_| |_|_|  \___|
#

# Emacs mode
bindkey -e

# Prompt
autoload -U promptinit
promptinit

#setopt prompt_subst
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '%b '

export PS1='%F{red}%(?..%? )%f%40<...<%~%<< %F{blue}${vcs_info_msg_0_}%f%F{red}%%%f '

#colors / completion
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

#history
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=$HISTSIZE

setopt append_history
setopt hist_ignore_space

# options
set -o autocd
set -o always_to_end
set -o append_history
set -o complete_in_word
set -o extendedglob
set -o histappend
set -o histignorealldups
set -o histignorespace
set -o interactivecomments
set -o ksh_glob
set -o no_bang_hist
set -o no_bare_glob_qual
set -o no_extended_glob
set -o noclobber
set -o nullglob
set -o prompt_subst
set -o rmstarsilent
set -o shwordsplit
#set -o correctall

# completion
autoload -U compinit
compinit -i

LISTMAX=0

# zsh's git tab completion by default is extremely slow. This makes it use
# local files only. See http://stackoverflow.com/a/9810485/945780.
__git_files () {
    _wanted files expl 'local files' _files
}

# "git" is a wrapper for git-variable-author, inherit its completions.
compdef git-variable-author=git

#compdef sshrc=ssh

# Fuzzy matching
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# Disable ctrl-s and ctrl-q.
stty -ixon

# ---------------------------------------------------------------------------------------------------
# .
# ---------------------------------------------------------------------------------------------------

[ -e "$HOME/.config/fzf" ] && . "$HOME/.config/fzf/completion.zsh" && . "$HOME/.config/fzf/key-bindings.zsh"

[ -r "/usr/local/etc/profile.d/z.sh" ] && . /usr/local/etc/profile.d/z.sh

[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"

# ---------------------------------------------------------------------------------------------------

# Edit line in vim 
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey '^xe' edit-command-line

#keybindings
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias config='/usr/bin/git --git-dir=/Users/matthewdoherty/.cfg/ --work-tree=/Users/matthewdoherty'
eval "$(zoxide init zsh)"

export TERM="xterm-256color"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mkfd/op/gke/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mkfd/op/gke/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mkfd/op/gke/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mkfd/op/gke/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/kubernetes-cli@1.22/bin:$PATH"

source <(kubectl completion zsh)
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
source /Users/mkfd/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/sbin:$PATH"

eval "$(starship init zsh)"
