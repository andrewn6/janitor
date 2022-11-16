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

## Options

You can run the shell script with the following options:

- `--help (-h)`: shows this help page
- `--disable`: disable certain commands from running
- - `b`: disable brew update
- - `d`: disable DNS cache flush
- - `g`: disable gem cleanup
- - `n`: disable pnpm update
- - `p`: disable pip update
- - `r`: disable rust upgrade

example: `./janitor.sh --disable=dnrg`

## How to set up

- Clone the repo:
  - `git clone https://github.com/anddddrew/janitor`
  
- Create an alias in your .zshrc or .bashrc:
  - `alias='/pathofrepogoeshere/janitor.sh'`

*Note: You may have to run `chmod +x janitor.sh` if you get `permission denied: ./janitor.sh`!*

## Thank you

Big thanks to @PineappleRind for improving the script and making great modifications! 

Make sure to follow his github he is a great programmer.
