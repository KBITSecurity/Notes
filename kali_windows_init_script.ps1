mkdir C:\tools
mkdir C:\tools\wordlists
cd C:\tools\wordlists

git clone https://github.com/danielmiessler/SecLists.git

Get-ChildItem -Path "C:\tools\wordlists\SecLists\Discovery\*" -Filter "*.txt" -Recurse | Get-Content > first
Get-ChildItem -Path "C:\tools\wordlists\SecLists\Fuzzing\*" -Filter "*.txt" -Recurse | Get-Content > second
Get-Content first,second | Set-Content together
Get-Content together | Sort-Object -Unique | Set-Content webFullListEndpointsPayloads
del first,second,together
