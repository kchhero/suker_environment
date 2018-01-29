#Docker
sudo apt update
sudo apt install docker.io
sudo usermod -aG docker suker
sudo groupadd docker
sudo gpasswd -a suker docker
sudo service docker restart

#MachineLearning
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb
sudo apt-get install -y nvidia-modprobe
sudo service nvidia-docker restart

#network
sudo apt-get install -y aptitude cpus
sudo aptitude install cups
