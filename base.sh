#!/bin/sh -exu

# Russian Fedora
dnf -y install \
  http://mirror.yandex.ru/fedora/russianfedora/russianfedora/free/fedora/russianfedora-free-release-stable.noarch.rpm \
  http://mirror.yandex.ru/fedora/russianfedora/russianfedora/nonfree/fedora/russianfedora-nonfree-release-stable.noarch.rpm \
  http://mirror.yandex.ru/fedora/russianfedora/russianfedora/fixes/fedora/russianfedora-fixes-release-stable.noarch.rpm

# fix.
dnf -y clean all && dnf -y update

# Xorg
dnf -y install glx-utils mesa-dri-drivers mesa-libGL mesa-libGLU \
               plymouth-system-theme xorg-x11-drv-ati xorg-x11-drv-evdev \
               xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-xinit

# Gnome
dnf -y install gnome-shell gnome-terminal gnome-tweak-tool file-roller \
               nautilus gedit eog dejavu-sans-mono-fonts google-noto-cjk-fonts

# Console tools
dnf -y install zsh git wget

# Ruby build dependencies
dnf -y install bzip2 gcc gcc-c++ readline-devel openssl-devel zlib-devel \
               sqlite-devel libarchive-devel

# Google Chrome
dnf -y install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# Telegram
curl -L https://tdesktop.com/linux | tar -xJv
mv --force Telegram /opt/telegram

# Atom
wget -O atom.rpm "https://atom.io/download/rpm"
dnf -y install atom.rpm
rm -f atom.rpm

# Update python pm
pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools

# Configure
usermod -s /bin/zsh $USER
systemctl enable gdm.service
systemctl set-default graphical.target
dracut --regenerate-all --force
