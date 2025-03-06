#!/bin/sh

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles true && killall Finder

#Install Fish
FISH_PATH=$(which fish)

if [ -z "$FISH_PATH" ]; then
    echo "Error: Fish shell not found. Please install fish first."
    exit 1
fi

# Check if fish is already in /etc/shells
if ! grep -q "$FISH_PATH" /etc/shells; then
    echo "$FISH_PATH is not in /etc/shells. Adding it..."
    # Add fish to /etc/shells
    echo "$FISH_PATH" | sudo tee -a /etc/shells > /dev/null
    if [ $? -eq 0 ]; then
        echo "Successfully added $FISH_PATH to /etc/shells."
    else
        echo "Failed to add $FISH_PATH to /etc/shells."
        exit 1
    fi
else
    echo "$FISH_PATH is already in /etc/shells."
fi

# Check if fish is already the default shell
CURRENT_SHELL=$(echo $SHELL)

if [ "$CURRENT_SHELL" == "$FISH_PATH" ]; then
    echo "Fish is already the default shell."
    exit 0
fi

# Set fish as the default shell
echo "Setting Fish as the default shell..."
chsh -s "$FISH_PATH"

if [ $? -eq 0 ]; then
    echo "Successfully set Fish as the default shell."
else
    echo "Failed to set Fish as the default shell. You may need to run this script manually."
    exit 1
fi


