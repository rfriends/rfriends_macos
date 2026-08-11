#!/bin/sh
# -----------------------------------------
# Rfriends (radiko radiru録音ツール)
# 2020/03/30
# 2021/02/26
# 2022/02/04
# 2023/07/12 rfriends3 対応
# 2023/07/17 7z追加
# 2024/12/13 github
# 2025/01/25 download from github
# 2026/06/23 add streamlink
# 2026/08/11 add MacPorts
# -----------------------------------------
echo
echo rfriends Setup Utility Ver. 3.0
echo
echo これは macOS 用です。
echo 実行には Homebrew または MacPorts のインストールが必要になります。
echo 
scr_dir=`pwd`
# -----------------------------------------
# ジャッジ
# -----------------------------------------
# Homebrew
if command -v brew >/dev/null 2>&1; then
    type='brew'
    
    # シリコン or インテル
    if [ "$(uname -m)" = "arm64" ]; then
        # Apple Silicon Mac
        dir='/opt/homebrew'
    else
        # Intel Mac
        dir='/usr/local'
    fi

# MacPorts
elif command -v port >/dev/null 2>&1; then
    type='port'
    dir='/opt/local'

# どちらもない
else
    echo "Homebrew も MacPorts もインストールされていません。"
    exit 1
fi

echo "判定結果:"
echo "  type: ${type}"
echo "  dir : ${dir}"

# -----------------------------------------
# ツールのインストール
# -----------------------------------------
if [ ${type} = 'brew' ]; then
    brew update
	
    if brew list --versions | grep -q "php"; then
        brew install php
        brew unlink php
        brew link --overwrite --force php
    else
        brew install php
    fi

    brew install wget
    brew install atomicparsley
    brew install pidof
    brew install iproute2mac
    brew install ffmpeg
    brew install chromium
    brew install p7zip
    brew install streamlink

    brew install lighttpd
# ----------------------------------------- port
else
    sudo port selfupdate
    PHPNO=$(port info --version php | awk '{print $2}' | tr -d '.')
    sudo port -N install php${PHPNO} php${PHPNO}-cgi php${PHPNO}-mbstring php${PHPNO}-openssl

    sudo port -N install wget
    sudo port -N install atomicparsley
    sudo port -N install pidof
    sudo port -N install iproute2mac
    sudo port -N install ffmpeg
    sudo port -N install chromium
    sudo port -N install p7zip
    sudo port -N install streamlink

    sudo port -N install lighttpd
fi
# -----------------------------------------
echo
echo rfriends3をインストール
echo
cd ~/

if [ -d ./rfriends3 ]; then
	read -p "すでにrfriends3がインストールされていますが、削除しますか？　(y/N) " ans
	case "$ans" in
  		"y" | "Y" )
			rm -r ./rfriends3
			echo "rfriends3を削除しました。"
			echo 
    			;;
  		* )
			echo 
    			;;
	esac
fi
# -----------------------------------------
echo
echo rfriends3をインストールします。
echo
# -----------------------------------------
rm rfriends3_latest_script.zip
wget https://raw.githubusercontent.com/rfriends/rfriends3_core/main/rfriends3_latest_script.zip
unzip -q -o rfriends3_latest_script.zip
# -----------------------------------------
echo
echo lighttpd をインストールします。
echo
# -----------------------------------------
conf_dir=${dir}/etc/lighttpd

user=`whoami`
group=`groups $user | cut -d " " -f 1`
home_dir=$HOME
port=8000

html_dir=$home_dir/rfriends3/script/html

mkdir -p $home_dir/lighttpd
sudo chmod 777 ${dir}/var/log/lighttpd

echo lighttpd > $home_dir/rfriends3/rfriends3_boot.txt

mkdir -p $html_dir/temp
ln -nfs $html_dir/temp $html_dir/webdav

sudo cp -n $conf_dir/lighttpd.conf $conf_dir/lighttpd.conf.org

sudo cp -p $scr_dir/lighttpd.conf.skel  $scr_dir/lighttpd.conf
sed -i "" s%rfriendsdir%$dir%g $scr_dir/lighttpd.conf
sed -i "" s%rfriendshomedir%$home_dir%g $scr_dir/lighttpd.conf
sed -i "" s%rfriendsuser%$user%g        $scr_dir/lighttpd.conf
sed -i "" s%rfriendsgroup%$group%g      $scr_dir/lighttpd.conf
sed -i "" s%rfriendsport%$port%g      $scr_dir/lighttpd.conf
sudo cp -p $scr_dir/lighttpd.conf $conf_dir/lighttpd.conf

if [ ${type} = 'brew' ]; then
    brew services restart lighttpd
else
    sudo port service reload lighttpd
fi
# -----------------------------------------
# 終了
# -----------------------------------------
echo
echo finished
# -----------------------------------------
