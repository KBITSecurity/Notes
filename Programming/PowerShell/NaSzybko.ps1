1) PowerShell
      •  Wyswietlenie zawartosci pliku
            ▪ Get-Content “<file>”
      • Policzenie linijek w pliku dane o outpucie
            ▪ Get-Content “<file>" | measure
            ▪ costam costam | Measure-Object
      • Zdekodowanie base64
            ▪ certutil -decode <file> <output>
      • Zalogowanie na innego uzytkownika
            ▪  runas /user:<domena>\<username> cmd.exe
      • Pobranie pliku
            ▪ Invoke-WebRequest “<ip>/<plik>” -OutFile “<file name>”
      • Zmierzenie obiektu np. policzenie lini
            ▪ <dane> | Measure-Object
      • Odblokowanie skryptow
            ▪ Get-ExecutionPolicy (powinno byc Unrestricted)
            ▪ Set-ExecutionPolicy Unrestricted
            ▪ Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
            ▪ powershell -ex bypass -File thm.ps1
      • hash
            ▪ CertUtil -hashfile ComplexCalculatorv2.exe MD5|SHA256|SHA512
            ▪ Get-FileHash file_name -Algorithm MD5|SHA256|SHA512
      • Dodanie nowego usera i odrazu do adminow
            ▪ net user sid hello!123 /add;net localgroup Administrators sid /add

