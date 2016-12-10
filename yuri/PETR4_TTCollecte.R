install.packages("ROAuth", dependencies = T,repos='http://cran.rstudio.com/')
install.packages("streamR", dependencies=TRUE, repos='http://cran.rstudio.com/')

library(ROAuth)
library(streamR)

cons_key <- "Your consumer Key goes here!"
cons_sec <- "Your consumer Secret goes here!"
req_URL <- "https://api.twitter.com/oauth/request_token"
accs_URL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"

credencial <- OAuthFactory$new(consumerKey=cons_key,
                               consumerSecret=cons_sec,
                               requestURL='https://api.twitter.com/oauth/request_token',
                               accessURL='https://api.twitter.com/oauth/access_token',
                               authURL='https://api.twitter.com/oauth/authorize')

credencial$handshake()

save(credencial, file = "TTOauth.Rdata")
system("touch acoes_petrobras_dados.json")

filterStream(file.name = "acoes_petrobras_dados.json", 
             track ="PETR4,petr4,#petr4,#PETR4,
                     petrobras, #petrobras,
                     ações da petrobras",
             timeout = 3600,oauth = credencial)






