echo "Importing PSGet"
# (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
Import-Module PsGet
echo "Installing Pester"
Install-Module Pester -Destination ../WindowsPowerShell/Modules
echo "Importing Pester"
Import-Module Pester
echo "Pester imported"
Get-Module
Invoke-Pester -OutputXml PesterTestResults.xml
