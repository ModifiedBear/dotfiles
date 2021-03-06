#!/usr/bin/env bash

# for fedora 34

set -e

sudo dnf update -y

# enable RPM fusion repositories
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# enable i3-gaps repo
sudo dnf copr enable -y fuhrmann/i3-gaps

# some installation
sudo dnf install -y git wget curl i3-gaps i3status htop fluxbox \ 
rofi picom polybar python3 python3-pip xclip xbacklight make xrdb

# for alternating layout
pip3 install i3ipc 

# make xorg.conf
sudo touch /etc/X11/xorg.conf
echo \
"Section \"Device\"
        Identifier  "Intel Graphics"
        Driver      "intel"
        Option      "Backlight"  "intel_backlight"
EndSection" >> /etc/X11/xorg.conf
# end make xorg.conf

# polybar
# git clone my stuff (add polybar
# chmod +x ~/.config/polybar/launch.sh
# add fonts:
# SIJI:
# git clone https://github.com/stark/siji && cd siji
# ./install.sh

# alternating layout
# git clone https://github.com/olemartinorg/i3-alternating-layout.git && cd i3-alternating-layout
# chmod +x alternating_layouts.py

# chromium
sudo dnf config-manager -y --add-repo https://download.opensuse.org/repositories/home:/ungoogled_chromium/Fedora_34/home:ungoogled_chromium.repo
sudo dnf install -y ungoogled-chromium

# picom fork
git clone https://github.com/ibhagwan/picom
cd picom
meson --buildtype=release . build
ninja -C build
# To install the binaries in /usr/local/bin (optional)
sudo ninja -C build install
# picom config:
# corner-radius: 10;

# tlp
sudo dnf install tlp
sudo tlp start

# vim
sudo dnf install vimx
sudo mv /usr/bin/vimx /usr/bin/vim

# solid wallpaper
# sudo dnf install xsetroot

# add my source files (rofi and i3 config)
# git clone 
# refresh Xresources:
# xrdb ~/.Xresources

# pfetch
# git clone https://github.com/dylanaraps/pfetch.git && cd pfetch
# sudo make install

# i3lock
# git clone https://github.com/pavanjadhaw/betterlockscreen
# cd betterlockscreen
# cp betterlockscreen ~/.local/bin/
# dependencies
# sudo dnf install imagemagick
# sudo dnf install -y autoconf automake cairo-devel fontconfig gcc libev-devel libjpeg-turbo-devel libXinerama libxkbcommon-devel libxkbcommon-x11-devel libXrandr pam-devel pkgconf xcb-util-image-devel xcb-util-xrm-devel
# git clone https://github.com/Raymo111/i3lock-color.git
# cd i3lock-color
# ./build.sh
# ./install-i3lock-color.sh
