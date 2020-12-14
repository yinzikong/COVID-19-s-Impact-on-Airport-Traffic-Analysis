data<-read.csv("/Users/zhaoning/Downloads/data visualization/dataset/covid_impact_on_airport_traffic.csv",stringsAsFactors = TRUE)
str(data)
summary(data)
class(data$Date)
data$Date<-as.Date(data$Date)
str(data)
View(data)
sapply(data, function(x) sum(is.na(x)))
data$Centroid<-as.character(data$Centroid)
library(stringi)
data$Centroid<-read.table(text=gsub('[POINT()]', '', data$Centroid), 
                          sep=" ", col.names=c('Latitute', 'Longitude'))
View(data)
plot(data$Country,data$PercentOfBaseline)
plot(data$AirportName,data$PercentOfBaseline)
plot(data$Date,data$PercentOfBaseline)

data_2<-data[-c(1,3,11)]
View(data_2)
write.csv(data_2,"airport_data.csv")

