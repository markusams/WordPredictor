library(shiny)

### Initialize table
r <- data.frame(Word=as.character(),Score=as.integer(),stringsAsFactors=FALSE)
r <- c("Start Typing", "")

### Packages
require(stringi)
require(stringr)
require(tm)
require(NLP)
require(RWeka)
require(quanteda)
require(ggplot2)
require(gridExtra)
require(dplyr)
require(hunspell)

### Source Functions
source("scripts/StupidBackoff.R")
source("scripts/cleanInput.R")
source("scripts/makeSentence.R")

### Read the data
onegram <<- read.csv("data/1gram.csv",row.names =1)
twogram <<- read.csv("data/2grams.csv",row.names=1)
threegram <<- read.csv("data/3grams.csv",row.names=1)
fourgram <<- read.csv("data/4grams.csv",row.names=1)
fivegram <<- read.csv("data/5grams.csv",row.names=1)

### Reactive App (Backend)
shinyServer(function(input, output) {
    output$tbl <- renderTable({
        if (str_sub(input$inputText, -1, -1) != " "){r}
        else 
            {
            r <<- stupid.backoff(input$inputText)
            r
            }
        })
    output$sntnce <- eventReactive(input$Submit, {
        make.sentence(input$inputText2,input$n,input$s)
    })
    })
    
