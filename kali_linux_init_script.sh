##############################################################################################


apt-get update
sleep 2
apt-get install -y gobuster 
apt-get install -y feroxbuster 
apt-get install -y seclists 
apt-get install -y wmctrl 
apt-get install -y git 
apt-get install -y 7z 
apt-get install -y xclip
apt-get install -y ghidra
apt-get install -y dirsearch
apt-get install -y bloodhound
apt-get install -y chisel
apt-get install -y golang
apt-get install -y checksec
apt-get install -y gdb
apt-get install -y python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
apt-get install -y 2to3
apt-get install -y nuclei
apt-get install -y xxd
apt-get install -y hexedit
apt-get install -y steghide
apt-get install -y jq
apt-get install -y unblob
apt-get install -y npm
apt-get install -y nuclei
apt-get install -y owasp-zap

##############################################################################################

python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

##############################################################################################

cd /opt
rm -rf *

##############################################################################################


chmod 777 /etc/sudoers
echo '
Defaults	env_reset
Defaults	mail_badpass
Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

Defaults	use_pty

root	ALL=(ALL:ALL) ALL
kali	ALL=(ALL:ALL) NOPASSWD: ALL

%sudo	ALL=(ALL:ALL) NOPASSWD: ALL


@includedir /etc/sudoers.d
' > /etc/sudoers
chmod 600 /etc/sudoers


##############################################################################################


echo '
sudo su
exit
' >> /home/kali/.zshrc

echo '
cd /root
alias c="clear;vim program.cpp;c++ program.cpp;./a.out"
alias p="vim script.py;clear;python3 script.py"
alias a="vim prog.asm;clear;nasm -f elf64 -o prog.o prog.asm;ld -o prog prog.o;./prog"
alias e="vim prog.erl;clear;erlc prog.erl;erl -noshell -s prog main -s init stop"
alias j="vim prog.java;clear;javac prog.java;java prog"
alias g="vim script.go;clear;go run script.go"
alias r="vim script.rb;clear;ruby script.rb"
alias s="clear;tree /root"
alias o="rm -rf *"
alias l="clear;ls -lash"
alias offsec="nohup openvpn /home/kali/universal.ovpn &"
alias htb="nohup openvpn /home/kali/HTB.ovpn &"
alias thm="nohup openvpn /home/kali/Binio.ovpn &"
export ALIEN_THEME="red"
source /opt/software/alien/alien.zsh
export ext="pdf,xls,tar,gz,rar,zip,doc,txt,yaml,yml,xls,bak,back,php,htm,html,asp,aspx,jsp,json,docx"
wmctrl -r ":ACTIVE:" -b toggle,fullscreen
alias cb="xclip -select clipboard"
alias download="mv /home/kali/Downloads/* ."
' >> /root/.zshrc

echo -n "alias backup='zip -r /opt/backup.zip " >> /root/.zshrc
echo -n '$(ls /root | egrep "^[^.]" | xargs -I dupa echo "/root/"dupa)' >> /root/.zshrc
echo "'" >> /root/.zshrc


echo -n "alias backupTO='zip -r /opt/TU.zip * && rm -rf * && mv /opt/TU.zip .'" >> /root/.zshrc

##############################################################################################


cd /opt
mkdir software
cd software
git clone https://github.com/eendroroy/alien.git
cd alien
git submodule update --init --recursive
sleep 2
source /opt/alien/alien.zsh


##############################################################################################


cd /opt
mkdir linux
cd linux
mkdir linpeas
cd linpeas
wget https://github.com/carlospolop/PEASS-ng/releases/download/20240226-e0f9d47b/linpeas.sh
wget https://github.com/carlospolop/PEASS-ng/releases/download/20240226-e0f9d47b/linpeas_fat.sh
wget https://github.com/carlospolop/PEASS-ng/releases/download/20240226-e0f9d47b/linpeas_linux_386

cd /opt/linux
mkdir exploit
cd exploit
mkdir dirtyPipe
cd dirtyPipe
git clone https://github.com/AlexisAhmed/CVE-2022-0847-DirtyPipe-Exploits.git
cd CVE-2022-0847-DirtyPipe-Exploits
echo '
#!/bin/bash

gcc exploit-1.c -o exploit-1 --static
gcc exploit-2.c -o exploit-2 --static
' > ./compile.sh
./compile.sh

##############################################################################################


cd /opt
mkdir windows
cd windows
mkdir winpeas
cd winpeas
wget https://github.com/carlospolop/PEASS-ng/releases/download/20240226-e0f9d47b/winPEASany.exe
wget https://github.com/carlospolop/PEASS-ng/releases/download/20240226-e0f9d47b/winPEAS.bat
wget https://github.com/carlospolop/PEASS-ng/releases/download/20240226-e0f9d47b/winPEASx86_ofs.exe

cd /opt/windows
mkdir exploit
cd exploit 
mkdir printSpoofer
cd printSpoofer
wget 'https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe'
cp PrintSpoofer64.exe ps.exe

