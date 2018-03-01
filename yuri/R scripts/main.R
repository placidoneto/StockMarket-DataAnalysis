path <- "C:\\Users\\Yuri\\Desktop\\datamy"
setwd(path)


source(file = 'Dicionario/traducao_pct_sentimentos.R')
source(file = 'analise_sentimental.R')
source(file = 'pds_posts_comments.R')


comentarios_post <- get_fb_dataset()
dicionario <- get_compare_lexical_table()
comentarios_avaliados <- avaliar_comentarios(comentarios_post, dicionario)
novo <- avaliar_comentarios(universal, dicionario)
universal <- get_fb_dataset()


length(which(comentarios_avaliados$avaliacao == "positive"))
length(which(novo$avaliacao == "positive"))


length(which(comentarios_avaliados$avaliacao == "negative"))
length(which(novo$avaliacao == "negative"))

length(which(comentarios_avaliados$avaliacao == "neutral"))
length(which(novo$avaliacao == "neutral"))

plot_sentiments(novo)

