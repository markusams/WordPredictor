make.sentence <- function(input,n,s){
    i = 0
    selector = 1
    while (i < n){
        if (s == "Yes"){selector <- sample(1:5,1)}
        new_word <- stupid.backoff(input)[selector,1]
        input <- paste(input, new_word, sep = " ")
        i <- i + 1
    }
    input
}