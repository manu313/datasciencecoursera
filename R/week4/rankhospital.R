rankhospital <- function(state, outcome, num = "best") {
  
  ## Read outcome data
  outcomex <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if ((state %in% outcomex$State)==FALSE)  return("invalid state")
  else
    if (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia") return("invalid disease")
  else
  
  ## Return hospital name in that state with the given rank 30-day death rate
    discol <- function(x){
      if (x=="heart attack") 11
      else if (x=="heart failure") 17
      else if (x=="pneumonia") 23
    }
  
  num1 <-function(x,y){
      if (x=="best") 1
      else if (x=="worst") nrow(y)
      else x
  }
  
  
    outcome1 <- outcomex[outcomex$State==state,]  
    outcome1 <- outcome1[order(outcome1$Hospital.Name),] 
    outcome1[,discol(outcome)] <- as.numeric(outcome1[, discol(outcome)])
    outcome1 <- outcome1[!is.na(outcome1[,discol(outcome)]),]
    
    
    outcome3 <- transform(outcome1,
                          hosp.rank = ave(outcome1[,discol(outcome)],
                                          FUN=function(x) rank(x, ties.method = "first")))
    outcome3$Hospital.Name[outcome3$hosp.rank==num1(num,outcome3)]
}





rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)



rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)
