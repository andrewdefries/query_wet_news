Requirements
============

Install s3cmd via:

```
sudo apt-get install s3cmd

s3cmd --configure
```
Proceed with your aws information

Install Hanzo warc tools as detailed here: http://code.hanzoarchives.com/warc-tools/wiki/Home


Background
==========

The Common crawl corpus (www.commoncrawl.org) is a non-profit a digital archive of "snapshots" of the web hosted as aws s3 buckets.   

![Common Crawl Corpus via aws s3 buckets](https://github.com/andrewdefries/query_wet_news/blob/master/CommonCrawlCorpus.png "aws dataset")


query_wet_news
==============

Looking through the common crawl archives news entries


Parallelization strategy
========================

Currently prototyping Map-Reduce principles using BASH fork. 
For example:

```

./CycleThroughFilterShuf.sh & ./CycleThroughFilterShuf.sh ... 
 
```

![Program execution sequence](https://github.com/andrewdefries/query_wet_news/blob/master/ParallelBatch.png "Breakdown of Program execution sequence")

The s3 buckets in a list are used. The program CycleThroughFilterShuf.sh goes through the list and shuffles it so that you get a sample segment of the total crawl. For example, by using the BASH shuf command the list. The bucket list for [2014 is here](https://github.com/andrewdefries/query_wet_news/blob/master/NewsListsFromBlekko/AggregateNreduce/2014_WetDump)



