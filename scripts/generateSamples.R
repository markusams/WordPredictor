generateSample <- function (inputFile, outputFile, p){
    ##Create empty vector, open connection, determine number of lines in source
    a <- c()
    con <- file(inputFile, "r")
    NumberOfLines <- length(readLines(con))
    sample <- rbinom(n=NumberOfLines, size=1, prob=p)
    currentLine <- 1
    con <- file(inputFile, "r")
    ##Read the file line by line, check whether it should be included, append it to a
    while (currentLine < NumberOfLines){
        b <- readLines(con,1)
        if (sample[currentLine] == 1){
            a <- c(a,b)
            }
        currentLine <- currentLine + 1
    }
    ##Close Connection
    close(con)
    ##Write new file
    write(a, file=outputFile)
}
 
