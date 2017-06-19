
tokenize_text_data <- function(dataset){
      
      require(stringr)
      
      only_text <- dataset$text
      
      text_without_punctuation <- gsub(pattern = "[[:punct:]]","",only_text)
      text_without_controlChar <- gsub(pattern = "[[:cntrl:]]","",text_without_punctuation)
      text_low <- stringr::str_to_lower(text_without_controlChar)
      text_without_digit <- gsub(pattern = "[[:digit:]]","",text_low)
      tokenize <- str_split(text_without_digit,"[[:space:]]")
      only_words <- unlist(tokenize)
      only_words_df <- as.data.frame(only_words, stringsAsFactors = F)
      names(only_words_df) <- "word"
      return(only_words_df)
}


sentimental_analisys <- function(dataset_token, dataset_lexico){
      
      require(dplyr)
      
      # positivo <- filter(dataset_lexico, sentimento == "positive")
      # negativo <- filter(dataset_lexico, sentimento == "negative")
      # neutro <- filter(dataset_lexico, sentimento == "neutral")
      # both <- filter(dataset_lexico, sentimento == "both")
      # neutro <- merge(neutro, both, all = T)
      
      
      #names(col_palavras_traduzida)[names(col_palavras_traduzida)=="n"] <- "palavras"
      
      total_match <- semi_join(lexical, dataset_token, "word")
      
      # qtd_pos <- semi_join(positivo, words_df, "palavras")
      # qtd_neu <- semi_join(neutro, words_df, "palavras")
      # qtd_neg <- semi_join(negativo, words_df, "palavras")
      
      return(total_match)
}

plot_sentiments <- function(dataset){
      
      return(
            ggplot(data = dataset, aes(x = sentimento))+
                  geom_bar(stat = "count")
            
      )
}



