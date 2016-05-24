trimForTable <- function(dataFrame) {
  
  keepCols <- grep('Year|Category|Spending|State', colnames(dataFrame))
  trimFrame <- dataFrame[,keepCols]
  
  moneyCols <- grep('Spending', colnames(trimFrame))
  for(i in 1:length(moneyCols)) {
    trimFrame[,moneyCols[i]] <- paste('$', format(trimFrame[,moneyCols[i]], big.mark=','), sep='')
  }
  
  if('Year' %in% keepCols) {
    
    trimFrame[,'Year'] <- as.integer(trimFrame[,'Year'])
  }
  
  return(trimFrame)
}