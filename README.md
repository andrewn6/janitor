# Janitor

## What does this do?

This is a script that I run here and there which cleans up my macbook, and updates packages and does other misc tasks.

## Overview

Here is the highlights of what the script does
- `brew update`
  - update homebrew packages
- `brew upgrade`
  - upgrade homebrew packages
- `rustup upgrade`
  - updates rust to the latest version

 and so on...

## How to setup

- Clone the repo:
  - `git clone https://github.com/anddddrew/janitor`
  
- Create an alias in your .zshrc or .bashrc:
  - `alias='/pathofrepogoeshere/janitor.sh'`

*Note: You may have to run `chmod +x janitor.sh` if you get `permission denied: ./janitor.sh`!*
