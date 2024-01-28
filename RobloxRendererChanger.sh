#!/bin/bash

echo "Choose a graphics API:"
echo "1. OpenGL"
echo "2. Vulkan"

read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        echo "You chose OpenGL."
        file_url="https://raw.githubusercontent.com/Twig6943/RobloxGraphicsSwitcherForLinux/main/OpenGL/ClientAppSettings.json"
        ;;
    2)
        echo "You chose Vulkan."
        file_url="https://raw.githubusercontent.com/Twig6943/RobloxGraphicsSwitcherForLinux/main/Vulkan/ClientAppSettings.json"  
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Prompt the user for their Roblox directory path
read -p "Enter your Roblox directory path: " roblox_directory

# Verify if the specified directory exists
if [ ! -d "$roblox_directory" ]; then
    echo "Error: The specified directory does not exist. Exiting."
    exit 1
fi

# Create a new folder called "ClientSettings" in the Roblox directory
client_settings_folder="$roblox_directory/ClientSettings"
mkdir -p "$client_settings_folder"

# Download the chosen file and place it in the "ClientSettings" folder
echo "Downloading file from GitHub..."
wget "$file_url" -O "$client_settings_folder/ClientAppSettings.json"

