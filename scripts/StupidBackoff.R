stupid.backoff <- function(input){
    ### Sanity Check
    ##stopifnot (str_count(input, "\\S+") > 1)
    
    ### Prep
    words <- clean.input(input)
    n = length(words)
    r <- data.frame(Word=as.character(),Score=as.integer(),stringsAsFactors=FALSE)
    
    ### build a table of ngrams that start with words
    ### Take the top five entries, compute the score.
    ### Score is computed as the number of occurences (Count) through
    ### the total number of occurences of the input ngram
    if (length(words) == 4){
        result <- fivegram %>% filter(W1 == words[1]) %>% filter(W2 == words[2]) %>% filter(W3 == words[3]) %>% filter(W4 == words[4])
        sumcount <- sum(result$Count)
        result <- result %>% top_n(5, Count) %>% mutate(Score = Count / sumcount) %>% select(W5, Score)
        colnames(result) <- c("Word", "Score")
        if (dim(result)[1] < 5){
            words <- words[-1]
        }
        r <- rbind(r, result)
        r <- r %>% distinct(Word, .keep_all = TRUE)
    }
    if (length(words) == 3){
        result <- fourgram %>% filter(W1 == words[1]) %>% filter(W2 == words[2]) %>% filter(W3 == words[3])
        sumcount <- sum(result$Count)
        result <- result %>% top_n(5, Count) %>% mutate(Score = Count / sumcount * 0.4^(n-3)) %>% select(W4, Score)
        colnames(result) <- c("Word", "Score")
        if (dim(result)[1] < 5){
            words <- words[-1]
        }
        r <- rbind(r, result)
        r <- r %>% distinct(Word, .keep_all = TRUE)
    }
    if (length(words) == 2){
        result <- threegram %>% filter(W1 == words[1]) %>% filter(W2 == words[2])
        sumcount <- sum(result$Count)
        result <- result %>% top_n(5, Count) %>% mutate(Score = Count / sumcount * 0.4^(n-2)) %>% select(W3, Score)
        colnames(result) <- c("Word", "Score")
        if (dim(result)[1] < 5){
            words <- words[-1]
        }
        r <- rbind(r, result)
        r <- r %>% distinct(Word, .keep_all = TRUE)
    }    
    if (length(words) == 1){
        result <- twogram %>% filter(W1 == words[1]) 
        sumcount <- sum(result$Count)
        result <- result %>% top_n(5, Count) %>% mutate(Score = Count / sumcount * 0.4^(n-1)) %>% select(W2, Score)
        colnames(result) <- c("Word", "Score")
        if (dim(result)[1] < 5){
            words <- words[-1]
        }
        r <- rbind(r, result)
        r <- r %>% distinct(Word, .keep_all = TRUE)
    }
    if (length(words) == 0){
        result <- onegram
        sumcount <- sum(result$Count)
        result <- result %>% top_n(5, Count) %>% mutate(Score = Count / sumcount * 0.4^(n)) %>% select(W1, Score)
        colnames(result) <- c("Word", "Score")
        r <- rbind(r, result)
        r <- r %>% distinct(Word, .keep_all = TRUE)
    }
    
    r <- r %>% top_n(5, Score)
    r
}