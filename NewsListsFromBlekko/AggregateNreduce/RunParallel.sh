#./CycleThroughFilterShuf.sh & ./CycleThroughFilterShuf.sh


ncores=(`nproc`)


touch RunParallelBatch.sh
echo "./CycleThroughFilterShuf.sh" > RunParallelBatch.sh

for (( i=0 ; i<$ncores ; i+$ncores))

do

echo $i
let i++

#
echo "& ./CycleThroughFilterShuf.sh" >> RunParallelBatch.sh

done

cat RunParallelBatch.sh | sed ':a;N;$!ba;s/\n/ /g' > tmp

mv tmp RunParallelBatch.sh

chmod +x RunParallelBatch.sh

./RunParallelBatch.sh
