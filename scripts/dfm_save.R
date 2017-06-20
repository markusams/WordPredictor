tdm.save <- function(input,output,n){
	dfm <- dfm.generate(input, n)
	dfm <- dfm_trim(dfm, min_docfreq = 3)
	y <- data.frame(cbind(words=names(topfeatures(dfm, 1000000)),count=topfeatures(dfm, 1000000)), row.names = c())
	#write.csv(y, output)
    y
}