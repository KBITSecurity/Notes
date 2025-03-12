clear
echo "************************************************************************"
echo ""
ls C:\Users
echo ""
echo ""
echo "________________________________________________________________________"
echo "*************************** Podaj nazwe ********************************"
echo "------------------------------------------------------------------------"
echo ""
$USERCONF = Read-Host "Nazwa usera do konfiguracji"

echo "Hello $dupa"


mkdir C:\tools
mkdir C:\tools\wordlists
cd C:\tools\wordlists

git clone https://github.com/danielmiessler/SecLists.git

Get-ChildItem -Path "C:\tools\wordlists\SecLists\Discovery\*" -Filter "*.txt" -Recurse | Get-Content > first
Get-ChildItem -Path "C:\tools\wordlists\SecLists\Fuzzing\*" -Filter "*.txt" -Recurse | Get-Content > second
Get-Content first,second | Set-Content together
Get-Content together | Sort-Object -Unique | Set-Content webFullListEndpointsPayloads
del first,second,together




'
function sqlmap {
        python C:\tools\sqlmap\sqlmap.py $args
}
function gobuster {
        C:\tools\Enumeracja\gobuster.exe $args
}
function feroxbuster {
        C:\tools\Enumeracja\feroxbuster.exe $args
}
function ffuf {
        C:\tools\Enumeracja\ffuf.exe $args
}
function nc {
        C:\tools\nc\nc64.exe $args
}
' > C:\Users\$USERCONF\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
