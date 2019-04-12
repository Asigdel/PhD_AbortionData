rm(list=ls())
### Importing data from Excel file into R using readxl package ###
library(readxl)

# Read data from excel file 
options(scipen=999)
Abortdata <- read_excel("AbortionData-2019-04-09.xlsx")
head(Abortdata);dim(Abortdata) 
View(Abortdata)

# cows number
length(unique(Abortdata$Index)) # 6193
length(unique(Abortdata$RFID)) # 6193

# Data coverage : 2011 - 2017

# Lactation Number
# Why lact 0?
unique(Abortdata$Lact)

# records per cow
rpcow <- data.frame(table(Abortdata$RFID))
colnames(rpcow)[1] <- "Cows"
head(rpcow)
table(rpcow$Freq)
#View(rpcow)


# Total records per cow
sum(rpcow$Freq)  # 35742 

# histogram of no. of records per cow
#hist(rpcow$Freq,xlim=c(0,28))

# Number of sires used 

length(unique(Abortdata$Sire)) # 577

# Number of services needed for successful insemination
# how many cows have successful inseminate in one case
# how many cows have successful inseminations in two cases


# No. of Pregancy events
table(Abortdata$Preg)
# We have only 22005(0) and 12174(1)
# We may not use all the records

# No .of abortion events
table(Abortdata$Abt)

# Confirmed abortion or not
table(Abortdata$Abt)
# We have only 6427 (0) and 1030 (1)

# Standardize file structure

## Important remarks
### exceptions, decriptions of variable names

## load packages
library(some_package)
library(some_other_package)

## load functions
source(paste(here(),"Func/function.R",sep="/"))

## load data
mytbl <- read.csv("RawData/your_table.csv")

## Action 1










