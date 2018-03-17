path <- getwd()
setwd(path)

source(file = 'conf.R')
source(file = 'Dicionario/traducao_pct_sentimentos.R')
source(file = 'analise_sentimental.R')
source(file = 'buscadorComentarios.R')

baixarDependencias()
importarDependencias()
definirLocale()

token <- ""
arrayDePaginas <- c("SKYBrasil", "CarrefourBR")

comentarios_post <- get_fb_dataset(token, arrayDePaginas)
                                   
dicionario <- get_compare_lexical_table()

comentarios_avaliados <- avaliar_comentarios(comentarios_post, dicionario)


length(which(comentarios_avaliados$avaliacao == "positive"))

length(which(comentarios_avaliados$avaliacao == "negative"))

length(which(comentarios_avaliados$avaliacao == "neutral"))

plot_sentiments(comentarios_avaliados)

