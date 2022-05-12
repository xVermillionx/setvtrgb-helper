#!/bin/bash

[ -f $1 ] || exit 1

colorFile=$1

colors=($(sed -E 's/^.*#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2}.*)/\1 \2 \3/g' $colorFile))

length=${#colors[@]}

last_three=$(($length-3))

files=("red" "grn" "blu")
echo -n > default_${files[0]}
echo -n > default_${files[1]}
echo -n > default_${files[2]}
i=0
for m in ${colors[@]}; do
  echo -n $((16#$m)) >> default_${files[$(($i%3))]}
  if [ $i -ge $last_three ]; then
    echo             >> default_${files[$(($i%3))]}
  else
    echo -n ,        >> default_${files[$(($i%3))]}
  fi
  i=$((i+1))
done;

# cat default_${files[@]} > FILE
cat default_{red,grn,blu} > FILE

