corr <- function(directory, threshold=0){

          complete <- function(specdata,id=1:332){
            specdata <- "C:/Users/i81146/Dropbox/MJU_XWR/Code/Data_science_Coursera/R/week2/specdata/"
            
            id1=numeric()
            nobs1 = numeric()
            
            for(i in id)
            {
              newRead <- read.csv(paste(specdata,formatC(i,width=3,flag="0"),".csv",sep=""), header=TRUE)
              newread1 <- newRead[!(is.na(newRead$sulfate)) & !(is.na(newRead$nitrate)),]
              id1 <- c(id1,i)
              nobs1 <- c(nobs1,nrow(newread1) )
              
              data2 <- data.frame(id1,nobs1)
              
            }
            data2
          }
          complete <- complete("specdata")[complete$nobs1 > threshold]
          complete
}

corr("specdata", 4)

complete("specdata", c(2, 4, 8, 10, 12))