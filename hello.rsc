# Deklaracja zmiennych
:local name "Katarzyna"
:local year 2026

:put ""
:put "============================"
:put "         MIKROTIK!"
:put "============================"
:put ""

:put ("Witaj, " . $name . "!")

:set year ($year + 1)
:put ("Prognoza: następny rok to " . $year)

:put ("10 + 8 = " . (10 + 8))
:put ("10 * 8 = " . (10 * 8))
:put ("10 / 8= " . (10 / 8))

# Długość imienia
:put ("Długość imienia: " . [:len $name])

:put "============================"
