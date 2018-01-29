#Nexell develop Env.
sudo apt-get install -y git dkms build-essential libtool autoconf unrar libncurses5-dev python subversion tftpd-hpa tftp-hpa nfs-kernel-server 
sudo apt-get install -y lynx curl device-tree-compiler

sudo apt-get install -y libpciaccess-dev autoconf autogen xutils-dev libtool libpthread-stubs0-dev repo
sudo apt-get install -y putty minicom fastboot

#Yocto
sudo apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib chrpath socat libsdl1.2-dev xterm lzop

sudo apt-get install -y lib32ncurses5 lib32z1 lib32z1-dev lib32stdc++6
sudo add-apt-repository ppa:umang/indicator-stickynotes
sudo apt-get update && sudo apt-get install -y indicator-stickynotes
sudo apt-get install -y ia32-libs

#git setting
git config --global user.email "suker@nexell.co.kr"
git config --global user.name "suker"
