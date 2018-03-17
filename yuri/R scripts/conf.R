
baixarDependencias <- function(){
  
  dependencias <- c("streamR", 
                    "tidytext", 
                    "dplyr", 
                    "Rfacebook", 
                    "stringr", 
                    "ggplot2", 
                    "tidyverse", 
                    "lubridate",
                    "RPostgreSQL",
                    "xlsx")
  
  novas_dependencias <- dependencias[!(dependencias %in% installed.packages()[,"Package"])]
  
  if(length(novas_dependencias)) install.packages(novas_dependencias)
}

importarDependencias <- function(){
  require(streamR)
  require(tidytext)
  library(dplyr)
  library(stringr)
  require(ggplot2)
  require(tidyverse)
  require(lubridate)
}

definirLocale <- function(){
  Sys.setlocale("LC_TIME", locale = "English")
}
