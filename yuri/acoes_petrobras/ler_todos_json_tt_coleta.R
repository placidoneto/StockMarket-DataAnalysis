
getPetr4_dataset <- function(){

      require(streamR)
      
      lista_jsons <- dir(paste(path, '/acoes_petrobras/dadosPETR4', sep = ''))
      
      arquivos_json <- parseTweets(paste(path, "/acoes_petrobras/dadosPETR4/", 
                                    lista_jsons[1], sep = ""))
      
      #Cria um data frame, com todos os arquivos json, do diretório escolhido em "lista_jsons"
      for(i in 2:length(lista_jsons)){
            path_name <- paste(path, "/acoes_petrobras/dadosPETR4/",
                               lista_jsons[i], sep = "")
            tts <- parseTweets(path_name)
            arquivos_json <- merge(arquivos_json, tts, all = T)
      }
      return(arquivos_json)
}