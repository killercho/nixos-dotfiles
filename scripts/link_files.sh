#!bin/bash/

# This script is used to link the nix folder to the correct place for the modules to work
# and to link the dotfiles to the .config folder in the home directory.

# Warn the user for potential issues and deletions
echo "      WARNING!      "
echo "All of the files corresponding to the configurations in this repo will be deleted from the $HOME/.config folder."
echo "Also the files in /etc/nixos/ will be deleted with no turning back."
while true; do
    read -p "Are you sure you want to continue? " yn
    case $yn in
    [Yy]*) break ;;
    [Nn]*) exit ;;
    *) echo "Please answer yes or no." ;;
    esac
done
echo "Continuing..."
echo "Some of the operations might require a polite 'please', so if you encounter a permissions problem don't worry just run the script with 'sudo'."

# Dinamically get the location of the repository
FULL_SCRIPT_PATH="$(pwd)"
# Get the parent directory since this is where the config files are
DOTFILES_FOLDER="$(dirname "$FULL_SCRIPT_PATH")"

echo "Linking the dotfiles folder to /etc/nixos"
mv /etc/nixos/hardware-configuration.nix $DOTFILES_FOLDER/
if [ -d /etc/nixos ]; then
    rm -rf /etc/nixos
fi
ln -sf $DOTFILES_FOLDER /etc/nixos

echo "Linking the i3 configuration to ~/.config/i3"
if [ -d ~/.config/i3 ]; then
    rm -rf ~/.config/i3
fi
ln -sf $DOTFILES_FOLDER/i3 ~/.config/i3

echo "Linking the alacritty configuration to ~/.config/alacritty"
if [ -d ~/.config/alacritty ]; then
    rm -rf ~/.config/alacritty
fi
ln -sf $DOTFILES_FOLDER/alacritty ~/.config/alacritty

echo "Linking the polybar configuration to ~/.config/polybar"
if [ -d ~/.config/polybar ]; then
    rm -rf ~/.config/polybar
fi
ln -sf $DOTFILES_FOLDER/polybar ~/.config/polybar

echo "Linking the rofi configuration to ~/.config/rofi"
if [ -d ~/.config/rofi ]; then
    rm -rf ~/.config/rofi
fi
ln -sf $DOTFILES_FOLDER/rofi ~/.config/rofi

echo "Linking the vim configuration to ~/.vim"
if [ -d ~/.vim ]; then
    rm -rf ~/.vim
fi
ln -sf $DOTFILES_FOLDER/vim-dotfiles/.vim ~/.vim

echo "Linking the zsh configuration to ~/.zsh"
if [ -d ~/.zsh ]; then
    rm -rf ~/.zsh
fi
ln -sf $DOTFILES_FOLDER/zsh ~/.zsh
ln -sf $DOTFILES_FOLDER/zshrc ~/.zshrc

echo "Linking the libinput-gestures configuration to ~/.config/libinput-gestures.conf"
ln -sf $DOTFILES_FOLDER/libinput-gestures.conf ~/.config/libinput-gestures.conf

echo
echo "If any error occured and the linking or removal were unsuccessful you might have to do it manualy or run the script with 'sudo' enabled."
echo "Manually linking the files is not hard just follow the script from the point at which it stopped and replace '$DOTFILES_FOLDER' with the location of the cloned repo."
