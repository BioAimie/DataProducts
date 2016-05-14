shinyUI(fluidPage(
  
  includeCSS('style.css'),
  
  headerPanel('Medicare Spending Summary: Top Prescriptions, Inpatient & Outpatient Care'),
  
  fluidRow(
    
    column(3,
           
           selectInput('spendType', 'Display Spending Type:',
                       choices = c('All Spending','Top Prescriptions','Inpatient Care','Outpatient Care')
                       ),
           
           uiOutput('spendTypeExpansion')
    ),
    column(9,
          
           textOutput('Chart should go here!')
    )
    ),
    
    fluidRow(
      
      textOutput('Table should go here!')
      # uiOutput('summaryTable')
    )
)) 