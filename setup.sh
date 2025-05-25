#!/bin/bash

# goose-url-handler setup script

APP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/applications"

# --| URL handler setup -----
echo "Copying goose-url-handler to /usr/local/bin..."

if [ -f /usr/local/bin/goose-url-handler ]; then
    echo "goose-url-handler already exists in /usr/local/bin. Overwriting..."
    # Remove the existing script
    sudo rm /usr/local/bin/goose-url-handler
fi
sudo cp ./goose-url-handler /usr/local/bin/

echo "Making goose-url-handler executable..."
sudo chmod +x /usr/local/bin/goose-url-handler

# --| Destop entry setup ----
echo "Copying desktop entry to applications directory..."

# Check if the desktop entry already exists
if [ -f "$APP_DIR/goose-url-handler.desktop" ]; then

    echo "goose-url-handler.desktop already exists in applications directory. Overwriting..."
    # Remove the existing desktop entry

    rm "$APP_DIR/goose-url-handler.desktop"
fi
sudo cp ./goose-url-handler.desktop "$APP_DIR/"

# --| MIME type setup ----
# Set the default application for the custom URL scheme
xdg-mime default goose-url-handler.desktop x-scheme-handler/goose

# --| Update the desktop database
echo "Updating desktop database..."
sudo update-desktop-database
update-desktop-database $APP_DIR

echo "Setup complete. You should now be able to install goose extensions from the browser."