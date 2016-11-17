library(foreign)
library(flexclust)
nafam <- kccaFamily(name="kmeans-na", dist=distEuclideanNA, cent=centMeanNA)

#data <- read.spss("data/SyndicatedHealth2011-2013_7.sav",
#                to.data.frame=TRUE)
#save(data, file="data/healthData/healthData.Rdata")

load("../data/SyndicateHealthData.Rdata")
#cat(attr(data, "variable.labels"), sep="\n",file="SyndicateHealth-variable.labels.txt")


#householdStruc <- c("Q2_1",   "Q2_2",  "Q2_3",   "Q2_4",   "Q2_5",
#                    "Q2_6",   "Q2a_1",  "Q2a_2",  "Q2a_3",  "Q2a_4",
#                    "Q2a_5",  "Q2a_6")

#background <- c("ID", "year" , "state", "sample",
#                "quarter","location", "Q1", "Gender", "Age", "E5",
#                "E6")

#backgroundData <- data[,c(background,householdStruc)]

#save(backgroundData, file="../data/backgroundData.rda")
load("../data/backgroundData.rda")

##BENEFITS
benefits <- c("A12b_1", "A12b_2", "A12b_6", "A12b_7", "A12b_11",       
 "A12b_12")
coding.benefits <- c(1:5,NA)
subset.benefits <- "Quarter_3"

##VIEWS
views <- c("A12a_1","A12a_3","A12a_5","A12a_6","A12a_7",
              "A12a_8","A12a_10")
coding.views <- c(1:5,NA)
subset.views <- "Quarter_2"

##RATING CURRENT
ratingCurrent <- c("B12b_1","B12b_2","B12b_3",
"B12b_4","B12b_5","B12b_6","B12b_10","B12b_11","B12b_12","B12b_13","B12b_14","B12b_16",
                   "B12b_17","B12b_18","B12b_19","B12b_20","B12b_21","B12b_23","B12b_24","B12b_26")
coding.ratingCurrent <- c(1:9,NA,NA)
subset.ratingCurrent <- "ALL"

##CHANCES
chances <- c("C8_1", "C8_2", "C8_3", "C8_5", "C8_9", "C8_10", "C8_11")
coding.chances <- c(1:5,NA)
subset.chances <- "Sample_A"

##INTERESTS
interests <-
c("B9xExtrai_1","B9xExtrai_2","B9xExtrai_3","B9xExtrai_4","B9xExtrai_5","B9xExtrai_6","B9xExtrai_7","B9xExtrai_8","B9xExtrai_9")
coding.interests <- c(1,0,NA)
subset.interest <- "Sample_B"

##ENCOURAGING MAINTAIN
encouragingMaintain <- c("B7b_1","B7b_2","B7b_3","B7b_4", "B7b_5","B7b_8","B7b_9")   
coding.encouragingMaintain <- c(0,1)
subset.encouragingMaintain <- "Sample_B"

##REASONS NO
reasonsNo <- c("C11a_1","C11a_2", "C11a_3", "C11a_4",
               "C11a_5","C11a_6", "C11a_7", "C11a_8", "C11a_11")
coding.reasonsNo <- c(2,1,0,NA,NA)

save(benefits, coding.benefits, subset.benefits, views, coding.views, subset.views, ratingCurrent, coding.ratingCurrent, subset.ratingCurrent, chances, coding.chances, subset.chances, interests, coding.interests, subset.interest, encouragingMaintain, coding.encouragingMaintain, subset.encouragingMaintain, reasonsNo, coding.reasonsNo, file="../data/variables.Rdata")
