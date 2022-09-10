#!/bin/bash

checkCommand=$(which nmap)
checkCommand="$checkCommand"

if [ "$checkCommand" == "" ]; then
        sudo apt-get install nmap

else
        echo nmap already installed
fi

checkCommand=$(which go)
checkCommand="$checkCommand"

if [ "$checkCommand" == "" ]; then
        rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.1.linux-amd64.tar.gz
        curl -OL https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
        sudo tar -C /usr/local -xvf go1.19.1.linux-amd64.tar.gz
        echo "export PATH=$PATH:/usr/local/go/bin" >>~/.profile

else
        echo go already installed
fi

checkCommand=$(which wafw00f)
checkCommand="$checkCommand"

if [ "$checkCommand" == "" ]; then
        git clone git@github.com:EnableSecurity/wafw00f.git
        cd wafw00f
        python3 setup.py install

else
        echo wafw00f already installed
fi

checkCommand=$(which gobuster)
checkCommand="$checkCommand"

if [ "$checkCommand" == "" ]; then
        go install github.com/OJ/gobuster/v3@latest

else
        echo gobuster already installed
fi
