#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        data(airquality)
        
        airq <- airquality
        airq <- airq[which(airq$Month==9),] # only september
        airq$date <- as.Date(paste("1973", airq$Month, airq$Day, sep="-"))
        
        if (input$chck)
            colorr = "lightgray"
        else
            colorr = "white"
        plot(airq$date, airq$Wind, cex=1, col = colorr, lwd=10, xlab = "Date", ylab = "Wind speed")
        
        DnRange <- input$slider[1]
        UpRange <- input$slider[2]
        
        airq <- airq[which((airq$Wind >= DnRange) & (airq$Wind <= UpRange)),]
        points(airq$date, airq$Wind, col="blue", cex=1, lwd=10)
        
        

    })

})
