
#$1 duration, see vegeta man, for example "200s"

for dd in `find ./*wf*/ -maxdepth 0 -mindepth 0 -type d` ; do
  
  echo "$dd"
  ./slices.sh ./dump-4nodes.csv $dd $(dir $dd)-fetta-4-nodes

done

mkdir outputs1

cp --parents `find . -mindepth 2 -maxdepth 2 | grep .csv` ./outputs1/
cp --parents `find . -mindepth 3 -maxdepth 3 | grep .txt` ./outputs1/

for dd in `find ./*wf*/ -maxdepth 0 -mindepth 0 -type d` ; do

  echo "$dd"
  ./slices.sh ./dump-1node.csv $dd $(dir $dd)-fetta-1-node

done

mkdir outputs2

cp --parents `find . -mindepth 2 -maxdepth 2 | grep .csv` ./outputs2/
cp --parents `find . -mindepth 3 -maxdepth 3 | grep .txt` ./outputs2/
