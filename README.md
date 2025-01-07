rfriends_osxはosx環境でrfriends3を動作させるスクリプトです  
  
cd ~/  
brew install git  
rm -rf rfriends_osx  
git clone https://github.com/rfriends/rfriends_osx.git  
cd rfriends_osx  
sh rfriends_osx.sh  
  
新規および既ユーザでlighttpdをインストールする方  
ビルトインサーバの起動は不要になり、http://IPアドレス:8000でアクセスできるようになります。
  
cd ~/  
cd rfriends_osx  
sh lighttpd_install  
  
インストール方法は以下が参考になります。 
  
rfriends3のインストール手順 （macOS編）  
https://rfriends.hatenablog.com/entry/2023/07/12/075527  
