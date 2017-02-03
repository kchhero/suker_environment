#default my env
sudo apt-get install -y emacs24 vim

#terminal utility
sudo apt-get install -y terminator
#hex-editor
sudo apt-get install -y bless
#serial terminal
sudo apt-get install -y ckermit

#Nexell develop Env.
sudo apt-get install -y git dkms build-essential libtool autoconf unrar libncurses5-dev python subversion tftpd-hpa tftp-hpa nfs-kernel-server 
sudo apt-get install -y lynx curl device-tree-compiler

sudo apt-get install -y libpciaccess-dev autoconf autogen xutils-dev libtool libpthread-stubs0-dev repo
sudo apt-get install -y putty minicom fastboot

#network
sudo apt-get install -y aptitude cpus
sudo aptitude install cups

#Yocto
sudo apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib chrpath socat libsdl1.2-dev xterm lzop

sudo apt-get install -y lib32ncurses5 lib32z1 lib32z1-dev lib32stdc++6
sudo add-apt-repository ppa:umang/indicator-stickynotes
sudo apt-get update && sudo apt-get install -y indicator-stickynotes
sudo apt-get install -y ia32-libs

#desktop
sudo apt install -y unity-control-center unity-tweak-tool

#python
sudo apt-get install -y wxglade spyder
sudo apt install -y python-pip
pip install --upgrade pip;sudo pip install BeautifulSoup4
#pip install django==1.6

#mongodb
sudo apt-get install -y mongodb
sudo pip install pymongo

#blog
sudo gem install jekyll
sudo gem update --system
sudo gem install jekyll-sitemap

#mysql
#sudo apt-get install -y mysql-client
#sudo apt-get install -y mysql-server

