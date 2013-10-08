Import-Module PsGet
echo "Installing Pester"
Install-Module Pester
echo "Importing Pester"
Import-Module Pester
echo "Pester imported"
Get-Module
Invoke-Pester