GREEN='\033[0;32m'
bold=$(tput bold)
printf "${GREEN}    ___                         
  |_  |           (_) |            
    | | __ _ _ __  _| |_ ___  _ __ 
    | |/ _ | _ \| | __/ _ \| __|
/\__/ / (_| | | | | | || (_) | |   
\____/ \__,_|_| |_|_|\__\___/|_|   
                                   
                                   \n"
printf "${bold}Now cleaning...\n"

# Update & Upgrade then cleanup and repair brew packages
brew update
brew upgrade
brew cleanup
brew tap --repair

# Cleanup ruby gems
gem cleanup

# Upgrade rust
rustup upgrade

printf "${bold}The janitor has finished cleaning! \n"
