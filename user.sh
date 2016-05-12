#!/bin/sh -exu

# Ruby
rm -rf $HOME/.rbenv
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
git clone git://github.com/jf/rbenv-gemset.git $HOME/.rbenv/plugins/rbenv-gemset

# NodeJS
rm -rf $HOME/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | zsh

# Zgen
rm -rf $HOME/.zgen
git clone https://github.com/tarjoilija/zgen.git $HOME/.zgen

# Atom packages
apm i todo-show highlight-selected color-picker pigments linter linter-rubocop \
      linter-coffeelint linter-jshint linter-pylint atom-beautify atom-alignment \
      file-icons git-plus browser-plus script markdown-preview-plus terminal-panel \
      compare-files emmet project-manager

# Icon theme
rm -rf $HOME/Downloads/paper-icon
git clone https://github.com/snwh/paper-icon-theme.git $HOME/Downloads/paper-icon
mv --force $HOME/Downloads/paper-icon/Paper $HOME/.local/share/icons/Paper

# Configure
cp --force files/zshrc $HOME/.zshrc # zsh
#cp --force files/Gemfile $HOME/work/workstation/files/Gemfile
rbenv install 2.2.5
rbenv global 2.2.5
gem install bundler
