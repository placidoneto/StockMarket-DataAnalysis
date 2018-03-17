path <- getwd()
setwd(path)

source(file = 'conf.R')
source(file = 'Dicionario/traducao_pct_sentimentos.R')
source(file = 'analise_sentimental.R')
source(file = 'buscadorComentarios.R')

baixarDependencias()
importarDependencias()
definirLocale()

# Link para obter token do Facebook: https://developers.facebook.com/tools/explorer/
# Exemplo de caminho do JRE: C:/Program Files/Java/jre1.8.0_161

token <- "EAACEdEose0cBAET0ifZAg8mPFg7rfgs4BxH77KPKkesia5fJnsGMag7KV7pS2vm5xpjGZAuxQxNApsJnEimMofmi70LLwIB19le3pLbZBfC90JqKiFDLB93l3W5mFWwQ1rUOM1yBZBSHWvKlZAgL7GZCL0uALDiZCNNz1UEzkTDHxA3alVuGVlHdbttLZAk8mGvZC1E19RfZCZA8wZDZD"
caminhoJRE = "C:/Program Files/Java/jre1.8.0_161"
arrayDePaginas <- c("SKYBrasil", "CarrefourBR")

comentarios_post <- get_fb_dataset(token, arrayDePaginas)
                                   
dicionario <- get_compare_lexical_table()

comentarios_avaliados <- avaliar_comentarios(comentarios_post, dicionario)

exportarParaXlsx(comentarios_avaliados, caminhoJRE)


length(which(comentarios_avaliados$avaliacao == "positive"))

length(which(comentarios_avaliados$avaliacao == "negative"))

length(which(comentarios_avaliados$avaliacao == "neutral"))

plot_sentiments(comentarios_avaliados)

