require(lubridate)
data$datas <- as.POSIXct(data$created_at, tz = "UTC", 
                           format = "%a %b %d %H:%M:%S %z %Y")

data$dias <- floor_date(data$datas, unit="day")

       arquivos_json_tb <- table(data$datas)
      # 
      arquivos_json_df <- as.data.frame(arquivos_json_tb)
      
      aes(x = aes(x = arquivos_json_df$Var1))
      
ggplot(data = data$dias ) + 
      geom_bar(stat="count", fill="black") +
      xlab("Dia") + 
      ylab("Quantidade tweets") + 
      theme_bw() + ggtitle("Quantidade de tweets/dia")


hchart(floor_date(tweets$created_at), type = 'column')


index_maior_volume <- which.max(arquivos_json_df$Freq)
data_maior_volume <- arquivos_json_df$Var1[index_maior_volume]
data_maior_volume <- as.POSIXct(data_maior_volume, tz = "UTC", format = "%Y-%m-%d")


# teste <- arquivos_json %>% filter(dias == data_maior_volume)
