# source("/conf.R")
# tabela_sentimento_pura <- read.csv("subjclueslen1-HLTEMNLP05.tff")

get_compare_lexical_table <- function(){
      
      require(stringr)
  
      tabela_sentimento_estr <- read.table("Dicionario/subjclueslen1-HLTEMNLP05.tff",header = F)
      
      col_sentimento <- sub("priorpolarity=", x = tabela_sentimento_estr$V6, replacement = "")
      
      # write.csv(col_palavras, "texto")
      
      col_palavras_traduzida <- read.csv("Dicionario/traduzido.txt", stringsAsFactors = F)
      col_palavras_traduzida$sentimento <- col_sentimento
      col_palavras_traduzida$X.1 <- NULL
      names(col_palavras_traduzida) <- c("word","sentimento")
      col_palavras_traduzida$word <- str_trim(col_palavras_traduzida$word)
      col_palavras_traduzida$word[col_palavras_traduzida$word == ""] <- "NA"
      # write.csv(col_palavras_traduzida, "txt_traduzido_e_avaliado")
      return(col_palavras_traduzida)
}
 


