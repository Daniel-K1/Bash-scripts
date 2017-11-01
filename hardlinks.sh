#! /bin/bash

if [ $# -lt 2 -o $# -gt 3 ]
then
	echo "Incorrect syntax!"
	echo "Correct syntax: file_name catalogue1 [catalogue2]"
	exit 1
fi

if [ ! -e $1 ]
then
	echo "File <$1> doesn't exist in catalogue: <`pwd`> "
	exit 1
elif [ -d $1 ]
then
	echo "<$1> is a catalogue. File name needed."
	echo "Correct syntax: file_name catalogue1 [catalogue2]"
	exit 1
else
	echo "File exist."
fi

if [ ! -d $2 ]

then
	echo "Incorrect  name of catalogue 1"
	echo "Correct syntax: file_name catalogue1 [catalogue2]"
	exit 1
else
	echo "Catalogue 1 is correct"
fi


if [ ! -r $2 ]
then
	echo "You don't have permissions to access catalogue <$2>"
	echo "Can't check hardlinks."
	exit 1
fi

if [ $3 ]
then
	if [ ! -d $3 ]
	then
	echo "Incorrect name of catalogue  2"
	echo "Correct syntax: file_name catalogue1 [catalogue2]"
	exit 1
	else
	echo "Catalogue  2 is correct"
	fi
	if [ ! -r $3 ]
	then
	echo "You don't have permissions to access catalogue <$3>"
	echo "Can't check hardlinks"
	exit 1
	fi
fi


declare iwezel=`stat -c%i $1`
declare licz_dowiazan=`stat -c%h $1`

echo "file <$1> i-node number: $iwezel"
echo "Number of file <$1> hardlinks: $licz_dowiazan"
echo
echo "List of file <$1> hardlinks:"
echo
echo "In catalogue <$2> and it's subcatalogues:"
find $2 -inum $iwezel

if [ $3 ]
then
	echo "In catalogue <$3> and it's subcatalogues:"
	find $3 -inum $iwezel
fi
