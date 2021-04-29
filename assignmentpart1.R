pollutantmean<-function(directory, pollutant, id=1:332){
        
        #creating the path and formating the data file
        fileNames<-paste0(directory,"/",formatC(id, width=3, flag=0),".csv")
        directory<-setwd("C:/Users/Fotis K/Documents/R/r_coursera/week2/specdata")
       
        #reading in all files and making a large datalist
        lst<-lapply(fileNames, data.table::fread)
        dt <- rbindlist(lst)
        
        #with this condition, for every element of pollutant that there is in names(dt)
        #.sd stands for Subset of Data.table
        if (c(pollutant)%in% names(dt)){
                return(dt[, lapply(.SD, mean, na.rm=TRUE), .SDcols = pollutant][[1]])
        }
  
}