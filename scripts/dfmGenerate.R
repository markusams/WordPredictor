dfm.generate <- function(vec, n){
    ### Clean the input file
    vec <- gsub("[^[:alpha:][:space:]']", " ", vec)
    vec <- gsub("â ", "'", vec)
    vec <- gsub("ã", "'", vec)
    vec <- gsub("ğ", "'", vec)
    
    ### Create Corpus
    my_corpus <- VCorpus(VectorSource(vec)) 
    
    ### Clean Corpus
    my_corpus <- tm_map(my_corpus, content_transformer(tolower))
    my_corpus <- tm_map(my_corpus, removeNumbers)
    my_corpus <- tm_map(my_corpus, removePunctuation)
    my_corpus <- tm_map(my_corpus, stripWhitespace)
    
    ## Transform VCorpus into a quanteda Corpus
    my_corpus <- quanteda::corpus(my_corpus)
    
    ### Create dfm
    dfm <- dfm(my_corpus, ngram = n, verbose=FALSE, concatenator = " ")
    
    ### Return dfm
    dfm
}

