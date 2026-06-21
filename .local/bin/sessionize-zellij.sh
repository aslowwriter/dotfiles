#!/usr/bin/env bash

LOG_FILE="/home/sam/zellij-log.txt"

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find  ~/projects ~/dotfiles ~/projects/{rust,streaming,writing,flatpak} -mindepth 1 -maxdepth 1 -type d | fzf)
fi

echo "selected: $selected"  >> $LOG_FILE

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
   echo "selected_name: $selected_name">> $LOG_FILE 

    echo "pre-check " >> $LOG_FILE 
if ! zellij ac query-tab-names | grep -q "$selected_name"  2> /dev/null; then
    layout_name=""

    echo "post-check" >> $LOG_FILE 

    if [[ -f "$selected/pixi.toml" ]]; then
	layout_name="pixi-project"
    elif [[ -f "$selected/Cargo.toml" ]]; then
	layout_name="rust-project"
    else
	layout_name="project"
    fi

    echo "$layout_name" >> $LOG_FILE

    zellij ac new-tab -n "$selected_name" -c "$selected" --layout "$HOME/.config/zellij/layouts/$layout_name.kdl" 2>> $LOG_FILE
fi


zellij ac go-to-tab-name "$selected_name"

