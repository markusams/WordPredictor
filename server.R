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
source("scripts/LanguageSelect.R")

### Read the data
onegram_en <<- read.csv("data/1gram.csv",row.names =1)
twogram_en <<- read.csv("data/2grams.csv",row.names=1)
threegram_en <<- read.csv("data/3grams.csv",row.names=1)
fourgram_en <<- read.csv("data/4grams.csv",row.names=1)
fivegram_en <<- read.csv("data/5grams.csv",row.names=1)
onegram_de <<- read.csv("data/de_1gram.csv",row.names=1)
twogram_de <<- read.csv("data/de_2gram.csv",row.names=1)
threegram_de <<- read.csv("data/de_3gram.csv",row.names=1)
fourgram_de <<- read.csv("data/de_4gram.csv",row.names=1)
fivegram_de <<- read.csv("data/de_5gram.csv",row.names=1)

### Reactive App (Backend)
shinyServer(function(input, output) {
    output$tbl <- renderTable({
        if (str_sub(input$inputText, -1, -1) != " "){r}
        else 
            {
            language.select(input$lang_toggle)
            r <<- stupid.backoff(input$inputText)
            r
            }
        })
    output$sntnce <- eventReactive(input$Submit, {
        language.select(input$lang_toggle2)
        make.sentence(input$inputText2,input$n,input$s)
    })
    })
    
