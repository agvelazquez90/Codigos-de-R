library(RCurl)
url <- "ftp://yourServer"
userpwd <- "yourUser:yourPass"
filenames <- getURL(url, userpwd = userpwd,
             ftp.use.epsv = FALSE,dirlistonly = TRUE)
times<-lapply(strsplit(filenames,"[-.]"),function(x){
  time<-paste(c(substr(x[1], nchar(x[1])-3, nchar(x[1])),x[2:6]),
        collapse="-")
  time<-as.POSIXct(time, "%Y-%m-%d-%H-%M-%S", tz="GMT")
})
ind <- which.max(times)
dat <- try(getURL(paste(url,filenames[ind],sep=""), userpwd = userpwd))
