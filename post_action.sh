#!/bin/bash

echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s `which fish`

fish
fisher fnm fzf