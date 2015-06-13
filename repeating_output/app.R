library(shiny)

##########################################################
## ui
##########################################################

ui <- fluidPage(
  
  titlePanel('Sorry, No Bilocation!'),
  
  mainPanel(
    
    tabsetPanel(
      tabPanel(title = "Panel 1",
        tableOutput("crosstab")
        ),
      tabPanel(title = "Panel 2",
          tableOutput("crosstab")
        )
    )
  )  # end mainPanel
  
) # end fluid page

#################################################################
## server
#################################################################

server <- function(input, output) {
  
  output$crosstab <- renderTable({
    xtabs(~ am + cyl, data = mtcars)
  })
  
} # end server

#######################################################
## knit the app
#######################################################

shinyApp(ui = ui, server = server)