# Performs a stochastic simulation of FiveThirtyEight.com's 'The Riddler' puzzle
# for 4/22/16: Misanthropic Neighbors.
# (see: https://fivethirtyeight.com/features/can-you-solve-the-puzzle-of-your-misanthropic-neighbors/)
#
# Args:
#   houses:  Number of houses in the row
#   trials:  Number of trials to perform & average over
#
# Returns:  the mean proportion of occupied houses at the end of all trials, 
# and plots a histogram of proportions of occupied houses after each trial.


mishouse <- function(houses, trials) {
  
  # initialize vectors for entire program
  
  avgoccupied = 0   #  sums proportion of occupied houses after each trial
  n = houses
  proplist = c()  #  compiles a list of proportions after each trial to plot later
  #occlist = c()   another method is to track by # of occupied houses vice proportion
  
  for (t in 1:trials){
    
    # for each trial, initialize:
    # "row": a representation of rows of houses. Unoccupied houses = 'o', 
    #        occupied = 'x'
    # "choices": a vector consisting of sequential numeric designations for 
    #            each house in the row, used to eliminate houses from consideration
    #            that can no longer be occupied 
    
    row = rep('o', n)
    choices = 1:n
    
    # while loop only works when there is > 1 element in 'choices', because 
    # of how sample() works on vectors of length 1

    while (length(choices) > 1) {
      pick = sample(choices, 1)

        # pick random available house, mark occupied, remove it & 
        # next-door houses from 'choices'
      
        row[pick] = 'x'
        choices = choices[choices != (pick+1)]
        choices = choices[choices != (pick-1)]
      
        choices = choices[choices != pick]
      
    }
  
    # when only one choice is left, sample() is not needed, & wouldn't work
    
    if (length(choices) == 1) {
      pick = choices[1]
      row[pick] = 'x'
      choices = choices[choices != pick]
    }
  
    occupied = sum(row=='x')  #  determine # of occupied houses
    propocc = occupied / n    #  compute proportion
    proplist[length(proplist) + 1] = propocc    # append proportion for each trial
    #occlist[length(occlist) + 1] = occupied

  
    avgoccupied = avgoccupied + propocc   # sum each trial's proportion 
  }
  
  #print(row)
  
  
  hist(proplist, col = 'blue', xlim = c(.20, .60), 
       main = '',
       xlab = paste('Proportion of', n, 'Houses That Are Occupied'),
       ylab = paste('Out of', trials, 'Trials'))
  return (paste('Mean Proportion of Occupied Houses Over', trials, 'Trials:', 
                (avgoccupied / trials)))
  
}
