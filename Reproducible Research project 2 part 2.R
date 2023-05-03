fileurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"

download.file(fileurl,destfile = "./repdata_data_StormData (1).csv.bz2",method = "curl")

Stormdata <- read.csv("repdata_data_StormData (1).csv.bz2")

Storm = subset(Stormdata, select = c("EVTYPE", "INJURIES","FATALITIES","CROPDMG","PROPDMG"))

Injured <- aggregate(INJURIES~EVTYPE, Storm,sum)

Fataldamages <- aggregate(FATALITIES~EVTYPE, Storm,sum)

Cropdamage <- aggregate(CROPDMG~EVTYPE, Storm,sum)

Propertydamage <- aggregate(PROPDMG~EVTYPE, Storm,sum)

MostCropdamage <- Cropdamage[order(-Cropdamage$CROPDMG), ][1:5, ]

MostPropertydamage <- Propertydamage[order(-Propertydamage$PROPDMG), ][1:5, ]

##par(mfrow = c(1,2))

barplot(MostCropdamage$CROPDMG, las = 3, names.arg = MostCropdamage$EVTYPE, main = "Events with Highest crop damage", 
        ylab = "Number of fatalities", col = "red")

barplot(MostPropertydamage$PROPDMG, las = 3, names.arg = MostPropertydamage$EVTYPE, main = "Events with Highest property damage", 
        ylab = "Number of injuries", col = "red")

