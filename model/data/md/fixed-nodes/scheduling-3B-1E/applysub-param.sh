#$1 the file
#$2 first to swap
#$3 second to swap
sed -i ''  "s/w$2/w9/g; s/worker--$2/worker--9/g; s/w$3/w$2/g; s/worker--$3/worker--$2/g; s/w9/w$3/g; s/worker--9/worker--$3/g" $1

