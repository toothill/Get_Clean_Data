
## Question 1
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(URL, "c:/datasciencecoursera/Quiz3/Qui3Q1.csv")
file <- read.csv("c:/datasciencecoursera/Quiz3/Qui3Q1.csv")
agricultureLogical <- file$AGS == 6 & file$ACR == 3

## Question 2
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg "
download.file(URL, "c:/datasciencecoursera/Quiz3/Fjeff.jpg", mode = "wb")
jpegf <- readJPEG("c:/datasciencecoursera/Quiz3/Fjeff.jpg", native = TRUE)
quantile(jpegf, probs = c(0.3,0.8))

## Question 3
URL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
URL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv "
GDP <- read.csv(URL1,header = FALSE, skip = 5)
GDP2 <- GDP[1:190,]
GDP2 <- GDP2[, c("V1","V2","V3","V4","V5")]
colnames(GDP2) <- c("CountryCode","Rank","Not","Name", "GDP")
GDP2$Rank <- as.numeric(as.character(GDP2$Rank))
GDP2$GDP <- as.numeric(gsub(",","", as.character(GDP2$GDP)))
EDU <- read.csv(URL2)
M <- merge(EDU, GDP2, by.x = "CountryCode", by.y = "CountryCode", all=FALSE)
M[with(M, order(-Rank)), c("CountryCode", "Rank")]

## Question 4
rks <- M[M$Income.Group == "High income: nonOECD", "Rank"]
mean(as.numeric(rks))

## Question 5
M[, c("CountryCode", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9")]
table(M$Income.Group, useNA = "ifany")
quantile(is.numeric(M$Rank), probs = c(.2,.4,.6,.8))
M[,"V2"]
M$GDP <- 
M$GDPGrp <- cut(M$GDP, breaks = quantile(as.numeric(M$GDP), probs = c(0,.2,.4,.6,.8,1)))
M$GDPGrp
table(M$Income.Group, M$GDPGrp)
M[with(M, order(Rank)), c("Rank", "CountryCode")]
