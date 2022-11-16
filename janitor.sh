GREEN='\033[0;32m'
RESET='\033[0;0m'
BOLD=$(tput bold)
arg=$1

printf "${GREEN}
   ___             _ _
  |_  |           (_) |
    | | __ _ _ __  _| |_ ___  _ __
    | |/ _  | '_ \| | __/ _ \|  __|
/\__/ / (_| | | | | | || (_) | |
\____/ \__,_|_| |_|_|\__\___/|_|
${RESET}"

help() {
    printf "
  ${GREEN}${BOLD}Janitor Help${RESET}
  --help (-h): prints this message
  --disable: disable certain commands from running
    b: disable brew update
    d: disable DNS cache flush
    g: disable gem cleanup
    n: disable pnpm update
    p: disable pip update
    r: disable rust upgrade

    example: ./janitor.sh --disable=dgnr\n"

    exit
}

if [ $1 == "--help" ] || [ $1 == "-h" ]; then help
fi

printf "${BOLD}Now cleaning...${RESET}\n\n"

# Update & Upgrade then cleanup and repair brew packages
update_brew() {
    brew update
    brew upgrade
    brew cleanup
    brew tap --repair
}

# Update pip
update_pip() {
    python=$(ls -a /usr/bin | grep python | tail -1);
    ($python -m pip install --upgrade pip)
}

# Cleanup ruby gems
if [[ $arg != "--disable"*"g"* ]]; then
    gem cleanup
fi

# Upgrade rust
if [[ $arg != "--disable"*"r"* ]]; then
    rustup upgrade
fi

# Upgrade global pnpm deps
if [[ $arg != "--disable"*"n"* ]]; then
    pnpm update --global
fi

# Flush DNS cache
if [[ $arg != "--disable"*"d"* ]]; then
    sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
fi

if [[ $arg != "--disable"*"b"* ]]; then update_brew
fi

if [[ $arg != "--disable"*"p"* ]]; then update_pip
fi

printf "\n${BOLD}${GREEN}The janitor has finished cleaning! ${RESET}\n\n"
