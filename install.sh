#!/bin/bash
set -e

echo "Installing dependencies..."
sudo pacman -S --needed herbstluftwm polybar scrot playerctl feh pulseaudio dmenu xorg-xev --noconfirm

echo "Backing up existing configs..."
[ -d ~/.config/herbstluftwm ] && mv ~/.config/herbstluftwm ~/.config/herbstluftwm.bak
[ -d ~/.config/polybar ] && mv ~/.config/polybar ~/.config/polybar.bak

echo "Copying configs..."
mkdir -p ~/.config/herbstluftwm ~/.config/polybar
cp -r "$(dirname "$0")/herbstluftwm/"* ~/.config/herbstluftwm/
cp -r "$(dirname "$0")/polybar/"* ~/.config/polybar/

mkdir -p ~/Pictures/screenshots
mkdir -p ~/.local/share/sounds
cp "$(dirname "$0")/sounds/"* ~/.local/share/sounds/

chmod +x ~/.config/herbstluftwm/*.sh
chmod +x ~/.config/polybar/*.sh

echo "Done! Log out and select herbstluftwm as your session, or run 'herbstluftwm' to start it."
