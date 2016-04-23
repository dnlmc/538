library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Misanthropic Neighbors Simulation"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      h4("Use the sliders to select the number of houses in the Misanthrope's Development (aka 'N')."),
      helpText("NOTE: Higher values will cause the simulation to run slower."),
      sliderInput("houses",
                  "Number of Houses in the Development:",
                  min = 1,
                  max = 1000,
                  value = 10),
      
      sliderInput("trials",
                  "Number of Trials to Perform:",
                  min = 1,
                  max = 50,
                  value = 20),
 
      #p("I wrote this simulation in R to test my", em("a priori"), "reasoning 
       # that the fraction of expected occupied houses should be roughly 5/11 as N 
        #approaches infinity"),
      # p("This works out to a proportion of ~ .45454545... .  The simulation 
        #converges to a value of ~ .432... . 
        #As we used to say at my old job: close enough for government work."),
      helpText("The simulation averages the proportion of occupied houses
               at the end of each trial.  More trials = bigger sample size."),
      helpText("Notice how the average proportion of occupied houses converges 
               to ~ .43 as N grows larger."),
      helpText(em("(see my", 
            a("github repository", 
              href= 'https://github.com/dnlmc/538/'),
                  "for code & further discussion)")),
      tags$br(),
      tags$br(),
      tags$br(),
      textOutput("text1")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      #h1("Simulation"),
      h4("This is a simulation of a puzzle posed by FiveThirtyEight.com's",
        a("The Riddler", 
          href= 'https://fivethirtyeight.com/features/can-you-solve-the-puzzle-of-your-misanthropic-neighbors/'),
          "on April 22, 2016."),
      p("The riddle goes like this:"),
      p(em("The misanthropes are coming. Suppose there is a row of some number, N,
              of houses in a new, initially empty development. Misanthropes are moving 
                      into the development one at a time and selecting a house at random from 
                      those that have nobody in them and nobody living next door. They keep on 
                      coming until no acceptable houses remain. At most, one out of two houses 
                      will be occupied; at least one out of three houses will be. But what's the 
                      expected fraction of occupied houses as the development gets larger, that 
                      is, as N goes to infinity?")),
      
      plotOutput("histPlot")
      
      
    )
  )
))