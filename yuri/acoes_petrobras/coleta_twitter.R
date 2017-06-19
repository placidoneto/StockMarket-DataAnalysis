# install.packages("ROAuth", dependencies = T,repos='http://cran.rstudio.com/')
# install.packages("RCurl", dependencies = T,repos='http://cran.rstudio.com/')
# install.packages("twitteR", dependencies=T,repos='http://cran.rstudio.com/')
# install.packages("streamR", dependencies=TRUE, repos='http://cran.rstudio.com/')

setwd("C:/Users/Yuri/Documents/R/acoes_petrobras")

library(ROAuth)
library(streamR)
#library(RCurl)

# library(twitteR)

# executar apenas no windows
# download.file(url="http://curl.haxx.se/ca/cacert.pem",
#               destfile = "/home/bigdata/Rcacert.pem")

# cons_key <- "76QstXLiuodZpvdROgF4B9Bhw"
# cons_sec <- "IrXXeuttQD0wPkxwaMLhvtGB1dJMOyIZScvEIZ1NsWkFhmLYCl"
# req_URL <- "https://api.twitter.com/oauth/request_token"
# accs_URL <- "https://api.twitter.com/oauth/access_token"
# authURL <- "https://api.twitter.com/oauth/authorize"

# acc_tokem <- "765212567841148928-tacHWhIc8UzRjbeAgwm9ZXcJo4VF9hr"
# acc_token_sec <- "H1Xpt2pGpt53343jWZaUhPiGJTuysHYv7G8EgaISS46VN"
# 
# cred <- OAuthFactory$new(consumerKey=cons_key,
#                          consumerSecret=cons_sec,
#                          requestURL='https://api.twitter.com/oauth/request_token',
#                          accessURL='https://api.twitter.com/oauth/access_token',
#                          authURL='https://api.twitter.com/oauth/authorize')
# 
# cred$handshake()
# 
# save(cred, file = "TTOauth.Rdata")
# system("copy NUL acoes_petrobras_dados.json"
load("TTOauth.Rdata")
                                          


filterStream(file.name = "dadosPETR4/acoes_petrobras_dados61.json", 
             track ="PETR4,petr4,#petr4,#PETR4,
             petrobras, #petrobras,
             ações da petrobras",
             timeout = 4200,oauth = cred)




