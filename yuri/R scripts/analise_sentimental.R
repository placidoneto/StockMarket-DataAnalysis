
avaliar_comentarios <- function(dataset, dicionario){
  
  for(i in 1:nrow(dataset)){
    token  <- tokenize_message(dataset[i,])
    classificacao <- sentimental_analisys(dataset_token =  token, 
                                          dataset_lexico  =  dicionario)
    dataset$avaliacao[i] <- classificacao
    
  }
  return(dataset)
  
}

tokenize_message <- function(dataset){
      
      require(stringr)
      
      only_text <- dataset$comments.message
      
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
  
  total_match <- semi_join(dataset_lexico, dataset_token, "word")
  
  positivo <- nrow(filter(total_match, sentimento == "positive"))
  negativo <- nrow(filter(total_match, sentimento == "negative"))
  neutro <- nrow(filter(total_match, sentimento == "neutral"))
            +
            nrow(filter(total_match, sentimento == "both"))
  
  
  
  if(positivo == negativo){
        maior_incidencia <- 2
  }else{
        maior_incidencia <- which.max(c(positivo, negativo, neutro))        
  }
  avaliacao <- classificacao_string(maior_incidencia)
  
  return(avaliacao)
}

classificacao_string <- function(classificacao_int){
  
  if(classificacao_int == 1) return("positive")
  if(classificacao_int == 2) return("negative")
  if(classificacao_int == 3) return("neutral")
  
}


plot_sentiments <- function(dataset){
      require(ggplot2)
      return(
            ggplot(data = dataset, aes(x = avaliacao))+
                  geom_bar(stat = "count")
            
      )
}



