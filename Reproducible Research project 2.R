fileurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"

download.file(fileurl,destfile = "./repdata_data_StormData (1).csv.bz2",method = "curl")

Stormdata <- read.csv("repdata_data_StormData (1).csv.bz2")

Storm = subset(Stormdata, select = c("EVTYPE", "INJURIES","FATALITIES","CROPDMG","PROPDMG"))

Injured <- aggregate(INJURIES~EVTYPE, Storm,sum)

Fataldamages <- aggregate(FATALITIES~EVTYPE, Storm,sum)

Cropdamage <- aggregate(CROPDMG~EVTYPE, Storm,sum)

Propertydamage <- aggregate(PROPDMG~EVTYPE, Storm,sum)

Mostfatal <- Fataldamages[order(-Fataldamages$FATALITIES), ][1:5, ]

Mostinjuries <- Injured[order(-Injured$INJURIES), ][1:5, ]

par(mfrow = c(1,2))

barplot(Mostfatal$FATALITIES, las = 3, names.arg = Mostfatal$EVTYPE, main = "Events with Highest Fatalities", 
        ylab = "Number of fatalities", col = "red")

barplot(Mostinjuries$INJURIES, las = 3, names.arg = Mostinjuries$EVTYPE, main = "Events with Highest Injuries", 
        ylab = "Number of injuries", col = "red")

