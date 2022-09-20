1) Na szybko
      • Usuniecie powtarzajacych sie lini z pliku
            ▪ cat file | awk '{print $3}' | awk '!x[$0]++' > file.new
      • Podzielenie lini i wybranie pola
            ▪ cut -d “<delimiter>” -f <field>
      • Nakladka na netcat 
            ▪ rlwrap nc -nlvp 4444
      • Zmiana wyrazenia na inne w wielu plikach
            ▪ sed -i ‘s/<co jest>/<co ma byc>/g’ *
      • Skopiowanie pliku do schowka
            ▪ xclip -selection clipboard < <file>
      • Programy nasluchujace na portach
            ▪ sudo lsof -nP -iTCP -sTCP:LISTEN
            ▪ sudo netstat -tunlp
            ▪ sudo ss -tunlp
      • Oczyszczenie tekstu z tagow HTML
            ▪ html2text
      • Wylosowanie hasel
            ▪ head /usr/share/wordlists/rockyou.txt -n 10000 | shuf -n 5 -
      • E-maile 10 min / oczyszczanie z spacji
            ▪ Https://temp-mail.org/pl/10minutemail  
            ▪ http://skryptyonline.pl/usuwanie_spacji
      • Zamiana wszystkich wyrazen na pierwsza duza litera reszta mala
            ▪ cat top_1000_usa_malenames_english.txt | tr [:upper:] [:lower:] | sed -e 's/^./\U&/'   
      • Przekazanie pythonem wartosci wejsciowej do programu
            ▪ python -c 'print "A"*44 + "\xcb\x84\x04\x08"' | /opt/secret/root
    
    
    
    
      
