library(shiny)
#gere you could load your data
# Define UI for app that draws a histogram ----
ui <- fluidPage(

  # App title ----
  titlePanel("Hello Shiny!"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),

      selectInput(inputId = "Data",
                  label="Data sets",
                  choices = c("faithful", "iris")

      )

    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Histogram ----
      plotOutput(outputId = "distPlot")

    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) { #this part runs every time the imput changes

  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({ #render plot is the reactive part

    x    <- iris$Sepal.Length #loads the data

    if(input$Data=="faithful"){x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1) #creates a sequence
    hist(x, breaks = bins, col = "#75AADB", border = "white", # prints histogram
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    }
    if(input$Data=="iris"){x <- iris$Sepal.Length
    bins <- seq(min(x), max(x), length.out = input$bins + 1) #creates a sequence
    hist(x, breaks = bins, col = "#75AADB", border = "white", # prints histogram
         xlab = "Sepal Length (in some unit)",
         main = "Histogram of sepal length")
    }

    bins <- seq(min(x), max(x), length.out = input$bins + 1) #creates a sequence



  })

}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
