#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#### Initial framework for GU shiny app - here I changed something minimal.

### Workflow for Github and this project ----
# 1.  Open GU-shiny project
# 2.  Pull the latest (blue down arrow in Git tab)
# 3.  Open app.R and start editing
# 4.  Check the app by running it (green right diamond with "RunApp" tag)
# 5.  When happy, push your changes to your local git repo (that is git running on your computer)
# 6.  When we are all happy, push your changes to the GitHub repo (green up arrow in Git tab)
# 7.  Save early, save often on your local computer

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Girl Up Evaluation Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("blahs",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$blahs + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
