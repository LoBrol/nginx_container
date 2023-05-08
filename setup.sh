#!/bin/sh


# ----- UPDATE DISTRO -----
apt update


# ----- CONFIGURE TZDATA -----
ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata


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
rm nanorc
wget https://raw.githubusercontent.com/LoBrol/nginx_container/main/nanorc


# ----- SETUP OH-MY-ZSH -----
cd /root
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s --batch
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
em .zshrc
wget https://raw.githubusercontent.com/LoBrol/nginx_container/main/.zshrc
chsh -s $(which zsh)


# ----- INSTALL NGINX & PHP -----
nala install nginx -y
nala install php -y
nala install php-fpm -y
a2enmod proxy_fcgi setenvif
a2enconf php8.1-fpm
