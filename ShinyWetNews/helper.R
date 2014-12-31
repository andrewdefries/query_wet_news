###################
library(wordcloud)
library(tm)
library(shiny)
library(igraph)
library(parallel)
###################
###################
#do some work here and then move off to helper.R

#system("./TryMe.sh")

files<-list.files(pattern=".result", recursive=T)

#get corpus list
MyCorpus<-Corpus(DirSource("TXT/", recursive=T),readerControl=list(language="english"))

#lower case corpus
MyCorpus<-tm_map(MyCorpus, tolower)

#make a function to remove lone numbers
#http://stackoverflow.com/questions/23864860/using-filter-in-tm-maptestfile-removenumbers-in-r
####
#some work to be done as p450 is p
remove_lone_numbas <- function (x){
#gsub('\\s*(?<!\\B|-)\\d+(?!\\B|-)\\s*', "", x,perl=TRUE)
gsub('\\s*[0-9]s*', "", x,perl=TRUE)
#gsub("[[:digit:]]+", "", x)
}
####
##make this into a radio button
#remove lone numbers
MyCorpus<-tm_map(MyCorpus, remove_lone_numbas)

#remove copied entries
#Not working now
#http://stackoverflow.com/questions/21731246/how-to-remove-duplicates-from-a-corpus-using-the-tm-package-in-r
##MyCorpus<-tm_map(MyCorpus, unique)
####
##removeDup <- function(x) as.list(unique(unlist(x)))
##MyCorpus<-tm_map(MyCorpus, removeDup)
MyCorpus<-tm_map(MyCorpus, stemDocument, language="english")
MyCorpus<-tm_map(MyCorpus, removeWords, stopwords("english"))
dtm <- DocumentTermMatrix(Corpus(VectorSource(MyCorpus)), control = list(removePunctuation = TRUE, stopwords = TRUE))

dtm<-removeSparseTerms(dtm,0.1) #or 0.2


save(MyCorpus, file="CorpusReady.rda", compress=T)
save(dtm, file="dtm.rda", compress=T)
save(files,file="files.rda", compress=T)



