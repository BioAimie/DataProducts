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