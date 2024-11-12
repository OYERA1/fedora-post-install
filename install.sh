#!/bin/bash

# Instalar o RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instala apps para codar
sudo install git nmap svn gh

# Corrigir os problemas de codec
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y
sudo dnf install amrnb amrwb faad2 flac gpac-libs lame libde265 libfc14audiodecoder mencoder x264 x265 ffmpegthumbnailer -y


# Instalar o GNOME Tweaks para configurar o botão de minimizar
sudo dnf install gnome-tweaks -y

# Instalar o Google Chrome (e remover o aviso de gerenciado pela organização)
sudo dnf install fedora-workstation-repositories -y
sudo dnf copr enable the4runner/firefox-dev -y
sudo dnf check-update -y
sudo dnf install firefox-dev -y

# Instalar as fontes da Microsoft
sudo dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y

# Instalar aplicativos em flatpak
flatpak install flathub com.spotify.Client -y
flatpak install flathub com.mattjakeman.ExtensionManager -y
flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub com.rtosta.zapzap -y

sudo dnf install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git -y

echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "alias v=nvim" >> $HOME/.zshrc
echo "alias xc=xclip -sel clipboard" >> $HOME/.zshrc

source ~/.zshrc


# Extensões

# Blur my Shell
# Dash to Dock
# Logo Menu
# Run Cat
# Unblank lock screen

