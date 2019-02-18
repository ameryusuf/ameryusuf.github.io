Orange Tree Age Predictor
========================================================
author: Amer Malik
date: Feb 17, 2019
autosize: true
transition: rotate



About the App
========================================================


- Predicts the age of an orange tree based on the circumference of its trunk
- The app uses two different linear models to make the predictions
- Uses the Orange dataset that comes packaged with R
- The app incorporates a slider as user input for the circumference 
- There are two checkboxes for user input for the two models used for prediction
- The app uses the tabPanel function to seperate out the main app and documentation
- Play around with the predictor app at this link https://amerm.shinyapps.io/ddpapp/


User Interface
========================================================

- The user interface has a sidebar panel and a main panel. The app and its documentation are seperated using the    tabsetPanel and tabPanel functions. A chunk of the code used in the ui.R file is as below.


```r
tabPanel("App", sliderInput("sliderCir", "Adjust Circumference", min = 25, max = 220, value = 110),
                             checkboxInput("ShowModel1", "Show/Hide Model 1", value = TRUE),
                             checkboxInput("ShowModel2", "Show/Hide Model 2", value = TRUE))
```
- The mainPanel just contains the output from the server and shows a plot between the Age and Circumference of the tree, and two predicted values from the two models.


```r
 plotOutput("plot1"),
       h3("Predicted Age from Model 1"),
       textOutput("pred1"),
       h3("Predicted Age from Model 2"),
       textOutput("pred2")
```

Server Function
========================================================

- The two prediction models are basic fitted linear models. A snippet from the server.R file is as below.


```r
        model1<- lm(age ~ circumference, data = Orange)
        model2<- lm(age ~ circum + circumference, data = Orange)
```
- The two model predictor funtions are setup reactively based on the user input from the slider. 


```r
 model1pred<- reactive({
                cirInput<-input$sliderCir
                predict(model1, newdata = data.frame(circumference = cirInput))
                
        })
```

Output plot
========================================================
- The output plot that the user gets is as shown below. The two points of the model predictors are not shown here as
they change reactively as the user adjusts the input on the slider. For the actual demonstration of the app, please
visit https://amerm.shinyapps.io/ddpapp/.

![plot of chunk unnamed-chunk-5](DDPPitch-figure/unnamed-chunk-5-1.png)
