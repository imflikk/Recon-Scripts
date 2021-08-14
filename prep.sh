#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "This script needs to be run as root."
  exit
fi

echo "[+] Updating apt packages and installing any available package updates..."
apt update
apt -y upgrade

echo "[+] Installing Golang and exporting Go path..."
apt -y install golang-go
export PATH="$PATH:$HOME/go/bin"

echo "[+] Downloading resolvers.txt file for amass..."
mkdir /opt/amass-resolvers
wget https://raw.githubusercontent.com/blechschmidt/massdns/master/lists/resolvers.txt -O /opt/amass-resolvers/resolvers.txt

echo "[+] Installing assetfinder..."
#go get -u github.com/tomnomnom/assetfinder
apt -y install assetfinder

echo "[+] Installing httprobe..."
apt -y install httprobe

echo "[+] Installing waybackurls..."
go get github.com/tomnomnom/waybackurls

echo "[+] Installing subjack..."
go get github.com/haccer/subjack

echo "[+] Installing gowitness and dependencies..."
go get -u gorm.io/gorm
go get -u github.com/sensepost/gowitness

echo "[+] Installing SecLists..."
apt -y install seclists

