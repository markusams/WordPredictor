tdm.generate <- function(var, n){
    ## tutorial on rweka - http://tm.r-forge.r-project.org/faq.html
    ## Create corpus from a vector, transform it
    my_corpus <- VCorpus(VectorSource(var)) 
    my_corpus <- tm_map(my_corpus, content_transformer(tolower))
    my_corpus <- tm_map(my_corpus, removeNumbers) 
    my_corpus <- tm_map(my_corpus, removePunctuation)
    my_corpus <- tm_map(my_corpus, stripWhitespace)
    ## my_corpus <- tm_map(my_corpus, removeWords, profanities)
    ## Create Token for ngram
    Tokenizer <- function(x) {RWeka::NGramTokenizer(x, RWeka::Weka_control(min = n, max = n))} # create n-grams
    tdm <- TermDocumentMatrix(my_corpus, control = list(tokenize = Tokenizer)) # create tdm from n-grams
    tdm
}