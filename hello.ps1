# hello.ps1
Write-Host "=========================================" -ForegroundColor White -BackgroundColor DarkBlue
Write-Host " Witaj w PowerShell!" -ForegroundColor Yellow -BackgroundColor DarkBlue
Write-Host "=========================================" -ForegroundColor White -BackgroundColor DarkBlue

Write-Host ""
$Imie = Read-Host "Podaj swoje imie"
Write-Host ""
$Data = Get-Date -Format "dd.MM.yyyy HH:mm:ss"
$WersjaPS = $PSVersionTable.PSVersion
$System = (Get-CimInstance Win32_OperatingSystem).Caption

Write-Host "=========================================" -ForegroundColor White -BackgroundColor DarkBlue
Write-Host " Witaj, $Imie!" -ForegroundColor Yellow -BackgroundColor DarkBlue
Write-Host "=========================================" -ForegroundColor White -BackgroundColor DarkBlue

Write-Host ""
Write-Host "Data i godzina: $Data" -ForegroundColor Green
Write-Host "Wersja PowerShell: $WersjaPS" -ForegroundColor Cyan
Write-Host "Katalog domowy: $env:USERPROFILE" -ForegroundColor Magenta
Write-Host "Nazwa komputera: $env:COMPUTERNAME" -ForegroundColor Yellow
Write-Host "System operacyjny: $System" -ForegroundColor White
Write-Host ""
Pause