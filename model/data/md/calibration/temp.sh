for xxx in `find . -mindepth 1 -maxdepth 1`
do
for xx in `find $xxx -mindepth 1 -maxdepth 1`
do
  #echo $xx
  if [ -d "$xx" ]
  then
    for x in `find $xx -mindepth 1 -maxdepth 1`
    do
      if [ -d "$x" ]
      then
        echo "Dir $x remains to be checked"
      else
        echo "File $x needs to be renamed"
        echo "renamed from: $x"
        newx=`echo "$x" | sed 's/:/_/g'`
        mv $x $newx
        echo "to $newx" 
      fi
    done
  fi
  #mv -- "$x" "${x// /_}"
done
done