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
source /opt/alien/alien.zsh
export ext="pdf,xls,tar,gz,rar,zip,doc,txt,yaml,yml,xls,bak,back,php,htm,html,asp,aspx,jsp,json"
wmctrl -r ":ACTIVE:" -b toggle,fullscreen
' >> /root/.zshrc

echo -n "alias backup='zip -r /opt/backup.zip " >> /root/.zshrc
echo -n '$(ls /root | egrep "^[^.]" | xargs -I dupa echo "/root/"dupa)' >> /root/.zshrc
echo -n "'" >> /root/.zshrc


##############################################################################################


cd /opt
git clone https://github.com/eendroroy/alien.git
cd alien
git submodule update --init --recursive
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


##############################################################################################


cd /opt
mkdir windows
cd windows
mkdir winpeas
cd winpeas
wget https://github.com/carlospolop/PEASS-ng/releases/download/20240226-e0f9d47b/winPEASany.exe
wget https://github.com/carlospolop/PEASS-ng/releases/download/20240226-e0f9d47b/winPEAS.bat
wget https://github.com/carlospolop/PEASS-ng/releases/download/20240226-e0f9d47b/winPEASx86_ofs.exe


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

cd /opt
mkdir software
cd software
wget https://raw.githubusercontent.com/zackelia/ghidra-dark-theme/main/ghidra-dark.theme
echo 'Ustawienie dark-mode in ghidra, Edit->Theme->Import i wymieramy /opt/software/ghidra-dark.theme'


##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################

cd

##############################################################################################
