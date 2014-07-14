##Example of how to download a csv file from the web and read the data into R.
getCSVData <- function(){
        setwd("C:\\RCode")
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        if(!file.exists("MyData")){
                dir.create("MyData")
        }
        download.file(fileURL, destfile="./MyData/microdata.csv")
        dateDownLoaded <- date()
        housingData <- read.csv("./MyData/microdata.csv")
}
##Example of how to download an excel file from the web and read it into R using the 
##xlsx package.
getExcelData <- function(){
        library(rJava)
        library(xlsx)      
        setwd("C:\\RCode")
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
        if(!file.exists("MyData")){
                dir.create("MyData")
        }
        download.file(fileURL, destfile="./MyData/natgasdata.xlsx", mode="wb")
        dateDownLoaded <- date()
        dat <- read.xlsx("./MyDat/natgasdata.xlsx", sheetIndex=1, rowIndex=18:23, colIndex=7:15,header=T)
}
##Example of how to extract XML data from an xml file on the web and parse the data using 
##XPath code.
getXMLData <- function(){
        library(XML) 
        setwd("C:\\RCode")
        fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
        data <- xmlTreeParse(fileURL, useInternal=T)
        findNumberOfZipCodes(data, "21231")
}
##this function takes the parsed XML tree and a ZipCode as a character object and returns the
##the number of times this ZipCode apprears in the file. 
findNumberOfZipCodes <- function(data, x){
        rootNode <- xmlRoot(data)
        xmlSApply(rootNode[[1]][[1]], xmlValue)
        zips <- xpathSApply(rootNode, "//zipcode", xmlValue)
        sum(zips == x)
}