# Podzial na fragmenty
### Pierwotna wersja
![](PodzielenieNaMniejszeFragmenty.png)
### Dobry sposob
Podzielenie na ilosc partii
```console
split -n 20 file_to_split
```
Zlaczenie podzielonych kawalkow
```console
cat x* > scale_file
```
