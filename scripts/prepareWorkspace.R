prepare.workspace <- function(){
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
    
    ### Read the data
    onegram <- read.csv("1gram.csv",row.names =1)
    twogram <- read.csv("2grams.csv",row.names=1)
    threegram <- read.csv("3grams.csv",row.names=1)
    fourgram <- read.csv("4grams.csv",row.names=1)
    fivegram <- read.csv("5grams.csv",row.names=1)
}

