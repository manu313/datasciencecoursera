dir<- "C:/Users/i81146/Dropbox/MJU_XWR/Code/datasciencecoursera/R/week4"
setwd(dir)

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])


best <- function(state, outcome) {
  ## Read outcome data
  outcomex <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if ((state %in% outcomex$State)==FALSE)  return("invalid state")
  else
    if (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia") return("invalid disease")
    else
  
  ## Return hospital name in that state with lowest 30-day rate
    discol <- function(x){
      if (x=="heart attack") 11
      else if (x=="heart failure") 17
      else if (x=="pneumonia") 23
    }
    
    outcome1 <- outcomex[outcomex$State==state,]
    outcome1 <- outcome1[order(outcome1$Hospital.Name),]
    outcome1[,discol(outcome)] <- as.numeric(outcome1[, discol(outcome)])
    
    Mini <- min(outcome1[,discol(outcome)], na.rm = TRUE)
    
    outcome2 <- subset(outcome1, outcome1[,discol(outcome)]==Mini)
    outcome2$Hospital.Name
    
}

best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")



names(outcome)