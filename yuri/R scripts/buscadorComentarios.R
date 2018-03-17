 get_fb_dataset <- function(token, arrayDePaginas){
  require(Rfacebook)
  
  token <- token
  pages <- arrayDePaginas
  
  posts <- getPage(arrayDePaginas[2], token = token, n = 10, reactions = T, api = "v2.8")
  comments <- getPost(posts$id[1], token = token, n.comments = 10, api = "v2.8")
  comments <- as.data.frame(comments, stringsAsFactors = F)
  
  return(comments)
  
 }
 
 exportarParaXlsx <- function(comentarios, posts)
 {
   require(xlsx)
   
   write.xlsx(comentarios, paste(getwd(), "excel/comentarios.xlsx", sep = ""))
   write.xlsx(posts, paste(getwd(), "excel/posts.xlsx", sep = ""))
   
 }
 
 # # install.packages("Rfacebook", dependencies = T)
# # install.packages("xlsx", dependencies = T)
# require(Rfacebook)
# 
# 
# token <- ""
# pages <- c("OiOficial",
#            "vivo",
#            "timbrasil",
#            "paodeacucar",
#            "magazineluiza",
#            "CasasBahia",
#            "atacadaodoseletros",
#            "uberbr",
#            "natura.br",
#            "CarrefourBR")
# #pegar páginas
# posts <- getPage(pages[1], token = token, n = 10, reactions = T)
# for(i in 2:length(pages)){
#   posts <- merge(posts, getPage(pages[i], token = token, n = 10, reactions = T), all = T)
# }
# 
# #cria coluna com nome da empresa do post
# comments <- getPost(posts$id[1], token = token, n = 5)
# comments <- comments$comments
# comments$empresa <- "NULL"
# for(i in 2:nrow(posts)){
#   print(i)
#   t <- getPost(posts$id[i], token = token, n = 5)
#   p <- t$post$from_name[1]
#   t <- t$comments
#   if(nrow(t) != 0)
#     t$empresa <- p
#   comments <- merge(comments, t, all = T)
# }
# 
# #avaliar manualmente
# comments$avaliacao <- "NULL"
# for(i in 1:nrow(comments)){
#   print(comments$message[i])
#   print("---------------------------------------------------------------------------")
#   print(paste("EMPRESA: ", comments$empresa[i]))
#   opcao <- scan(nmax = 1)
#   if(opcao == 1)
#     comments$avaliacao[i] <- "reclamacao"
#   else if(opcao==2)
#     comments$avaliacao[i] <- "duvida"
#   else if(opcao==3)
#     comments$avaliacao[i] <- "solucao"
#   else
#     comments$avaliacao[i] <- "neutro"
# }
# 
# #exportar como xlsx
# write.xlsx(comments, "C:/Users/teste/Documents/R/comentarios.xlsx")
# write.xlsx(posts, "C:/Users/teste/Documents/R/posts.xlsx")


