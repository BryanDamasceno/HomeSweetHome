#!/bin/bash

#===============================NMAP===============================
checkCommand=$(which nmap)
checkCommand="$checkCommand"

if [ "$checkCommand" == "" ]; then
        sudo apt-get install nmap >/dev/null
        echo 'Nmap succesful installed!'

else
        echo nmap already installed
fi

#===============================GO LANGUAGE===============================
checkCommand=$(which go)
checkCommand="$checkCommand"

if [ "$checkCommand" == "" ]; then
        echo Removing previous go version...
        rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.1.linux-amd64.tar.gz

        echo Installing Go

        curl -OL https://go.dev/dl/go1.19.1.linux-amd64.tar.gz >/dev/null
        echo -ne '>>>>>>>>>>>>>>> 30%\r'

        sudo tar -C /usr/local -xvf go1.19.1.linux-amd64.tar.gz >/dev/null
        echo -ne '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 70%\r'

        echo "export PATH=$PATH:/usr/local/go/bin" >>~/.profile >/dev/null
        echo -ne '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 100%\r'

        echo 'Go succesful installed!'

else

        echo go already installed
fi

#===============================WAFW00F===============================
checkCommand=$(which wafw00f)
checkCommand="$checkCommand"

if [ "$checkCommand" == "" ]; then
        git clone git@github.com:EnableSecurity/wafw00f.git >/dev/null
        cd wafw00f
        python3 setup.py install >/dev/null

else
        echo wafw00f already installed
fi

#===============================GO BUSTER===============================
checkCommand=$(which gobuster)
checkCommand="$checkCommand"

if [ "$checkCommand" == "" ]; then
        go install github.com/OJ/gobuster/v3@latest >/dev/null

else
        echo gobuster already installed
fi

#===============================FFUF===============================
checkCommand=$(which ffuf)
checkCommand="$checkCommand"

if [ "$checkCommand" == "" ]; then
        go install github.com/ffuf/ffuf@latest >/dev/null

else
        echo ffuf already installed
fi

#===============================NUCLEI===============================
checkCommand=$(which ffuf)
checkCommand="$checkCommand"

if [ "$checkCommand" == "" ]; then
        go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest >/dev/null

else
        echo nuclei already installed
fi

cp ~/go/bin/* /usr/bin
