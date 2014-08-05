#remove warc blocks via sed

#
news=(`ls -d */`)

for m in "${news[@]}"

do 


name=(`echo $m | sed 's/www.//g' | cut -d '.' -f1`)

#remove WARC headers via sed, tr makes alphabet to lower, tr removes non-alphabeticals, sort sorts, uniq shows unique entries with count
 
cat $m/*.result | sed '/WARC\|Content-*/d' | tr 'A-Z' 'a-z' | tr -sc 'A-Za-z' '\n' | sort | uniq -c | sort -n -r > $name.vocab


done

rm VocabResults
mkdir VocabResults
mv *.vocab VocabResults
