# Install aria2
if ! which aria2c >/dev/null; then
    if which pacman >/dev/null; then
        sudo pacman -S --noconfirm aria2
    elif which apt >/dev/null; then
        sudo apt install -y aria2
    elif which yum >/dev/null; then
        sudo yum install -y aria2
    fi
fi
xdg-user-dirs-update

Aria2Home="$HOME/.aria2"
Aria2App="$HOME/.local/share/applications/aria2.desktop"
Aria2Config="$Aria2Home/aria2.conf"
Aria2Session="$Aria2Home/aria2.session"
AutoStart="$HOME/.config/autostart/aria2.desktop"
DownloadDir=$(xdg-user-dir DOWNLOAD)

# Cleanup
pkill aria2c
mkdir $Aria2Home 2>/dev/null
mkdir -p "$HOME/.local/share/applications" 2>/dev/null
mkdir -p "$HOME/.config/autostart" 2>/dev/null

# Config
echo "
dir=$DownloadDir
input-file=$Aria2Session
max-concurrent-downloads=10
continue=true

max-connection-per-server=16
min-split-size=1M
split=1024

enable-rpc=true
rpc-allow-origin-all=true

disk-cache=32M
save-session=$Aria2Session
" >$Aria2Config
echo '' >$Aria2Session

# Startup
echo "
[Desktop Entry]
Name=aria2
Exec=aria2c
Type=Application
NoDisplay=true
" >$Aria2App
ln -sf $Aria2App $AutoStart

# Start
gtk-launch aria2

# Count
wget -qO- fastly.jsdelivr.net/gh/star2000/count@4/count >/dev/null
