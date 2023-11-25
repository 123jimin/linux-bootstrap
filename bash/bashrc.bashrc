# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Register bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Disable Ctrl+S causing freezes for vi
vi()
{
    local STTY_OPTS="$(stty --save)"
    stty stop '' -ixoff
    command vi "$@"
    stty "$STTY_OPTS"
}