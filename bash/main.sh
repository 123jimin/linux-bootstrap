#!/usr/bin/env bash

echo "Initializing bash"

bashrc_src_file="$(dirname "$0")/bashrc.bashrc"
bashrc_start_marker="# START linux-bootstrap"
bashrc_end_marker="# END linux-bootstrap"

if grep -q "$bashrc_start_marker" ~/.bashrc && grep -q "$bashrc_end_marker" ~/.bashrc; then
    awk -v beg="$bashrc_start_marker" -v end="$bashrc_end_marker" 'NR==FNR{new = new $0 ORS; next} $0~end{f=0} !f{print} $0~beg{printf "%s",new; f=1}' "$bashrc_src_file" ~/.bashrc > ~/.bashrc
else
    echo -e "\n$bashrc_start_marker" >> ~/.bashrc
    cat "$bashrc_src_file" >> ~/.bashrc
    echo -e "\n$bashrc_end_marker" >> ~/.bashrc
fi

cp -f "$(dirname "$0")/bash_aliases.bash_aliases" ~/.bash_aliases