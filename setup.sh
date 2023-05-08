#!/bin/sh


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
cd /etc
git clone --depth=1 https://raw.githubusercontent.com/LoBrol/nginx_container/main/nanorc


# ----- SETUP OH-MY-ZSH -----
cd /root
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sh -c "$(wget -O- https://raw.githubusercontent.com/LoBrol/nginx_container/main/.zshrc)"
chsh -s $(which zsh)


# ----- INSTALL NGINX & PHP -----
nala install nginx -y
nala install php -y
nala install php-fpm -y
a2enmod proxy_fcgi setenvif
a2enconf php8.1-fpm
