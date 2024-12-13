#!/bin/sh
# -----------------------------------------
# Rfriends (radiko radiru録音ツール)
# 2020/03/30
# 2021/02/26
# 2022/02/04
# 2023/07/12 rfriends3 対応
# 2023/07/17 7z追加
# 2024/12/13 github
# -----------------------------------------
echo 
echo これは MacOS 用です。
echo 実行には Homebrew のインストールが必要になります。
echo 
# -----------------------------------------
# ツールのインストール
# -----------------------------------------
brew update
# -----------------------------------------
#  php, ffmpeg,
# -----------------------------------------
echo
echo rfriends Setup Utility Ver. 2.10
echo
echo
echo php, ffmpeg, , wget
echo
echo "上記ツールをインストールしますか　(y/n) ?"
read ans
if [ $ans = "y" ]; then
	brew install php@8.1
	brew link php@8.1
	#brew link php@8.1 --force

	brew install wget
	brew install atomicparsley
    brew install pidof
    brew install iproute2mac
	brew install ffmpeg
    brew install chromium
    brew install p7zip
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
rm rfriends3_latest_script.zip
#wget http://rfriends.s1009.xrea.com/files3/rfriends3_latest_script.zip
wget https://github.com/rfriends/rfriends3/releases/latest/download/rfriends3_latest_script.zip
unzip -q -o rfriends3_latest_script.zip
# -----------------------------------------
#echo
#echo rfriends3_server起動します。
#echo
#sh rfriends3/rfriends3_server.sh
# -----------------------------------------
# 終了
# -----------------------------------------
echo
echo finished
# -----------------------------------------
