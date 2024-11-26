#!/bin/bash

# Check if Nix is installed
if ! command -v nix &> /dev/null; then
    echo "Nix is not installed. Installing..."
    # Use the Determinate Systems installer
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
    
    # Source nix
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi
else
    echo "Nix is already installed"
fi
