Import-Module PsGet
echo "Installing Pester"
Install-Module Pester -Destination ../WindowsPowerShell/Modules
echo "Importing Pester"
Import-Module Pester
echo "Pester imported"
Get-Module
Invoke-Pester