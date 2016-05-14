# set working directory... take this out when the app goes live
# setwd('~/Coursera/DataProducts/app')
# setwd('~/Documents/Coursera Data Science/DataProducts/app/')
# 
# # load the necessary packages
# library(shiny)
# library(googleVis)
# 
# # source the data used by the app and do some preliminary cleaning
# rx.df <- read.csv('PerscriptionCostsMedicare_2010-2014.csv', header = TRUE, sep = ',')
# rx.df$Unit.Count <- as.numeric(gsub(pattern = ',', '', as.character(rx.df$Unit.Count)))
# rx.df$Total.Spending <- as.numeric(substr(gsub(',','', as.character(rx.df$Total.Spending)), 2, 100))
# rx.df <- rx.df[,c('Year','Indication','Unit.Count','Total.Spending')]
# 
# med.in.11 <- read.csv('MedicareInpatientCharges2011.csv', header = TRUE, sep = ','); med.in.11$Year <- 2011
# med.in.12 <- read.csv('MedicareInpatientCharges2012.csv', header = TRUE, sep = ','); med.in.12$Year <- 2012
# med.in.13 <- read.csv('MedicareInpatientCharges2013.csv', header = TRUE, sep = ','); med.in.13$Year <- 2013
# med.in.df <- rbind(med.in.11[,c('DRG.Definition','Provider.State','Total.Discharges','Average.Medicare.Payments')],
#                    med.in.12[,c('DRG.Definition','Provider.State','Total.Discharges','Average.Medicare.Payments')],
#                    med.in.13[,c('DRG.Definition','Provider.State','Total.Discharges','Average.Medicare.Payments')])
# med.in.df$Category <- ifelse(regexpr(' W',as.character(med.in.df$DRG.Definition)) > 0,
#                              tolower(substr(as.character(med.in.df$DRG.Definition), 7, (regexpr(' W',as.character(med.in.df$DRG.Definition))-1))),
#                              tolower(substr(as.character(med.in.df$DRG.Definition), 7, 100)))
# 
# med.out.11 <- read.csv('MedicareOutpatientCharges2011.csv', header = TRUE, sep = ','); med.out.11$Year <- 2011
# med.out.12 <- read.csv('MedicareOutpatientCharges2012.csv', header = TRUE, sep = ','); med.out.12$Year <- 2012
# med.out.13 <- read.csv('MedicareOutpatientCharges2013.csv', header = TRUE, sep = ','); med.out.13$Year <- 2013
# med.out.df <- rbind(med.out.11[,c('APC','Provider.State','Outpatient.Services','Average.Total.Payments')],
#                     med.out.12[,c('APC','Provider.State','Outpatient.Services','Average.Total.Payments')],
#                     med.out.13[,c('APC','Provider.State','Outpatient.Services','Average.Total.Payments')])
# med.out.df$Category <- tolower(substr(substr(as.character(med.out.df$APC), (regexpr('Level',as.character(med.out.df$APC))+6), 100), regexpr(' ',substr(as.character(med.out.df$APC), (regexpr('Level',as.character(med.out.df$APC))+6), 100))+1, 100))
# 
# source('outputCareCategories.R')

# create the server object
shinyServer(function(input, output) {
  
  # put reactive expressions/functions up here... this should potentially include outputCareCategories and some sort of aggregating function that would be used
  # to make a data table as well as the chart
  
  
  output$spendTypeExpansion <- renderUI( 
    switch(input$spendType,
           'Inpatient Care' = selectInput('careCategory','Select Category of Care:', choices = outputCareCategories(med.in.df), selected = outputCareCategories(med.in.df)[1]),
           'Outpatient Care' = selectInput('careCategory','Select Category of Care:', choices = outputCareCategories(med.out.df), selected = outputCareCategories(med.out.df)[1]) 
    )
  )
  
})