cd /opt/windows/exploit
mkdir godPotato
cd godPotato
wget https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET4.exe
cp GodPotato-NET4.exe gp.exe

cd /opt/windows
mkdir software
cd software
mkdir mimikatz
cd mimikatz
wget https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20220919/mimikatz_trunk.7z
7z x mimikatz_trunk.7z

cd /opt/windows/software
mkdir rubeus
cd rubeus
wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/blob/master/Rubeus.exe


cd /opt/windows
mkdir scripts
cd scripts
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1
wget https://github.com/PowerShellMafia/PowerSploit/blob/master/Recon/Invoke-Portscan.ps1
##############################################################################################


cd /home/kali
wget 'https://images.squarespace-cdn.com/content/v1/55fc0004e4b069a519961e2d/1442590746571-RPGKIXWGOO671REUNMCB/image-asset.gif?format=2500w' -o wallpaper.jpg


##############################################################################################

cd /usr/share/wordlists
7z x rockyou.txt.gz
rm -rf rockyou.txt.gz


##############################################################################################

echo '
#
# General configuration
#
# start-default-seat = True to always start one seat if none are defined in the configuration
# greeter-user = User to run greeter as
# minimum-display-number = Minimum display number to use for X servers
# minimum-vt = First VT to run displays on
# lock-memory = True to prevent memory from being paged to disk
# user-authority-in-system-dir = True if session authority should be in the system location
# guest-account-script = Script to be run to setup guest account
# logind-check-graphical = True to on start seats that are marked as graphical by logind
# log-directory = Directory to log information to
# run-directory = Directory to put running state in
# cache-directory = Directory to cache to
# sessions-directory = Directory to find sessions
# remote-sessions-directory = Directory to find remote sessions
# greeters-directory = Directory to find greeters
# backup-logs = True to move add a .old suffix to old log files when opening new ones
# dbus-service = True if LightDM provides a D-Bus service to control it
#
[LightDM]
#start-default-seat=true
#greeter-user=lightdm
#minimum-display-number=0
#minimum-vt=7
#lock-memory=true
#user-authority-in-system-dir=false
#guest-account-script=guest-account
#logind-check-graphical=true
#log-directory=/var/log/lightdm
#run-directory=/var/run/lightdm
#cache-directory=/var/cache/lightdm
#sessions-directory=/usr/share/lightdm/sessions:/usr/share/xsessions:/usr/share/wayland-sessions
#remote-sessions-directory=/usr/share/lightdm/remote-sessions
#greeters-directory=$XDG_DATA_DIRS/lightdm/greeters:$XDG_DATA_DIRS/xgreeters
#backup-logs=true
#dbus-service=true

#
# Seat configuration
#
# Seat configuration is matched against the seat name glob in the section, for example:
# [Seat:*] matches all seats and is applied first.
# [Seat:seat0] matches the seat named "seat0".
# [Seat:seat-thin-client*] matches all seats that have names that start with "seat-thin-client".
#
# type = Seat type (local, xremote)
# pam-service = PAM service to use for login
# pam-autologin-service = PAM service to use for autologin
# pam-greeter-service = PAM service to use for greeters
# xserver-command = X server command to run (can also contain arguments e.g. X -special-option)
# xmir-command = Xmir server command to run (can also contain arguments e.g. Xmir -special-option)
# xserver-config = Config file to pass to X server
# xserver-layout = Layout to pass to X server
# xserver-allow-tcp = True if TCP/IP connections are allowed to this X server
# xserver-share = True if the X server is shared for both greeter and session
# xserver-hostname = Hostname of X server (only for type=xremote)
# xserver-display-number = Display number of X server (only for type=xremote)
# xdmcp-manager = XDMCP manager to connect to (implies xserver-allow-tcp=true)
# xdmcp-port = XDMCP UDP/IP port to communicate on
# xdmcp-key = Authentication key to use for XDM-AUTHENTICATION-1 (stored in keys.conf)
# greeter-session = Session to load for greeter
# greeter-hide-users = True to hide the user list
# greeter-allow-guest = True if the greeter should show a guest login option
# greeter-show-manual-login = True if the greeter should offer a manual login option
# greeter-show-remote-login = True if the greeter should offer a remote login option
# user-session = Session to load for users
# allow-user-switching = True if allowed to switch users
# allow-guest = True if guest login is allowed
# guest-session = Session to load for guests (overrides user-session)
# session-wrapper = Wrapper script to run session with
# greeter-wrapper = Wrapper script to run greeter with
# guest-wrapper = Wrapper script to run guest sessions with
# display-setup-script = Script to run when starting a greeter session (runs as root)
# display-stopped-script = Script to run after stopping the display server (runs as root)
# greeter-setup-script = Script to run when starting a greeter (runs as root)
# session-setup-script = Script to run when starting a user session (runs as root)
# session-cleanup-script = Script to run when quitting a user session (runs as root)
# autologin-guest = True to log in as guest by default
# autologin-user = User to log in with by default (overrides autologin-guest)
# autologin-user-timeout = Number of seconds to wait before loading default user
# autologin-session = Session to load for automatic login (overrides user-session)
# autologin-in-background = True if autologin session should not be immediately activated
# exit-on-failure = True if the daemon should exit if this seat fails
#
[Seat:*]
#type=local
#pam-service=lightdm
#pam-autologin-service=lightdm-autologin
#pam-greeter-service=lightdm-greeter
#xserver-command=X
#xmir-command=Xmir
#xserver-config=
#xserver-layout=
#xserver-allow-tcp=false
#xserver-share=true
#xserver-hostname=
#xserver-display-number=
#xdmcp-manager=
#xdmcp-port=177
#xdmcp-key=
#greeter-session=example-gtk-gnome
#greeter-hide-users=false
#greeter-allow-guest=true
#greeter-show-manual-login=false
#greeter-show-remote-login=true
#user-session=default
#allow-user-switching=true
#allow-guest=true
#guest-session=
#session-wrapper=lightdm-session
#greeter-wrapper=
#guest-wrapper=
#display-setup-script=
#display-stopped-script=
#greeter-setup-script=
#session-setup-script=
#session-cleanup-script=
#autologin-guest=false
autologin-user=kali
#autologin-user-timeout=0
#autologin-in-background=false
#autologin-session=
#exit-on-failure=false

