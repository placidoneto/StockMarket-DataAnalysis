### COLETA DE DADOS - YAHOO FINANCE ###
## Pacotes Necessários
library(tseries)
library(PerformanceAnalytics)
library(zoo)
library(timeSeries)

## Coleta de dados no yahoo
# Não precisa de nenhum input, apenas definir os parâmetros abaixo:
# definição de parâmetros
datai = "2014-01-01" # Data Inicial
dataf = "2014-05-31" # Data Final
campo = "AdjClose" # campo de coleta
# definição de ativos, pode acrescentar até 'an' ativos
a1 = "PETR3.SA"
a2 = "VALE5.SA"
a3 = "ALLL3.SA"
a4 = "CTIP3.SA"
a5 = "PCAR4.SA"
ativos = c(a1,a2,a3,a4,a5)

## Coletando os dados pela url do yahoo.
# Acrescentar as linhas Xn de acordo com a quantidade de ativos.
con <- url("http://quote.yahoo.com")
if(!inherits(try(open(con), silent = TRUE), "try-error")) {
  close(con)
  X1 <- get.hist.quote(instrument = a1, start = datai, end = dataf, quote = campo)
  X2 <- get.hist.quote(instrument = a2, start = datai, end = dataf, quote = campo)
  X3 <- get.hist.quote(instrument = a3, start = datai, end = dataf, quote = campo)
  X4 <- get.hist.quote(instrument = a4, start = datai, end = dataf, quote = campo)
  X5 <- get.hist.quote(instrument = a5, start = datai, end = dataf, quote = campo)
  
  require("zoo")
  x <- merge(X1, X2, X3, X4, X5)
  # plot(x, main = "Evolução dos Preços dos Ativos")
}

## Tratamento dos dados
# Retirando irregularidades de NA pela interpolação linear
xreg = interpNA(x,method="linear")
# Excluíndo NAs restantes
xreg = removeNA(xreg)
# Calculando Retornos
xret = Return.calculate(xreg, method="discrete") # "log" para log retornos
# Retirando primeira observação NA
xret = removeNA(xret)
