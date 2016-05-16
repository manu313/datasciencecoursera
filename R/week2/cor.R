specdata1 <- read.csv("C:/Users/i81146/Dropbox/MJU_XWR/Code/DatascienceCoursera/R/week2/specdata/002.csv",header=T)

corr2 <- cor(specdata1$nitrate, specdata1$sulfate , use = "complete.obs")