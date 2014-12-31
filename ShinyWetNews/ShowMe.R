##################
library(tm)
library(wordcloud)
#################

files<-list.files(pattern=".result", recursive=T)
pdf(file="abcnews.go.com.pdf")
########################
ByNewsList<-function(a){
########################
#LoadMe<-subset(files, grepl(strsplit(readLines("NewsList"), "\\t+", perl=T)[[a]], files))
#LoadMe<-strsplit(readLines("NewsList"), "\\t+", perl=T)[[a]]
#
#MyCorpus<-Corpus(VectorSource(LoadMe))##,readerControl=list(language="english"))
go<-paste("TXT/","abcnews.go.com",sep="")

MyCorpus<-Corpus(DirSource(go),readerControl=list(language="english"))
#
MyCorpus<-tm_map(MyCorpus, tolower)
MyCorpus<-tm_map(MyCorpus, stemDocument, language="english")
MyCorpus<-tm_map(MyCorpus, removeWords, stopwords("english"))
#
wordcloud(MyCorpus[[a]])
########################
}
########################
a<-1:150##:length(files)
lapply(a, ByNewsList)

dev.off()
