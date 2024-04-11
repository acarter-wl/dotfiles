#!/bin/bash

# Function to load SSH keys into SSH agent
load_ssh_keys() {
    local ssh_key
    local ssh_dir="$HOME/.ssh"
    
    # Check if .ssh directory exists
    if [ ! -d "$ssh_dir" ]; then
        echo "Error: $ssh_dir directory not found."
        return 1
    fi
    
    # Check if ssh-agent is running
    if ! pgrep -x ssh-agent >/dev/null; then
        echo "Starting ssh-agent..."
        eval $(ssh-agent -s)
    fi
    
    # Find and add id_ed25519 and id_rsa keys to ssh-agent
    for ssh_key in $ssh_dir/id_*(ed25519|rsa); do
        if [ -f "$ssh_key" ]; then
            echo "Adding $ssh_key to ssh-agent..."
            ssh-add "$ssh_key"
        fi
    done
}

# Main script
echo "Initializing SSH agent and loading keys..."
if ! load_ssh_keys; then
    echo "Error: Failed to load SSH keys. Please check your SSH key files and try again."
fi

