split.strings2 <- function(df){
    x <- data.frame(str_split_fixed(df$words," ",2),df$count)
    colnames(x) <- c("W1","W2","Count")
    x
}
split.strings3 <- function(df){
    x <- data.frame(str_split_fixed(df$words," ",3),df$count)
    colnames(x) <- c("W1","W2","W3","Count")
    x
}
split.strings4 <- function(df){
    x <- data.frame(str_split_fixed(df$words," ",4),df$count)
    colnames(x) <- c("W1","W2","W3","W4","Count")
    x
}
split.strings5 <- function(df){
    x <- data.frame(str_split_fixed(df$words," ",5),df$count)
    colnames(x) <- c("W1","W2","W3","W4","W5","Count")
    x
}