#! /bin/bash

if [ $# -lt 2 ]
then
	echo "Zbyt mala liczba argumentow!"
	echo "Poprawna skladania: nazwa_pliku katalog1 [katalog2]"
	exit 1
fi

if [ ! -e $1 ]
then
	echo "Plik o nazwie $1 nie istnieje w katalogu: `pwd` "
	exit 1
elif [ -d $1 ]
then
	echo "Podales nazwe katalogu jako plik."
	echo "Skrypt szuka dowiazan plikow"
	echo "Poprawna skladania: nazwa_pliku katalog1 [katalog2]"
	exit 1
else
	echo "plik istnieje jest OK"
fi

if [ ! -d $2 ]

then
	echo "Niepoprawna nazwa katalogu 1"
	echo "Poprawna skladnia: nazwa_pliku katalog1 [katalog2]"
	exit 1
else
	echo "Katalog 1 jest OK"
fi


if [ ! -r $2 ]
then
	echo "Nie masz praw odczytu do katalogu $2"
	echo "Sprawdzenie dowiazan niemozliwe."
	exit 1
fi

if [ $3 ]
then
	if [ ! -d $3 ]
	then
		echo "Niepoprawna nazwa katalogu 2"
		echo "Poprawna skladnia: nazwa_pliku katalog1 [katalog2]"
		exit 1
	else
	echo "Katalog 2 jest OK"
	fi
	if [ ! -r $3 ]
	then
		echo "Nie masz praw odczytu do katalogu $3"
		echo "Sprawdzenie dowiazan niemozliwe"
		exit 1
	fi
fi


declare iwezel=`stat -c%i $1`
declare licz_dowiazan=`stat -c%h $1`

echo "numer i-wezla pliku $1: $iwezel"
echo "liczba dowiazan twardych pliku $1: $licz_dowiazan"
echo
echo "Lista dowiazan pliku $1:"
echo
echo "W katalogu $2 i jego podkatalogach:"
find $2 -inum $iwezel

if [ $3 ]
then
	echo "W katalogu $3 i jego podkatalogach:"
	find $3 -inum $iwezel
fi
