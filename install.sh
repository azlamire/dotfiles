sudo pacman -S zsh xdg-desktop-portal-hyprland vesktop xdg-desktop-portal wget postgresql openssh obs-studio npm nginx neovim mov-cli kitty hyprpaper hyprshot git flameshot firefox eza cmake btop brightnessctl bluez-utils bluez base-devel ayugram-desktop-bin acpi activate-linux  anydesk-bin
# yay installing
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
# Usage of yay
sudo yay -S v2rayn starship uv yt-dlp nginx-mod-rtmp 
