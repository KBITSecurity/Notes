# Content
1. [Podzial na fragmenty](#Podzial-na-fragmenty)
2. [Przeslanie nc](#Przeslanie-nc)
3. [Przeslanie przez ssh scp](#Przeslanie-przez-ssh-scp)


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
```console
scp file.ext kali@192.168.45.193:/tmp
```
