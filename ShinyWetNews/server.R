###################
library(wordcloud)
library(tm)
library(shiny)
#library(plotrix)
library(lattice)
###################

#run helper.R only once or run separately to get working env
#source("helper.R")
################################################################
#load("CorpusReady.rda")
#load("dtm.rda")
load("files.rda")
################################################################
partners<-read.table("NewsList")
colnames(partners)<-"name"
#partners<-unlist(partners, use.names=F)
###################
###################
shinyServer(function(input, output, session){
##################
wordcloudThis<-reactive({
#Let user limit where we apply the analysis
##boil down corpus by using tdm freq min specified by input$freqCutoff
#MyCorpus<-Corpus(subset(files,grepl(input$refineSearch, files)), readerControl=list(language="english"))

LoadMe<-strsplit(readLines("NewsList"), "\\t+", perl=T)[[input$sourcechosen]]
#

go<-paste("TXT/",LoadMe,sep="")

#MyCorpus<-Corpus(VectorSource(go))##,readerControl=list(language="english"))

MyCorpus<-Corpus(DirSource(go),readerControl=list(language="english"))

#MyCorpus<-subset(MyCorpus, !grepl("WARC|Content-Type|Content-Length",MyCorpus))

MyCorpus[input$filechosen]#[input$lineRange[1]:input$lineRange[2]]

substring(MyCorpus[input$filechosen],input$lineRange[1], input$lineRange[2])    #[input$lineRange[1]:input$lineRange[2]]
#################
})
###################
#################
output$wordPlot <-renderPlot({
#seed should be static to get same graph each time
set.seed(108)
p<-wordcloud(wordcloudThis(), min.freq=input$freqCutoff, scale=c(input$maxText, input$minText), colors=brewer.pal(6, "Dark2"))
#get title onto the wordcloud main=files[[input$filechosen]]
})
#################
searchResult<-reactive({
#data.frame(subset(partners, grepl(input$nameSearch, partners$name)))
#subset(partners, grepl(input$nameSearch, partners$name))[,1]
})
###################
#output$selectUI<-renderUI({
#selectInput("partnerName", "Select news source", list(searchResult()))
#})
###################
observe({
updateTextInput(session, "partnerName", label="Choose News Source", value=searchResult())
})
#################
output$documentText<-renderText({
removePunctuation(wordcloudThis(),preserve_intra_word_dashes = TRUE)
})
#################
output$matrixView<-renderPlot({
z <- cor(mtcars)
levelplot(z)
})
#################
})
