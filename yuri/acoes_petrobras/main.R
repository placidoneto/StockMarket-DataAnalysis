path <- "C:\\Users\\Yuri\\Documents\\Git\\StockMarket-DataAnalysis\\yuri"
setwd(paste(path, "/acoes_petrobras", sep = ""))


source(file = "conf.R")


source(file = paste(path, '/acoes_petrobras/timeSeries_getPetr4_dataset.R', sep = ''))
source(file = paste(path, '/acoes_petrobras/ler_todos_json_tt_coleta.R', sep = ''))
source(file = paste(path, '/acoes_petrobras/Análise de texto/traducao_pct_sentimentos.R', sep = ''))
source(file = paste(path, '/acoes_petrobras/analise_sentimental.R', sep = ''))
source(file = paste(path, '/acoes_petrobras/acoes_yahoo_dezembro.R', sep = ''))


petr4 <- getPetr4_dataset()
stoock <- get_yahoo_stock()
dataset_token <- tokenize_text_data(data)
lexical <- get_compare_lexical_table()
sent <- sentimental_analisys(dataset_token, lexical)
plot_sentiments(sent)

timeSeries_getPetr4_dataset(data)