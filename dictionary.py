import json, os, random

DICTIONARY = "dictionary.json"

def wczytaj():
    if os.path.exists(DICTIONARY):
        with open(DICTIONARY, "r", encoding="utf-8") as f:
            return json.load(f)
    return {}

def zapisz(dictionary):
    with open(DICTIONARY, "w", encoding="utf-8") as f:
        json.dump(dictionary, f, indent=3, ensure_ascii=False)

def dodaj(dictionary):
    angielski = input("Podaj słówko po angielsku: ").strip().lower()
    if angielski in dictionary:
        print("To słówko jest już dodane!")
        return
    znaczenie = input("Podaj znaczenie dodawanego słówka: ").strip().lower()
    dictionary[angielski] = znaczenie;
    zapisz(dictionary)
    print("Słówko zostało dodane!")

def usun(dictionary):
    angielski = input("Podaj słówko, które chcesz usunąć: ").strip().lower()
    if angielski in dictionary:
        del dictionary[angielski];
        zapisz(dictionary);
        print("Słówko zostało usunięte ze słownika!")
    else:
        print("Podanego słówka nie było w słowniku!")

def szukaj(dictionary):
    angielski = input("Jakie słówko chcesz przetłumaczyć? ").strip().lower()
    if angielski in dictionary:
        print(f"{angielski} -> {dictionary[angielski]}")
    else:
        print("Szukanego słówka nie ma w słowniku!")

def quiz(dictionary):
    if len(dictionary) < 5:
        print(f"Aby uruchomić quiz w słowniku musi być co najmniej 5 słówek. Dodaj jeszcze {5 - len(dictionary)} słówek.")
    else:
        pytania = random.sample(list(dictionary), min(5, len(dictionary)))
        wynik = 0

        for angielski in pytania:
            pytanie = input(f"Co znaczy {angielski}? ").strip().lower()
            if pytanie == dictionary[angielski]:
                print("Dobra odpowiedź! Zdobywasz punkt!")
                wynik += 1
            else:
                print(f"Zła Odpowiedź! Poprawna odpowiedż to: {dictionary[angielski]}")
        print(f"Wynik: {wynik}/{len(pytania)}")

dictionary = wczytaj()

while True:
    print(f"\n=== SŁOWNIK ma obecnie ({len(dictionary)} słów) ===")
    print("Co chcesz zrobić?")
    print("1-Dodaj 2-Usuń 3-Szukaj 4-Wyświetl 5-Quiz 6-Koniec")

    wybor = input("Wybor: ")
    if wybor == "1": dodaj(dictionary)
    elif wybor == "2": usun(dictionary)
    elif wybor == "3": szukaj(dictionary)
    elif wybor == "4":
        if len(dictionary) == 0:
            print("Słownik jest pusty!")
        else:
            for angielski in sorted(dictionary):
                print(f"  '{angielski}' -> '{dictionary[angielski]}'")
    elif wybor == "5": quiz(dictionary)
    elif wybor == "6": break