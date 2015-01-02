rm result.txt 
rm runlog
touch runlog
rm *.gz

warclist=(`cat 2014_WetDump | shuf | head -n 108`)

for m in "${warclist[@]}"
do
######
s3cmd get $m
###
echo "$m" >> runlog
###
newslists=(`cat MasterNewsList.txt | sort | uniq | shuf | head -n 108`)
wetfile=(`basename $m`)
zcat $wetfile > $wetfile.tmp

for i in "${newslists[@]}"
do
echo "$i" >> runlog
#######
newsname=(`echo $i | sed 's/http:\/\///g' | sed 's/\///g'`)
mkdir $newsname
#######
cat $wetfile.tmp | warcfilter --url "$i" > $wetfile.result
mv $wetfile.result $newsname

#remove empty files recursive down the tree
find . -type f -empty -delete
find . -type d -empty -delete

###
##s3cmd put -r $newsname s3://commoncrawlnews
###
##rm -r $newsname


done
###
###
###
rm $wetfile.tmp
rm *.gz

echo "next one"
#####
done
#####

