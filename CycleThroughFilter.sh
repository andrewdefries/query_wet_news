#be sure to install warc tools via python
#git clone 

#Takes long to run, run once
#s3cmd ls --recursive s3://aws-publicdatasets/common-crawl/crawl-data/CC-MAIN-2014-10/ | cut -c 30-300 | sed '/warc.gz/d' | sed '/warc.wat.gz/d' > 2014_WetDump

rm result.txt 


warclist=(`cat 2014_WetDump`)
for m in "${warclist[@]}"
do
######
s3mcd cp $m
###
#nested
###
###
###
newslists=(`cat NewsLists`)
for i in "${newslists[@]}"
do
######
echo "########################################################################################################################################" >> result.txt
echo "###############################################################$i#######################################################################" >> result.txt
echo "########################################################################################################################################" >> result.txt
echo "$i" >> result.txt
echo "$i"
#######
#zcat CC-MAIN-20130516134005-00099-ip-10-60-113-184.ec2.internal.warc.wet.gz | warcfilter --url "$i"  >> result.txt
zcat $m | warcfilter --url "$i"  >> result.txt
echo "$i" >> result.txt
done
###
###
###

rm $m

echo "########################################################################################################################################" >> result.txt
echo "################################################################$m######################################################################" >> result.txt
echo "########################################################################################################################################" >> result.txt


#####
done
#####

