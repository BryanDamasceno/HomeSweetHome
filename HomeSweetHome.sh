#!/bin/bash

blue='\033[0;34m'

echo -e "${blue}


███████╗██╗    ██╗███████╗███████╗████████╗    ██╗  ██╗ ██████╗ ███╗   ███╗███████╗
██╔════╝██║    ██║██╔════╝██╔════╝╚══██╔══╝    ██║  ██║██╔═══██╗████╗ ████║██╔════╝
███████╗██║ █╗ ██║█████╗  █████╗     ██║       ███████║██║   ██║██╔████╔██║█████╗  
╚════██║██║███╗██║██╔══╝  ██╔══╝     ██║       ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝  
███████║╚███╔███╔╝███████╗███████╗   ██║       ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗
╚══════╝ ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝       ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝                                                                                                                            


"

menu() {
        echo "[1]Nmap           [2]Wafw00f              [3]Ffuf         [10] All tools"
        echo "[4]Go             [5]ExploitDB            [6]Gobuster"
        echo "[7]Subfinder      [8]Metasploit           [9]Nuclei"
        echo ""
        read -p "Select an option: " input
}

#===============================NMAP===============================
installNmap() {
        checkCommand=$(which nmap)
        checkCommand="$checkCommand"

        if [ "$checkCommand" == "" ]; then
                sudo apt-get install nmap >/dev/null
                echo 'Nmap succesful installed!'

        else
                echo nmap already installed
        fi
}
#===============================GO LANGUAGE===============================
installGo() {
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
}
#===============================WAFW00F===============================
installWafw00f() {
        checkCommand=$(which wafw00f)
        checkCommand="$checkCommand"

        if [ "$checkCommand" == "" ]; then
                git clone git@github.com:EnableSecurity/wafw00f.git >/dev/null
                cd wafw00f
                python3 setup.py install >/dev/null

        else
                echo wafw00f already installed
        fi
}
#===============================GO BUSTER===============================
installGobuster() {
        checkCommand=$(which gobuster)
        checkCommand="$checkCommand"

        if [ "$checkCommand" == "" ]; then
                go install github.com/OJ/gobuster/v3@latest >/dev/null

        else
                echo gobuster already installed
        fi
}
#===============================FFUF===============================
installFfuf() {
        checkCommand=$(which ffuf)
        checkCommand="$checkCommand"

        if [ "$checkCommand" == "" ]; then
                go install github.com/ffuf/ffuf@latest >/dev/null

        else
                echo ffuf already installed
        fi
}
#===============================NUCLEI===============================
installNuclei() {
        checkCommand=$(which nuclei)
        checkCommand="$checkCommand"

        if [ "$checkCommand" == "" ]; then
                go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest >/dev/null

        else
                echo nuclei already installed
        fi
}
#===============================EXPLOIT-DB===============================
installExploitDB() {
        checkCommand=$(which searchsploit)
        checkCommand="$checkCommand"

        if [ "$checkCommand" == "" ]; then
                sudo git clone https://github.com/offensive-security/exploitdb.git /opt/exploitdb
                sudo ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit

        else
                echo searchsploit already installed
        fi
}

menu

cp ~/go/bin/* /usr/bin
