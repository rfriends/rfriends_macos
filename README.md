rfriends_macosはmacOS環境でrfriends3を動作させるスクリプトです。  
lighttpdをインストールすると、ビルトインサーバの起動は不要になり、  
http://IPアドレス:8000でアクセスできるようになります。  
  
実行ユーザにはroot権限が必要です。  
既ユーザは、sh rfriends_macos.shは不要です。  
  
cd ~/  
brew install git  
rm -rf rfriends_macos  
git clone https://github.com/rfriends/rfriends_macos.git  
cd rfriends_macos  
sh rfriends_macos.sh  
sh lighttpd_install.sh  
  
インストール方法は以下を参照してください。  
https://rfriends.github.io/rfriends/distro/macos.html
  
> [!TIP]
> Docker Desktope for mac も検討してみてください。
> 通知がなくなるメリットがあります。
> https://rfriends.github.io/rfriends/distro/docker.html
  


