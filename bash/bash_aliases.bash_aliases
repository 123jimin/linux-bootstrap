alias rm='echo "Use /bin/rm manually."; false #'

alias cp='cp -i'
alias mv='mv -i'

alias rmln='unlink'

alias un_tar='tar xvf'
alias un_tar_gz='tar xvfz'

alias c='cd'
alias d='cd'
alias m='make'
alias q='exit'
alias r='cat'
alias v='vi'
alias x='clear'
alias xd='x;d'

alias reconfig='. ~/.bashrc'
alias scr='screen'
alias xl='/bin/ls -1 -f'

alias tt='tmux new-session -A -s'
alias tl='tmux list-sessions'

# colors
alias ls='/usr/bin/ls --color=auto'
alias grep='/usr/bin/grep --color=auto'
alias fgrep='/usr/bin/fgrep --color=auto'
alias egrep='/usr/bin/egrep --color=auto'

# alias for ls
alias ll='/usr/bin/ls --color=auto -l'
alias la='/usr/bin/ls --color=auto -a'
alias lla='/usr/bin/ls --color=auto -al'
alias lal='lla'
alias l='/usr/bin/ls --color=auto -CF'