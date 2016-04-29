dir<- "C:/Users/i81146/Dropbox/MJU_XWR/Code/Data_science_Coursera/R/week2/specdata"
setwd(dir)


pollutantmean <- function(specdata,pollutant, id) {  
  specdata <- "C:/Users/i81146/Dropbox/MJU_XWR/Code/Data_science_Coursera/R/week2/specdata/"
  data <- numeric()
  for(i in id)
  {
    newRead <- read.csv(paste(specdata,formatC(i,width=3,flag="0"),".csv",sep=""), header=TRUE)
    data <- c(data,newRead[[pollutant]])
  }
  return(print(mean(data,na.rm=TRUE),digits=4))
}

pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
pollutantmean("specdata", "sulfate", 1:10)


complete <- function(specdata,id){
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
  return(print(data2))
}

complete("specdata", c(2, 4, 8, 10, 12))



newread0 <- read.csv("C:/Users/i81146/Dropbox/MJU_XWR/Code/Data_science_Coursera/R/week2/specdata/001.csv", header=TRUE)
newRead2 <- read.csv("C:/Users/i81146/Dropbox/MJU_XWR/Code/Data_science_Coursera/R/week2/specdata/002.csv", header=TRUE)
newread3 <- newRead2[!(is.na(newRead2$sulfate)) | !(is.na(newRead2$nitrate)),]
data2 <- c(data2,c(i, nrow(newread1)))
data3 <- data3(,c("id"=1, "nobs" =45))
