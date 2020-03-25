#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# In this project, I use the airquality data. 
# Then I show the wind speed on different days of September 1973.
# The user can select a range of wind speeds and see in which days 
# the wind speed has been in that range.
# There is also a checkbox that allows the user to choose whether or not 
# they want to view wind speed in all days (or only days with wind speed 
# in the selected range).

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Wind speed in different days in September 1973"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("slider", label = h3("Wind Speed"), min = 0, 
                        max = 18, value = c(6, 10)),
            checkboxInput("chck", "Show all days", TRUE)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
