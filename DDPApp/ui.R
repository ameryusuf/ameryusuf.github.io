#
# This is the UI file logic for the shiny app, developed as a class project for the Developing 
# Data Products course conducted on Coursera by the Bloomberg School of Public Health at the  
# Johns Hopkins University. 
#
# 
# 
# 
#

library(shiny)

# Define UI for the application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Age of Tree from Circumference of the Tree Trunk"),
  
  # Sidebar with a slider input for graduation rate 
  sidebarLayout(
    sidebarPanel( 
        tabsetPanel(
                tabPanel("Documentation", h4("This is a simple app that predicts the age of an orange tree based on
                                            the circumference of the tree trunk. The app has two different linear
                                            models, which are used to predict the age of the tree in days based
                                            on the circumference of the tree trunk in millimeters. 
                                            The dataset used in this app is the Orange dataset that comes packaged 
                                            with R."),
                         p("To play with the app, head over to the App tab above. Use the slider to adjust the 
                           circumference of the tree. The predicted age of the tree is then shown as seperate
                           values for each of the two models. The plot shows the Age vs Circumference of the
                           Orange tree and the red and blue lines show the fitted linear models. You can also use
                           the checkboxes to see each model individually, or turn off the lines for the fitted
                           models.")),
                tabPanel("App", sliderInput("sliderCir", "Adjust Circumference", min = 25, max = 220, value = 110),
                             checkboxInput("ShowModel1", "Show/Hide Model 1", value = TRUE),
                             checkboxInput("ShowModel2", "Show/Hide Model 2", value = TRUE))
                    
            )
       
  
  ),
    
    
    # Show a plot of the prediction
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted Age from Model 1"),
       textOutput("pred1"),
       h3("Predicted Age from Model 2"),
       textOutput("pred2")
    )
  
  )

))
