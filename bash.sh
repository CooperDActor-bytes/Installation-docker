#!bin/bash

cd
#Xplex streaming
sudo docker run -d --name xplex -p 80:80 -p 1988:1988 xplex/xplex
#owncast
sudo docker run -v `pwd`/data:/app/data -p 8080:8080 -p 1939:1939 owncast/owncast:latest
#rocketchat
sudo docker pull registry.rocket.chat/rocketchat/rocket.chat:latest
#peppermint ticketing
cd 
git clone https://github.com/CooperDActor/peppermint.git
cd peppermint 
sudo docker-compose up -d
cd

#antmedia
wget https://raw.githubusercontent.com/ant-media/Scripts/master/install_ant-media-server.sh -O install_ant-media-server.sh  && chmod 755 install_ant-media-server.sh
sudo ./install_ant-media-server.sh

#kasm
cd /tmp
curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.15.0.06fdc8.tar.gz
tar -xf kasm_release_1.15.0.06fdc8.tar.gz
sudo bash kasm_release/install.sh
