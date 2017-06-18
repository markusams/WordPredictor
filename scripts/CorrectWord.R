correct.word <- function(input){
    #This function is not used in the app. It takes an input string, checks whether the last word is
    #in the hunspell dictionary, and returns a corrected word if it is not. If it is, the word is returned
    input <- tolower(gsub("[[:punct:]]","",input))
    words <- strsplit(input," ")[[1]]
    words <- words [! words %in% ""]
    if (hunspell_check(words[1]))
    {
        words[1]
    }
    else
    {
        unlist(hunspell_suggest(words[1]))[1]
    }
}