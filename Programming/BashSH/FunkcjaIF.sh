#!/bin/bash

#Trzeba dac spacje po obu strnach nawiasow [ ] bo nie zadziala


count=10

if [ $count -eq 2 ] # Mozna dac znaczek >
then
        echo "wieksze od 10"
else 
        if [ $count == 10 ]
        then
                echo "Rowne 10"
        else
                echo "Mniejsze od 10"
        fi
fi 



#Flagi 
# (-f) sprawdza czy plik istnieje
# (-d) sprawdza czy mozemy wyswietlic katalog
# (-r) sprawdza czy mozemy czytac z pliku
# (-w) sprawdza czy mozemy zapisywac do pliku

plik=$1
if [ -f "$plik" ]
then
        echo "Plik istnieje"
        if [ -w "$plik" ]
        then
                echo "Mozemy zapisywac do pliku"
        else
                echo "Nie mozemy zapisywac do pliku"
        fi
else
        echo "Brak pliku"
fi
