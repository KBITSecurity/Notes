## Strony
https://www.wireshark.org/docs/dfref/s/smtp.html

## Trisks
### Wyekrsportowanie danych np. zdjec
1. Klikamy File -> Export Object
2. Tu mamy do wyboru z kad chcemy exportowac
3. W nastepnym oknie widzimy co znalazl wireshark dla dnego strumienia

## Strumienie tcp - ilosc
1. Filtrujemy (tcp.stream eq 2)
2. Zamiast 2 mozemy podawac dowolna liczbe, bo wireshark wykryl iles strumieni i tu mozna kolejno patrzec jakie sa.

## Deszyfracja TLS 
### Jak mamy klucze
Edit > Preferences > TLS (podajemy w polu (Pre)-Master-Secret)

## Filatry
### Wyswietlenie certyfikatow
    tls.handshake.certificate
