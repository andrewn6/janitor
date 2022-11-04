GREEN='\033[0;32m'
RESET='\033[0;0m'
bold=$(tput bold)

printf "${GREEN}
   ___             _ _             
  |_  |           (_) |            
    | | __ _ _ __  _| |_ ___  _ __ 
    | |/ _  | '_ \| | __/ _ \|  __|
/\__/ / (_| | | | | | || (_) | |   
\____/ \__,_|_| |_|_|\__\___/|_|   
"                                   

printf "${bold}Now cleaning...${RESET}\n\n"

# Update & Upgrade then cleanup and repair brew packages
brew update
brew upgrade
brew cleanup
brew tap --repair

# Update pip
pip install --upgrade pip

# Cleanup ruby gems
gem cleanup

# Upgrade rust
rustup upgrade

# Upgrade global pnpm deps
pnpm update --global 

# Flush DNS cache
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder

# Update pip
python3.10 -m pip install --upgrade pip


printf "${bold}${GREEN}The janitor has finished cleaning! ${RESET}\n\n"
