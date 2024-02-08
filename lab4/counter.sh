option=$1
filename=$2

case $option in 
-linecount)
wc -l < "$filename"
;;
-wordcount)
wc -w < "$filename"
;;
-charcount)
wc -c < "$filename"
;;
*)
esac