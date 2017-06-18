create.overview <- function(){
    blogs <- scan("en_US.blogs.txt", what="character", sep="\n")
    news <- scan("en_US.news.txt", what="character", sep="\n")
    twitter <- scan("en_US.twitter.txt", what="character", sep="\n")
    words_blogs <- stri_count_words(blogs)
    words_news <- stri_count_words(news)
    words_twitter <- stri_count_words(twitter)
    lines_blogs <- length(blogs)
    lines_news <- length(news)
    lines_twitter <- length(twitter)
    overview <- data.frame(source = c("blogs","news","twitter"), lines = c(lines_blogs,lines_news,lines_twitter) , words = c(sum(words_blogs),sum(words_news),sum(words_twitter)))
    write.table(overview,"overview.txt")
}
