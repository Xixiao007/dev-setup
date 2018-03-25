#!/bin/bash

# echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
# chsh -s `which fish`

# mackup
mackup restore

# mas signin tdxiaoxi2@gmail.com
mas install 419330170 784801555  # moon onenote

# vscode sync plugin
ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/
code --install-extension Shan.code-settings-sync

# ruby latest version
rbenv install `rbenv install -l | grep -v - | tail -1`
rbenv global `rbenv install -l | grep -v - | tail -1`

# jekyll salesforce blog
mkdir -p $HOME/projects
hub clone xixiao007.github.io $HOME/projects/
gem install jekyll bundler

./fish_action.sh