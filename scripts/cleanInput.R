clean.input <- function(input){
    ### Process the input: Remove punctuation, transform to
    ### lower, count the words, split into a vector of words,
    ### remove empty elements (due to whitespaces), remove 
    ### elements if the sentence is more than 4 words
    input <- tolower(gsub("[[:punct:]]","",input))
    words <- strsplit(input," ")[[1]]
    words <- words [! words %in% ""]
    if (length(words) > 4){
        words <- words[-(1:(length(words)-4))]
    }
    words
}