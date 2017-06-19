timeSeries_getPetr4_dataset <- function(dataset) {
      cols <- c('id_str', 'created_at')
      cols <- dataset[cols]
      
      return(hchart(dataset$created_at, type = 'column'))
}

time_series <- function(dataset){
      return(hchart(dataset$created_at, type = 'column'))
}