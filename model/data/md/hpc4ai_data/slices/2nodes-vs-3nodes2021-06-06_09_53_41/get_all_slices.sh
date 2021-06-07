
#$1 duration, see vegeta man, for example "200s"

for dd in `find ./*wf*/ -maxdepth 0 -mindepth 0 -type d` ; do
  
  echo "$dd"
  ./slices.sh ./dump-3nodes.csv $dd $(dir $dd)-fetta-3-nodes

done

mkdir outputs1

cp --parents `find . -mindepth 2 -maxdepth 2 | grep .csv` ./outputs1/
cp --parents `find . -mindepth 3 -maxdepth 3 | grep .txt` ./outputs1/

for dd in `find ./*wf*/ -maxdepth 0 -mindepth 0 -type d` ; do

  echo "$dd"
  ./slices.sh ./dump-2nodes.csv $dd $(dir $dd)-fetta-2-nodes

done

mkdir outputs2

cp --parents `find . -mindepth 2 -maxdepth 2 | grep .csv` ./outputs2/
cp --parents `find . -mindepth 3 -maxdepth 3 | grep .txt` ./outputs2/
