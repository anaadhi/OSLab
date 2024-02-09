name=${1}

newName=`echo $1 | sed "s/\./\_copy\./"`

cp $1 $newName