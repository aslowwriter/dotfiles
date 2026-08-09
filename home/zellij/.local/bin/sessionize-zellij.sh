#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
	selected=$1
else
	selected=$(find ~/projects/* -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if ! zellij ac query-tab-names | grep -q "$selected_name" 2>/dev/null; then
	layout_name=""

	if [[ -f "$selected/pixi.toml" ]]; then
		layout_name="pixi-project"
	elif [[ -f "$selected/Cargo.toml" ]]; then
		layout_name="rust-project"
	elif { [[ -f "$selected/config.toml" ]] || [[ -f "$selected/zola.toml" ]]; } && [[ -d "$selected/content" ]]; then
		layout_name="zola-project"
	else
		layout_name="project"
	fi

	zellij ac new-tab -n "$selected_name" -c "$selected" --layout "$HOME/.config/zellij/layouts/$layout_name.kdl"
fi

zellij ac go-to-tab-name "$selected_name"
