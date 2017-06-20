language.select <- function(lang_toggle){
    if(lang_toggle == "English"){
        onegram <<- onegram_en
        twogram <<- twogram_en
        threegram <<- threegram_en
        fourgram <<- fourgram_en
        fivegram <<- fivegram_en
    } else if (lang_toggle == "Deutsch") {
        onegram <<- onegram_de
        twogram <<- twogram_de
        threegram <<- threegram_de
        fourgram <<- fourgram_de
        fivegram <<- fivegram_de
    }
}