#!/bin/bash


# ----- UPDATE DISTRO -----
apt update


# ----- INSTALL USEFUL TOOLS -----
apt install nala -y
nala upgrade -y
nala install nano -y
nala install wget -y
nala install curl -y
nala install git -y
nala install zsh -y
nala install neofetch -y


# ----- SETUP NANO -----
git clone --depth=1 https://raw.githubusercontent.com/LoBrol/nginx_container/main/nanorc
mv nanorc /etc


# ----- SETUP OH-MY-ZSH -----
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# ----- INSTALL NGINX & PHP -----
nala install nginx -y
nala install php -y
nala install php-fpm -y

