Requirements
============

The requirements are WARC tools by Hanzo and s3cmd a command line tool for BASH written in python, for our AMI (debian wheezy, are taken care of by execution of:

```
./Bootstrap.sh
```

Consider using this via EMR service

This will install s3cmd via:

```
sudo apt-get install s3cmd

s3cmd --configure
```
You must proceed with your aws information by your own method to download buckets using your aws account.



Background
==========

The Common crawl corpus (www.commoncrawl.org) is a non-profit a digital archive of "snapshots" of the web hosted as [aws s3 buckets](https://aws.amazon.com/datasets).   


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



