# File: ~/.zshrc
# Author: Vladyslav "coirius" Chyzhevskyi <coirius@coirius.com>
# vim: foldmethod=marker

autoload -U compinit promptinit
autoload -U colors
colors
compinit
promptinit

bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End

# prompt {{{
PROMPT="%n@%m:%~%(?..[%?]) %# "
# }}}

# history {{{
export HISTFILE=~/.zsh_history
export HISTSIZE=10240
export SAVEHIST=10240
# }}}

set autopushd pushdminus pushdsilent pushdtohome
set autocd
setopt cdablevars
setopt ignoreeof
setopt interactivecomments
setopt nobanghist
setopt noclobber
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt SH_WORD_SPLIT
setopt nohup
# Vars used later on by Zsh
export EDITOR="vim"
export BROWSER=chromium
export XTERM="urxvt"

# Stuff to make my life easier {{{
# allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
# tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
# cd not select parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd
# }}}  

# alias es {{{
# Set up auto extension stuff
alias -s html=$BROWSER
alias -s org=$BROWSER
alias -s php=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s png=feh
alias -s jpg=feh
alias -s gif=feg
alias -s sxw=soffice
alias -s doc=soffice
alias -s docx=soffice
alias -s xls=soffice
alias -s xlsx=soffice
alias -s odt=soffice
alias -s pdf=xpdf
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s cpp=$EDITOR
alias -s hpp=$EDITOR
alias -s c=$EDITOR
alias -s h=$EDITOR

# Normal aliases
alias l='ls --color=auto'
alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -l'
alias cl="clear"
alias ..='cd ..'
alias mem='free -m'
alias df='df -h'
alias gdb='gdb -q'
alias up='source ~/.zshrc'
alias tmux='tmux -2'
# }}}

# run tmux automaticlly
if [[ "$TMUX" == "" ]]; then
	tmux
fi