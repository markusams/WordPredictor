wordFrequencies <- function(inputFile,outputFile){
    ##Reads inputFile, splits it into words, counts, sorts
    ##and writes it to outputFile. The first row shows the
    ##total number of words in inputFile. After that, every 
    ##row shows the rank, the word and it's (absolute) 
    ##frequency. File is ordered decreasing
    input_a <- scan(inputFile, what="character", sep="\n")
    input_clean <- unlist(strsplit(tolower(input_a), "\\W"))
    freq<-sort(table(input_clean),decreasing=TRUE)
    write.table(freq,outputFile)
    }