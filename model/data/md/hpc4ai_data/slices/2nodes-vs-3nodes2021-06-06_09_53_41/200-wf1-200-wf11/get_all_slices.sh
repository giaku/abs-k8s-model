
#$1 duration, see vegeta man, for example "200s"

for dd in `find ./*wf*/ -maxdepth 0 -mindepth 0 -type d` ; do
  
  echo "$dd"
  ./slices.sh ./dump.csv $dd $(dir $dd)-fetta

done

#mkdir outputs

cp --parents `find . -mindepth 2 -maxdepth 2 | grep .csv` ./outputs/
cp --parents `find . -mindepth 3 -maxdepth 3 | grep .txt` ./outputs/
