#!/bin/bash

apt update
apt install nala -y
nala upgrade -y
nala install nano -y
nala install wget -y
nala install curl -y
nala install git -y
nala install zsh -y
nala install neofetch -y


nano /etc/nanorc
# --> edit file nanorc


sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

nano /home/ubuntu/.zshrc
# --> edit file .zshrc


nala install nginx -y
nala install php -y
nala install php-fpm -y

