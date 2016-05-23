filterCategory <- function(dataFrame, selectedCat, makePerCapita = FALSE) {
  
  filterFrame <- dataFrame[as.character(dataFrame[,'Category']) == selectedCat, ]
  colnames(filterFrame)[grep('Spending', colnames(filterFrame))] <- 'TotalSpending'

  if(makePerCapita) {
    
    filterFrame[,'PerCapitaSpending'] <- with(filterFrame, round(TotalSpending/Population*1000,2))
  }
  
  return(filterFrame)
}