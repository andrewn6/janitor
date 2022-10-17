echo 'now updating & cleaning up...'

# Update & Upgrade then cleanup and repair brew packages
brew update
brew upgrade
brew cleanup
brew tap --repair

# Cleanup ruby gems
gem cleanup

# Upgrade rust
rustup upgrade

echo 'Done.'
