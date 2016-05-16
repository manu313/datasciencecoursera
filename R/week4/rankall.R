dir<- "C:/Users/i81146/Dropbox/MJU_XWR/Code/datasciencecoursera/R/week4"
setwd(dir)

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcomex <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
    if (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia") return("invalid disease")
  else
  ## For each state, find the hospital of the given rank
    
    outcome10 <- unique(outcomex[,7])
 
    outcome11 <- lapply(outcome10, FUN = function(x) rankhospital(x, outcome , num))
  
   final1 <- cbind(state=outcome10, hospital=outcome11)
   final1
      
    
  
  ## Return a data frame with the hospital names and the (abbreviated) state name
}

##NOT FINISH!!!!!! state are not ordered... :(


r56 <- head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)


r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)


r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)

class(r56)