#
# XDMCP Server configuration
#
# enabled = True if XDMCP connections should be allowed
# port = UDP/IP port to listen for connections on
# listen-address = Host/address to listen for XDMCP connections (use all addresses if not present)
# key = Authentication key to use for XDM-AUTHENTICATION-1 or blank to not use authentication (stored in keys.conf)
# hostname = Hostname to report to XDMCP clients (defaults to system hostname if unset)
#
# The authentication key is a 56 bit DES key specified in hex as 0xnnnnnnnnnnnnnn.  Alternatively
# it can be a word and the first 7 characters are used as the key.
#
[XDMCPServer]
#enabled=false
#port=177
#listen-address=
#key=
#hostname=

#
# VNC Server configuration
#
# enabled = True if VNC connections should be allowed
# command = Command to run Xvnc server with
# port = TCP/IP port to listen for connections on
# listen-address = Host/address to listen for VNC connections (use all addresses if not present)
# width = Width of display to use
# height = Height of display to use
# depth = Color depth of display to use
#
[VNCServer]
#enabled=false
#command=Xvnc
#port=5900
#listen-address=
#width=1024
#height=768
#depth=8
' > /etc/lightdm/lightdm.conf


##############################################################################################

cd /opt/software
wget https://raw.githubusercontent.com/zackelia/ghidra-dark-theme/main/ghidra-dark.theme

##############################################################################################

cd /opt/software
git clone https://github.com/Gallopsled/pwntools
pip install --upgrade --editable ./pwntools
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh

##############################################################################################

cd /opt/linux
mkdir software
cd software
mkdir pspy
cd pspy
wget 'https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64'
wget 'https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32'

##############################################################################################

cd /opt/linux/exploit
mkdir sudoCVE-2021-3156
cd sudoCVE-2021-3156
mkdir '1-python'
cd '1-python'
wget 'https://raw.githubusercontent.com/worawit/CVE-2021-3156/main/exploit_nss.py'
cd ..
mkdir 2
cd 2
git clone https://github.com/mohinparamasivam/Sudo-1.8.31-Root-Exploit.git
touch 'ExploitKompilujemyNaMaszynieOfiary'

##############################################################################################

cd /opt/windows/software
mkdir chisel
cd chisel
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_amd64.gz
7z x chisel_1.9.1_windows_amd64.gz
rm -rf chisel_1.9.1_windows_amd64.gz

##############################################################################################

cd /opt/windows/software
mkdir nc
cd nc
wget https://github.com/int0x33/nc.exe/raw/master/nc.exe
wget https://github.com/int0x33/nc.exe/raw/master/nc64.exe

##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################

cd
clear
echo '####################   DO ZROBIENIA RECZNIE   #####################'
echo '-> Tapeta pobrana do /home/kali/wallpaper.jpg nalezy recznie ustawic'
echo '-> Schowac ikony na pulpicie'
echo '-> Ustawic wyswietlcz aby sie nie wygasal na ladowaniu/i nie ladowaniu'
echo '-> Zmienic transparentnosc teminala, ustawic trzcionke na 12 w stylu pogrubionym'
echo '-> Ustawienie dark-mode in ghidra, Edit->Theme->Import i wymieramy /opt/software/ghidra-dark.theme'
echo '-> Ustawic dark-mode w burpie community'
echo '-> Ustawic na 6szt pulpitow'
echo '-> Ustawic ciemne tlo w owasp-zap'

##############################################################################################
