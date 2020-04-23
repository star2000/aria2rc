Aria2Home="$HOME/.aria2"
Aria2App="$HOME/.local/share/applications/aria2.desktop"
AutoStart="$HOME/.config/autostart/aria2.desktop"

# Remove
pkill aria2c
rm -rf $Aria2Home
rm -f $Aria2App $AutoStart

# Uninstall aria2
if ! which aria2c >/dev/null; then
    if which pacman >/dev/null; then
        sudo pacman -R --noconfirm aria2
    elif which apt >/dev/null; then
        sudo apt remove -y aria2
    elif which yum >/dev/null; then
        sudo yum remove -y aria2
    fi
fi
