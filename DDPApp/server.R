#
# This is the server logic of the Shiny web application. 
#
# 
# 
#  

library(shiny)

# Define server logic required for prediction models
shinyServer(function(input, output) {
        
        
        Orange$circum<- ifelse(Orange$circumference - 70 > 0, Orange$circumference - 70, 0)
        
        model1<- lm(age ~ circumference, data = Orange)
        model2<- lm(age ~ circum + circumference, data = Orange)
        
        model1pred<- reactive({
                cirInput<-input$sliderCir
                predict(model1, newdata = data.frame(circumference = cirInput))
                
        })
        
        model2pred<- reactive({
                cirInput<-input$sliderCir
                predict(model2, newdata = 
                                data.frame(circumference = cirInput,
                                           circum = ifelse(cirInput - 70 > 0,
                                                        cirInput - 70, 0)))
                
        })
        
        output$plot1 <- renderPlot({
                cirInput<-input$sliderCir
                
                plot(Orange$circumference, Orange$age, xlab = "Circumference (in mm) of Tree Trunk",
                     ylab = "Age of the Tree (in Days)", bty = "n", pch = 16,
                     xlim = c(25, 230), ylim = c(110, 1600))
                
                if(input$ShowModel1){
                        abline(model1, col = "red", lwd = 2)
                }
                
                if(input$ShowModel2){
                        model2lines <- predict(model2, newdata = data.frame(
                                circumference = 25:220, circum = ifelse(25:220 - 70 > 0,
                                                                 25:220 - 70, 0)))
                        lines(25:220, model2lines, col = "blue", lwd = 2)
                }
                legend(20, 1300, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16,
                       col = c("red", "blue"), bty = "n", cex = 1.2)
                points(cirInput, model1pred(), col = "red", pch = 16, cex = 2)
                points(cirInput, model2pred(), col = "blue", pch = 16, cex = 2)
                
        })
        
        output$pred1 <- renderText({
                model1pred()
        })
        
        output$pred2 <- renderText({
                model2pred()
        })

})
