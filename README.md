rfriends_osxはosx環境でrfriends3を動作させるスクリプトです。  
lighttpdをインストールすると、ビルトインサーバの起動は不要になり、http://IPアドレス:8000でアクセスできるようになります。  
既ユーザは、sh rfriends_osx.shは不要です。  
  
cd ~/  
brew install git  
rm -rf rfriends_osx  
git clone https://github.com/rfriends/rfriends_osx.git  
cd rfriends_osx  
sh rfriends_osx.sh  
sh lighttpd_install.sh  
  
インストール方法は以下が参考になります。 
  
rfriends3のインストール手順 （macOS編）  
https://rfriends.hatenablog.com/entry/2023/07/12/075527  
