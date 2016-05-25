# set working directory... take this out when the app goes live
# setwd('~/Documents/Coursera Data Science/DataProducts/app/')

# load the necessary packages
library(shiny)
library(RCurl)
library(googleVis)

# source the data used by the app and do some preliminary cleaning
rx.df <- read.csv('PerscriptionCostsMedicare_2010-2014.csv', header = TRUE, sep = ',')
rx.df$Unit.Count <- as.numeric(gsub(pattern = ',', '', as.character(rx.df$Unit.Count)))
rx.df$Total.Spending <- as.numeric(substr(gsub(',','', as.character(rx.df$Total.Spending)), 2, 100))
rx.df <- rx.df[,c('Year','Indication','Unit.Count','Total.Spending')]
colnames(rx.df)[grep('Indication',colnames(rx.df))] <- 'Category'
colnames(rx.df)[grep('Total.Spending',colnames(rx.df))] <- 'PrescriptionSpending'
rx.df$Key <- 'TopPrescriptions'
rx.df <- rx.df[rx.df$Year < 2014, ]

med.in.11 <- read.csv('MedicareInpatientCharges2011.csv', header = TRUE, sep = ','); med.in.11$Year <- 2011
med.in.12 <- read.csv('MedicareInpatientCharges2012.csv', header = TRUE, sep = ','); med.in.12$Year <- 2012
med.in.13 <- read.csv('MedicareInpatientCharges2013.csv', header = TRUE, sep = ','); med.in.13$Year <- 2013
med.in.df <- rbind(med.in.11[,c('Year','DRG.Definition','Provider.State','Total.Discharges','Average.Medicare.Payments')],
                   med.in.12[,c('Year','DRG.Definition','Provider.State','Total.Discharges','Average.Medicare.Payments')],
                   med.in.13[,c('Year','DRG.Definition','Provider.State','Total.Discharges','Average.Medicare.Payments')])
med.in.df$Category <- ifelse(regexpr(' W',as.character(med.in.df$DRG.Definition)) > 0,
                             tolower(substr(as.character(med.in.df$DRG.Definition), 7, (regexpr(' W',as.character(med.in.df$DRG.Definition))-1))),
                             tolower(substr(as.character(med.in.df$DRG.Definition), 7, 100)))
med.in.df$InPatientSpending <- with(med.in.df, Total.Discharges*Average.Medicare.Payments)
med.in.df$Key <- 'InPatient'

med.out.11 <- read.csv('MedicareOutpatientCharges2011.csv', header = TRUE, sep = ','); med.out.11$Year <- 2011
med.out.12 <- read.csv('MedicareOutpatientCharges2012.csv', header = TRUE, sep = ','); med.out.12$Year <- 2012
med.out.13 <- read.csv('MedicareOutpatientCharges2013.csv', header = TRUE, sep = ','); med.out.13$Year <- 2013
med.out.df <- rbind(med.out.11[,c('Year','APC','Provider.State','Outpatient.Services','Average.Total.Payments')],
                    med.out.12[,c('Year','APC','Provider.State','Outpatient.Services','Average.Total.Payments')],
                    med.out.13[,c('Year','APC','Provider.State','Outpatient.Services','Average.Total.Payments')])
med.out.df$Category <- tolower(substr(substr(as.character(med.out.df$APC), (regexpr('Level',as.character(med.out.df$APC))+6), 100), regexpr(' ',substr(as.character(med.out.df$APC), (regexpr('Level',as.character(med.out.df$APC))+6), 100))+1, 100))
med.out.df$OutPatientSpending <- with(med.out.df, Outpatient.Services*Average.Total.Payments)
med.out.df$Key <- 'OutPatient'

url <- 'http://www.census.gov/popest/data/state/asrh/2015/files/SCPRC-EST2015-18+POP-RES.csv'
pop <- getURL(url, ssl.verifypeer=0L, followlocation=1L)
pop <- read.csv(text=pop)
state.summary <- data.frame(StateAbb = state.abb, StateName = state.name)
pop <- merge(state.summary, pop, by.x='StateName', by.y='NAME')
colnames(pop)[grep('POPEST18PLUS2015', colnames(pop))] <- 'Population'

w <- 800

