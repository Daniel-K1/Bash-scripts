#! /bin/bash

declare x

echo "Type symbol (+,-,/,*):"
read x

case "$x" in
"+") echo "$1 + $2 = `expr $1 + $2`" ;;
"-") echo "$1 - $2 = `expr $1 - $2`" ;;
"/") echo "$1 / $2 = `expr $1 / $2`" ;;
"*") echo "$1 * $2 = `expr $1 \* $2`" ;;
*)
echo "Invalid command."
echo "Please tpy one of the following: +,-,/,*"
esac

#echo `expr $1 + $2`
#echo "$x"
