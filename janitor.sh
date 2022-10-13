echo 'now updating & cleaning up...'

brew update
brew upgrade
brew cleanup
brew tap --fix
rustup upgrade

echo 'Done.'
