###############
library(shiny)
library(markdown)
###############
shinyUI(navbarPage("Shiny WET file Reader: News Corpus",
#
tabPanel("WordCloud",
sidebarLayout(
sidebarPanel(
######
numericInput("freqCutoff", "Word frequency cutoff:", 4, min=1, max=1000),
######
numericInput("minText", "Min text size", .1, min=.1, max=1),
numericInput("maxText", "Max text size", 5, min=1, max=10),
sliderInput("lineRange", "Line range:", min=1, max=1000, value=c(1,250)),
######
textInput("refineSearch", "segment by search name", "rt.com"),
numericInput("filechosen", "Choose a file for wordcloud analysis by index:", 5, min=1, max=2000),#,
numericInput("sourcechosen", "Choose a source:", 1, min=1, max=200)
#textInput("nameSearch", "Search source by site name", "rt.com"),
#htmlOutput("selectUI")
#uiOutput("selectUI")
#selectInput("partnerName", "Select your choice", list("searchResults"))
),
##############
mainPanel(plotOutput("wordPlot")))),
######
tabPanel("MatrixView", plotOutput("matrixView"),
######
textInput("newsquery", "query", "obama"),
numericInput("dimx", "dimx:", 4, min=4, max=12),
numericInput("dimy", "dimy:", 4, min=12, max=77))
######

######
#tabPanel("MyCorpus", tableOutput("corpusTable"))##,
#tabPanel("DocName", verbatimTextOutput("documentName")),
#tabPanel("PDF view", htmlOutput("pdfView"),
#         textInput("pdfurl", "PDF name")
#)##,
#tabPanel("RawText", verbatimTextOutput("documentText") ##),
##tabPanel("WordFreq", plotOutput("getWordFreq")),
##tabPanel("WordFreqTable", tableOutput("getWordFreqTable") ##),
#############
#navbarMenu("SNA",
#tabPanel("SNA by words", plotOutput("snaPlot"),  #if no search terms to filter then applied to whole corpus
#textInput("searchthisaa", "Term any:", "cyclohexamide"),
#textInput("searchthisbb", "Term any:", ""),
#textInput("searchthisa", "Term 1:", "plant"),
#textInput("searchthisb", "Term 2:", "growth"),
#textInput("searchthisc", "Term 3:", "inhibit"),
#textInput("searchthisd", "Term 4:", "arabidopsis")
#)),
#############
#tabPanel("Word-word correlations", plotOutput("correlationPlot"),
#        numericInput("corLimit", "Correlation limit:", 0.7, min=0.1, max=0.99)
#),
#############
#tabPanel("CompoundDetect"), #use dict to plot compounds
#tabPanel("Report Download")
#tabPanel("Autocorrect ENG dictionary")
#############
))

