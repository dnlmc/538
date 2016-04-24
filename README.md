# 538.com Riddles: Code & Simulations
This is a repository for code, apps & simulations I whip together to solve puzzles posed by FiveThirtyEight.com's [The Riddler](https://fivethirtyeight.com/tag/the-riddler/ "fivethirtyeight.com").

# Misanthropic Neighbors
First simulation is for the [4/22/16 puzzle](https://fivethirtyeight.com/features/can-you-solve-the-puzzle-of-your-misanthropic-neighbors/ "The Riddler"), which goes as follows:

_The misanthropes are coming. Suppose there is a row of some number, N, of houses in a new, initially empty development. Misanthropes are moving into the development one at a time and selecting a house at random from those that have nobody in them and nobody living next door. They keep on coming until no acceptable houses remain. At most, one out of two houses will be occupied; at least one out of three houses will be. But what's the expected fraction of occupied houses as the development gets larger, that is, as N goes to infinity?_

__My a priori reasoning:__

* Best case = 1/2 occupied houses 
* Worst case = 1/3 occupied houses 

* Mean case = 5/12 occupied houses

As N grows infinitely large, the fraction of occupied houses will approach the mean case. 

There are variances in the distributions of best, worst, & middle cases depending on N being odd or even, as well as its size (in fact, odd N's can do better than 1/2 in edge cases for large N's, and very often for small N's).  However, these marginal variances should shrink asymptotically to zero as N approaches infinity. 

To test this, I created a simulation in R.  I then wrapped that code in an interactive shiny app, which can be accessed here: https://dnlmc.shinyapps.io/misanthrope_app/

__Per this simulation, the proportion of occupied houses converges to ~ .432... as N grows larger.__

__My _a priori_ conjecture was 5/12, which equals roughly .41666...__

As we used to say in my old job: _close enough for government work._


The underlying R code for the simulation is '[misanthropic_neighbors.R](https://github.com/dnlmc/538/blob/master/misanthropic_neighbors.R "R code")' in [this repository](https://github.com/dnlmc/538/ "Github Repository").  The ui.R & server.R scripts pertain to the shiny app implementation.

I'm thinking about adding a representation of a typical row of occupied & unoccupied houses at the end of a given trial, but its utility & interpretability also approaches zero as N increases (& becomes relevant to the problem posed).
