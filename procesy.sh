#!/bin/bash

echo "===== MANAGER PROCESOW SYSTEMOWYCH ====="
echo
echo "[1] 20 procesow zuzywajacych najwiecej pamieci:"
echo "----------------------------------------------"
ps aux --sort=-%mem | head -20
echo "----------------------------------------------"
echo

read -p "[2] Podaj fragment nazwy procesu do filtrowania: " NAZWA

FILTERED=$(ps aux | grep -i "$NAZWA" | grep -v grep)

echo
echo "===== PROCESY PASUJĄCE DO FILTRA ====="

if [ -z "$FILTERED" ]; then
    echo "Brak procesów pasujących do filtra."
    exit 1
fi

echo "$FILTERED"
echo

read -p "[3] Podaj PID procesu do zakończenia: " PID

if ! ps -p "$PID" > /dev/null 2>&1; then
    echo "Proces o PID $PID nie istnieje."
    exit 1
fi

kill "$PID"

if [ $? -eq 0 ]; then
    echo "[OK] Proces $PID został pomyślnie zakończony."
else
    echo "[ERROR] BRAK UPRAWNIEŃ lub nie udało się zakończyć procesu $PID."
fi
