@echo off

setlocal
title Raport konfiguracji sieci
color 71

set RAPORT=raport_sieci.txt

echo ======================================
echo    GENERATOR RAPORTU KONFIGURACJI SIECIOWEJ
echo ======================================
echo.

echo =============================== > %RAPORT%
echo RAPORT SIECIOWY >> %RAPORT%
echo Data i godzina: %date% %time% >> %RAPORT%
echo =============================== >> %RAPORT%
echo. >> %RAPORT%

echo [1] Zapisuje konfiguracje sieci...
echo.
echo ===== IPCONFIG /ALL ===== >> %RAPORT%
ipconfig /all >> %RAPORT%
echo.

echo [2] Wyszukuje adresy IPv4...
echo.
echo Adresy IPv4:
ipconfig /all | find "IPv4"
echo. >> %RAPORT%

echo [3] Test polaczenia z internetem...
echo.
echo ===== TEST PING ===== >> %RAPORT%
ping -n 4 google.pl >> %RAPORT%

if %errorlevel%==0 (
    echo Polaczenie dziala
) else (
    echo BRAK polaczenia
)
echo.

echo [4] Podglad wygenerowanego raportu:
echo.
echo ===== RAPORT =====
echo.
type %RAPORT%
echo.
echo ===== KONIEC RAPORTU =====
echo.
echo Raport zapisany: %RAPORT%

pause
