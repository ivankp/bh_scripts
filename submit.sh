#!/bin/bash

bh=/msu/data/t3work2/ivanp/H1j-ggf/bh

scripts=/msu/data/t3work2/ivanp/scripts
out=$scripts/out

mkdir -p $out

pat="\.root$"
if [ -n "$2" ]; then
  pat="$1.*$2.*$pat"
elif [ -n "$1" ]; then
  pat="$1.*$pat"
fi

for f in `ls $bh | grep $pat`; do

echo ""
echo "Submitting $f"
echo ""

b=`basename $f .root`
of=$out/$b

echo "
universe = vanilla
executable = $scripts/hist_Hjets.sh
arguments = \"$f\"
error  = $of.err
log    = $of.log
output = $of.out
queue 1
" | condor_submit -

while [ ! -e $of.out ]; do
  sleep 1
done
while [[ "`head -1 $of.out`" != "Copying took"* ]]; do
  sleep 1

  # stop waiting if error
  if [ -s $of.err ]; then
    cat $of.err
    break
  fi
done


head -1 $of.out

done

echo 'DONE!'

