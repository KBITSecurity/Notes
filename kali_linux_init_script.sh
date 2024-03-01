##############################################################################################


apt-get update
apt-get install -y gobuster feroxbuster seclists wmctrl git 7z


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
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################

cd

##############################################################################################
