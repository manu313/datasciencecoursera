corr <- function(specdata, threshold=0){

                specdata <- "C:/Users/i81146/Dropbox/MJU_XWR/Code/DatascienceCoursera/R/week2/specdata/"
                
                id1=numeric()
                nobs1 = numeric()
                
                for(i in 1:332)
                        {
                          newRead <- read.csv(paste(specdata,formatC(i,width=3,flag="0"),".csv",sep=""), header=TRUE)
                          newread1 <- newRead[!(is.na(newRead$sulfate)) & !(is.na(newRead$nitrate)),]
                          id1 <- c(id1,i)
                          nobs1 <- c(nobs1,nrow(newread1) )
                          
                          data2 <- data.frame(id1,nobs1)
                          
                        }
                
                data3 <- data2[data2$nobs1 > threshold,]   
                
                data4 <- numeric()
                for(i in data3$id1){
                  newread2 <-read.csv(paste(specdata,formatC(i,width=3,flag="0"),".csv",sep=""), header=TRUE)
                  data4 <- c(data4,cor(newread2$nitrate, newread2$sulfate , use = "complete.obs"))
                }
                return(data4)
          }
cr <- corr("specdata", 150)
head(cr)         
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)
