#!/bin/bash

# echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
# chsh -s `which fish`

# mas signin tdxiaoxi2@gmail.com
mas install 419330170 784801555  # moon  onenote

# vscode sync plugin
ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/
code --install-extension Shan.code-settings-sync

./fish_action.sh