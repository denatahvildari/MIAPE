x <- c("New York Manhattan UpperEast",
       "Upper East, Manhattan, New York",
       "Manhattan, New York, Upper East",
       "California, San Francisco, Knob Hill",
       "San Francisco Knob Hill California")

library(gsubfn)
?"gsub"
states <- paste(state.name, collapse = "|")
strapplyc(x, states, simplify = TRUE)
  
  