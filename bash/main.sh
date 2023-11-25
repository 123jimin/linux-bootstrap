#!/usr/bin/env bash

echo "Initializing bash"

bashrc_src_file="$(dirname "$0")/bashrc.bashrc"
bashrc_awk_file="$(dirname "$0")/bashrc.awk"

bashrc_start_marker="# START linux-bootstrap"
bashrc_end_marker="# END linux-bootstrap"

if grep -q "$bashrc_start_marker" ~/.bashrc && grep -q "$bashrc_end_marker" ~/.bashrc; then
    temp_bashrc=$(mktemp)
    awk -v start_marker="$bashrc_start_marker" -v end_marker="$bashrc_end_marker" -v new_config="$bashrc_src_file" -f "$bashrc_awk_file" ~/.bashrc > "$temp_bashrc" && mv "$temp_bashrc" ~/.bashrc
else
    echo -e "\n$bashrc_start_marker" >> ~/.bashrc
    cat "$bashrc_src_file" >> ~/.bashrc
    echo -e "\n$bashrc_end_marker" >> ~/.bashrc
fi

cp -f "$(dirname "$0")/bash_aliases.bash_aliases" ~/.bash_aliases