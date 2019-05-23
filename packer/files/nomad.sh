#!/usr/bin/env bash

set -ex

sudo apt update
sudo apt install wget -y
sudo apt install unzip -y

# download and install nomad
wget https://releases.hashicorp.com/nomad/0.9.1/nomad_0.9.1_linux_amd64.zip
wget https://releases.hashicorp.com/nomad/0.9.1/nomad_0.9.1_SHA256SUMS
grep linux_amd64 nomad_*_SHA256SUMS | sha256sum -c -
unzip nomad_*.zip

sudo chown root:root nomad
sudo mv nomad /usr/local/bin/
nomad version

nomad -autocomplete-install
complete -C /usr/local/bin/nomad nomad

sudo mkdir --parents /opt/nomad
sudo mkdir --parents /etc/nomad.d
sudo chmod 700 /etc/nomad.d