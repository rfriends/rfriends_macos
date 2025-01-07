#!/bin/sh
# =========================================
# lighttpd
#
# 1.0 2025/01/08 new
ver=1.0
# =========================================
echo
echo install lighttpd for mac osx Ver. $ver
echo
#
user=`whoami`
home_dir=$HOME
conf_dir=/usr/local/etc/lighttpd
html_dir=$home_dir/rfriends3/script/html
scr_dir=`pwd`

brew update
#brew upgrade
brew install lighttpd
#
mkdir -p $home_dir/lighttpd
mkdir -p $home_dir/lighttpd/sockets
mkdir -p $home_dir/lighttpd/uploads
echo lighttpd > $home_dir/rfriends3/rfriends3_boot.txt

mkdir -p $html_dir/temp
ln -nfs $html_dir/temp $html_dir/webdav

sudo cp -n $conf_dir/lighttpd.conf $conf_dir/lighttpd.conf.org
sudo cp -n $conf_dir/modules.conf $conf_dir/modules.conf.org
sudo cp -n $conf_dir/conf.d/fastcgi.conf $conf_dir/conf.d/fastcgi.conf.org
sudo cp -n $conf_dir/conf.d/webdav.conf $conf_dir/conf.d/webdav.conf.org

sudo cp -p $scr_dir/lighttpd.conf.skel  $scr_dir/lighttpd.conf
sed -i "" s%rfriendshomedir%$home_dir%g $scr_dir/lighttpd.conf
sed -i "" s%rfriendsuser%$user%g        $scr_dir/lighttpd.conf
sudo cp -p $scr_dir/lighttpd.conf $conf_dir/lighttpd.conf

sudo cp -p $scr_dir/modules.conf.skel $conf_dir/modules.conf
sudo cp -p $scr_dir/fastcgi.conf.skel $conf_dir/conf.d/fastcgi.conf
sudo cp -p $scr_dir/webdav.conf.skel  $conf_dir/conf.d/webdav.conf

brew services start lighttpd
