# load the necessary packages
library(shiny)
library(RCurl)
library(googleVis)

shinyUI(fluidPage(
  
  includeCSS('style.css'),
  
  headerPanel('Medicare Spending Summary: Top Prescriptions, Inpatient & Outpatient Care'),
  # print('This app shows the user a chart and table based on user input. Sometimes the page needs to be reloaded the first time before the chart shows up. To use the app, the user should select a type of spending. If the user selects Inpatient, Oupatient, or Top Prescription Spending, another drop down appears and allows the user to specify which category of care or drug the data should be filtered by.'),

  fluidRow(
    
    column(3),
    
    column(9,
           textOutput('appDesc')  
    )
  ),
  
  fluidRow(
    
    column(3,
           
           selectInput('spendType', 'Display Spending Type:',
                       choices = c('All Spending','Top Prescriptions','Inpatient Care','Outpatient Care')
                       ),
           
           uiOutput('spendTypeExpansion')
    ),
    column(9,
          
           htmlOutput('chartOutput')
    )
    ),
    
    fluidRow(
      
      column(3),
      column(9,
             h3('Data Summary'),
             tableOutput('tableOutput')
      )
    )
)) 