source('outputCareCategories.R')
source('filterCategory.R')
source('trimForTable.R')

# create the server object
shinyServer(function(input, output) {
  
  # print a description of how to use the web app
  output$appDesc <- renderText(
    
    'This app shows the user a chart and table based on user input. Sometimes the page needs to be reloaded the first time before the chart shows up. To use the app, the user should select a type of spending. If the user selects Inpatient, Oupatient, or Top Prescription Spending, another drop down appears and allows the user to specify which category of care or drug the data should be filtered by.'
  )
  
  # create a list of categories that should be available for filtering - REACTIVE
  categoryList <- reactive({
    
    switch(input$spendType,
           'Inpatient Care' = outputCareCategories(med.in.df),
           'Outpatient Care' = outputCareCategories(med.out.df),
           'Top Prescriptions' = outputCareCategories(rx.df)
    )
  })
  
  # create a second selectInput object if "All Spending is not the selection"
  output$spendTypeExpansion <- renderUI( 
    
    switch(input$spendType,
           'Inpatient Care' = selectInput('careCategory','Select Category of Care:', choices = categoryList(), selected = categoryList()[1]),
           'Outpatient Care' = selectInput('careCategory','Select Category of Care:', choices = categoryList(), selected = categoryList()[1]),
           'Top Prescriptions' = selectInput('careCategory','Select Category of Care:', choices = categoryList(), selected = categoryList()[1])
    )
  )
  
  # format the data nicely for plotting - REACTIVE
  aggregateDataSet <- reactive({
  
    switch(input$spendType,
           'All Spending' = merge(merge(with(med.in.df, aggregate(InPatientSpending~Year, FUN=sum)),with(med.out.df, aggregate(OutPatientSpending~Year, FUN=sum)), by='Year'), with(rx.df, aggregate(PrescriptionSpending~Year, FUN=sum)), by='Year'),
           'Inpatient Care' = filterCategory(merge(with(med.in.df, aggregate(InPatientSpending~Provider.State+Category, FUN=sum)), pop[,c('StateAbb','Population')], by.x='Provider.State', by.y='StateAbb'), input$careCategory, TRUE),
           'Outpatient Care' = filterCategory(merge(with(med.out.df, aggregate(OutPatientSpending~Provider.State+Category, FUN=sum)), pop[,c('StateAbb','Population')], by.x='Provider.State', by.y='StateAbb'), input$careCategory, TRUE),
           'Top Prescriptions' = filterCategory(with(rx.df, aggregate(PrescriptionSpending~Year+Category, FUN=sum)), input$careCategory)
    )
  })
  
  # make some interactive charts using googleVis
  output$chartOutput <- renderGvis({

    Sys.sleep(0.1)
    switch(input$spendType,
           'All Spending' = gvisBarChart(aggregateDataSet(), xvar='Year', yvar=c('InPatientSpending','OutPatientSpending','PrescriptionSpending'), options = list(title='High-level Summary of Medicare Spending', isStacked=TRUE, legend='bottom', vAxis="{format:'####',ticks:[2011,2012,2013]}", hAxis="{format:'$###,###,###'}", width=w, height=400)),
           'Inpatient Care' = gvisGeoChart(aggregateDataSet(), locationvar='Provider.State', colorvar='PerCapitaSpending', options = list(region='US', displayMode='regions', resolution='provinces', colorAxis="{colors:['#FFFFFF','#FF6666']}", width=w, height=400)), 
           'Outpatient Care' = gvisGeoChart(aggregateDataSet(), locationvar='Provider.State', colorvar='PerCapitaSpending', options = list(region='US', displayMode='regions', resolution='provinces', colorAxis="{colors:['#FFFFFF','#FF6666']}", width=w, height=400)),
           'Top Prescriptions' = gvisLineChart(aggregateDataSet(), xvar='Year', yvar='TotalSpending', options = list(title='Top Prescriptions Medicare Spending by Type', vAxis="{format:'$###,###,###'}", width=w, height=400, legend="{position:'none'}",colors="['#FF6666']")) 
    )
  })

  # make some summary tables that go below the charts
  output$tableOutput <- renderTable(trimForTable(aggregateDataSet()), include.rownames=FALSE)
  
})