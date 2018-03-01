
# install.packages('RPostgreSQL', dependencies = T)
# install.packages('xlsx', dependencies = T)
# install.packages('streamR', dependencies = T)
# require(RPostgreSQL)
# require (streamR)
# require(xlsx)
# 
# tts <- read.xlsx2('comentarios.xlsx', 1, as.data.frame = T)
# tts$X. <- NULL
# tts[,8:9] <- NULL
# 
# #printa tipo das colunas
# for(i in 1 : ncol(tts)){
#   print(class(tts[,i]))
# }
# 
#cast tipo colunas p/ char
for (i in 1 : ncol(comentarios_avaliados)){
  comentarios_avaliados[,i] <- as.character(comentarios_avaliados[,i])
}

#muda encoding pra ficar de acordo com o UTF-8 do postgresql
for(i in 1 : ncol(comentarios_post)){
      if(is.character(class(comentarios_post[,i]))){
            Encoding(comentarios_post[,i]) <- 'UTF8'
      }
  print(Encoding(comentarios_post[,i])) #<- 'UTF8'
}

for(i in 1 : ncol(comentarios_avaliados)){
     Encoding(comentarios_avaliados[,i]) <- 'UTF8'
}

for(i in 1 : ncol(comentarios_post)){
      Encoding(as.character(comentarios_post[,i])) <- 'UTF8'
}
# 
# 


# tts$likes_count <- as.numeric(tts$likes_count)
# 
# tts <- parseTweets(tweets = 'deCasa00.json')
# colunas <- c('name', 'friends_count', 'location', 
#              'user_url', 'text', 'created_at')
# tts <- tts[colunas]




driver <- dbDriver(drvName = 'PostgreSQL')

con <- dbConnect(driver, dbname = "datamy",
                 host = "localhost", port = 5432,
                 user = "postgres", password = '123')

dbExistsTable(con, 'T7')

# writes df to the PostgreSQL database "postgres", table "cartable" 
dbWriteTable(con, "comentario_fb_avaliados", value = comentarios_avaliados, append = T)


# query the data from postgreSQL 
df_postgres <- dbGetQuery(con, "drop table comentario_ttw;")
dbGetQuery(con, "set client_encoding to 'UTF-8'")
identical(df, df_postgres)
dbListTables(con) 
dbGetInfo(con)

dbDisconnect(con)
dbUnloadDriver(driver)