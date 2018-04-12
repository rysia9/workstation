#!/bin/sh -exu

# Russian Fedora
dnf -y install \
  http://mirror.yandex.ru/fedora/russianfedora/russianfedora/free/fedora/russianfedora-free-release-stable.noarch.rpm \
  http://mirror.yandex.ru/fedora/russianfedora/russianfedora/nonfree/fedora/russianfedora-nonfree-release-stable.noarch.rpm \
  http://mirror.yandex.ru/fedora/russianfedora/russianfedora/fixes/fedora/russianfedora-fixes-release-stable.noarch.rpm

# Xorg
dnf -y install glx-utils mesa-dri-drivers mesa-libGL mesa-libGLU \
               plymouth-system-theme xorg-x11-drv-intel xorg-x11-drv-evdev \
               xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-xinit xorg-x11-drv-libinput

# Gnome
dnf -y install gnome-shell gnome-terminal gnome-tweak-tool file-roller \
               nautilus gedit eog dejavu-sans-mono-fonts google-noto-cjk-fonts

# Console tools
dnf -y install zsh git wget xprop

# Ruby build dependencies
#dnf -y install bzip2 gcc gcc-c++ readline-devel openssl-devel zlib-devel \
#               sqlite-devel libarchive-devel

# Google Chrome
#dnf -y install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# Telegram
#curl -L https://tdesktop.com/linux | tar -xJv
#mv --force Telegram /opt/telegram

# Atom
#wget -O atom.rpm "https://atom.io/download/rpm"
#dnf -y install atom.rpm
#rm -f atom.rpm

# Update
dnf -y --refresh update

# Configure
usermod -s /usr/bin/zsh sanslar
systemctl enable gdm.service
systemctl set-default graphical.target
dracut --regenerate-all --force
