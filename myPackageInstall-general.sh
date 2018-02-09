#default my env
sudo apt-get install -y emacs24 vim

#terminal utility
sudo apt-get install -y terminator
#hex-editor
sudo apt-get install -y bless
#serial terminal
sudo apt-get install -y ckermit

#desktop
#sudo apt install -y unity-control-center unity-tweak-tool

#etc
sudo apt-get install -y cifs-utils tree screen

# #Jenkins Plugin develop
# sudo apt-get install -y maven openjdk-8-jdk 
# echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/" >> ~/.bashrc

#hangul
sudo apt-get install -y fcitx-hangul

#mongodb
sudo apt-get install -y mongodb
sudo pip install pymongo

#blog
sudo apt install -y ruby ruby-dev
sudo gem install jekyll
sudo gem update --system
sudo gem install jekyll-sitemap

#mysql
#sudo apt-get install -y mysql-client
#sudo apt-get install -y mysql-server

#MachineLearning
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb
sudo apt-get install -y nvidia-modprobe
sudo service nvidia-docker restart

#network
sudo apt-get install -y aptitude cpus
sudo aptitude install cups

#virtualbox
sudo apt-get install -y virtualbox
sudo apt-get install -y virtualbox-ext-pack
