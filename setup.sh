#!/bin/sh


# ----- UPDATE DISTRO -----
apt update



# ====================================================================================================================================



# ----- CONFIGURE TZDATA -----
ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata



# ====================================================================================================================================



# ----- INSTALL USEFUL TOOLS -----
apt install nala -y
nala upgrade -y
nala install nano -y
# nala install wget
nala install curl -y
nala install git -y
nala install zsh -y
nala install neofetch -y



# ====================================================================================================================================



# ----- SETUP NANO -----
cd /etc
rm nanorc
wget https://raw.githubusercontent.com/LoBrol/nginx_container/main/file_to_be_copied/nanorc



# ====================================================================================================================================



# ----- SETUP OH-MY-ZSH -----
cd /root
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
rm .zshrc
wget https://raw.githubusercontent.com/LoBrol/nginx_container/main/file_to_be_copied/.zshrc
chsh -s $(which zsh)



# ====================================================================================================================================



# ----- INSTALL NGINX -----
nala install nginx -y


# ----- INSTALL PHP8.1 + PHP8.1-FPM -----
nala install php8.1 -y
nala install php8.1-fpm -y
a2enmod proxy_fcgi setenvif
a2enconf php8.1-fpm


# ----- INSTALL COMPOSER -----
nala install composer
a2enmod proxy_fcgi setenvif
a2enconf php8.1-fpm


# ----- INTEGRATE PHP WITH NGINX -----
cd /etc/nginx/sites-available
rm default
wget https://raw.githubusercontent.com/LoBrol/nginx_container/main/file_to_be_copied/default
cd /etc/php/8.1/fpm/pool.d
rm www.conf
wget https://raw.githubusercontent.com/LoBrol/nginx_container/main/file_to_be_copied/www.conf
service php8.1-fpm restart
service nginx restart
# service nginx configtest 
cd /var/www/html
rm -rf *



# ====================================================================================================================================



# ----- DONE -----
cd /
history -cw && clear && neofetch
