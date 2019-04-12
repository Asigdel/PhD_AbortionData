##############################################################################
# The abortion data of cows and heifers received from NFH (58210075)
##############################################################################
# Anil Sigdel
# 20190411
rm(list=ls())

##############################################################################
# loading necessary packages
##############################################################################

library(readxl)
library(pedantics)
library(RODBC)
library(knitr)
library(dplyr)

##############################################################################
# what system, R, and package configurations am I using?
##############################################################################
print(sessionInfo())

##############################################################################
# loading the data from excel file received on 2019-04-09
##############################################################################
options(scipen=999)
Abortdata <- read_excel("AbortionData-2019-04-09.xlsx")
head(Abortdata);dim(Abortdata) 

##################
# cows number
###################
length(unique(Abortdata$Index)) # 6193
length(unique(Abortdata$RFID)) # 6193

#####################################
# Data coverage : 2011 - 2017
#####################################

#######################################
# No. of Cows and heifers on the dataset
# received on 2019-04-09
########################################
table(Abortdata$Lact)

# No. of Heifers = 6193
Heifers <- filter(Abortdata,Abortdata$Lact==0)
length(unique(Heifers$RFID))

# No. of 1st lac.Cows = 4687 
Lac1cows <- filter(Abortdata,Abortdata$Lact==1)
length(unique(Lac1cows$RFID))

# No. of 2nd lac.Cows = 1885
Lac2cows <- filter(Abortdata,Abortdata$Lact==2)
length(unique(Lac2cows$RFID))

# No. of 3rd lac.Cows = 331
Lac3cows <- filter(Abortdata,Abortdata$Lact==3)
length(unique(Lac3cows$RFID))

# No. of 4th lac.Cows = 1
Lac4cows <- filter(Abortdata,Abortdata$Lact==4)
length(unique(Lac4cows$RFID))

# From the datset, we received on 2019-04-09, we will remove 4th lactation cows

#########################################################
# No. of cows that are in lac3, lac2, lac1 and in lac0 
#########################################################
Rep_cows <- data.frame(with(Abortdata,aggregate(Lact ~ RFID,FUN=function(x){length(unique(x))})))
head(Rep_cows)
table(Rep_cows$Lact)

#############################################################
# Total Distribution of the Cows in Lactations 1, 2 , 3 and 4
#############################################################
# 1504 Heifers in lac0 only
# 2805 cows in lac0 and lac1 
# 1554 cows in lac0, lac1 and lac2
# 329 cows in lac0, lac1, lac2 and lac3
# 5 cows in lac0, lac1, lac2 and lac3 respectively.
# Total 6193 cows in lac, lac2, lac3

















View(Abortdata)


data.frame()

y <- Abortdata %>%
  group_by(Abortdata$RFID) %>%
  mutate(unique_types = n_distinct(Abortdata$Lact))
View(y)


library(data.table)
dt <- as.data.table(sample) 

# Split data.table into different chunks based on unique values in col1
# output is a list where each entry is a data.table 
l <- split(dt, by = "col1")

# Find the intersection of all values in col2 
Reduce(intersect, lapply(1:length(l), function(z) as.character(l[[z]]$col2)))
































unique(Abortdata$RFID)




# Lactation Number
# Why lact 0?
unique(Abortdata$Lact)

###########################
# Testing fixed effects
############################



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






