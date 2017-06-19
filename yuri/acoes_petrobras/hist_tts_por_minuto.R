# require(streamR)
# library(tidyverse)
# require(lubridate)

# Sys.setlocale("LC_TIME", locale = "English")

tweets <- parseTweets("dadosPETR4/deCasa00.json")

tweets$datas <- as.POSIXct(tweets$created_at, tz = "UTC", 
                           format = "%a %b %d %H:%M:%S %z %Y")

tweets$minutos <- floor_date(tweets$datas, unit="minute")

tb <- table(tweets$minutos)

df <- as.data.frame(tb)

ggplot(df) + geom_bar(aes(df$Var1, df$Freq), stat="identity", fill="black") +
      xlab("Minuto") + 
      ylab("Quantidade tweets") + 
      theme_bw() + 
      ggtitle("Quantidade de tweets/minuto")

hchart(df$Freq, type = 'column')

