#remove empty files recursive down the tree
find . -type f -empty | xargs rmdir
find . -type d -empty | xargs rmdir

#gives error if none to remove

rm SegmentsToSurvey
touch SegmentsToSurvey

news=(`ls -d */`)

for m in "${news[@]}"

do
###
count=(`ls $m/*.result | wc -l`)

echo "$count $m"  >> SegmentsToSurvey

cat SegmentsToSurvey | sort -n | sed '1!G;h;$!d' > SegmentsRevSorted

cat SegmentsRevSorted

###
done
