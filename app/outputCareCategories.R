outputCareCategories <- function(dataFrame) {
  
  categories <- as.character(unique(dataFrame[,'Category']))
  categories <- categories[order(categories)]
  
  return(categories)
}