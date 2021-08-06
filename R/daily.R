#' Convert and export to daily data
#' 
#' This function takes the output from the site 
#' load functions and processed them to daily 
#' values. Maximum of 96 records per day or every
#' 15 minutes.  Output day is in terms of lubridate 
#' date, days since 01 Jan 1970.  
#' 
#' @return daily data
#' @export
daily <- function(x) {
      x$prcp <- dplyr::na_if(x$prcp, -9999)
      start.date <- min(c(x$loc.dy,x$met.dy))
      end.date <- max(c(x$loc.dy,x$met.dy))
      dt <- c(start.date:end.date)
      p <- array(NA, dim = c((end.date-start.date+1), 96))
      for (i in 1:(nrow(x))) {
            j <- (x$hour[i]*4) + (x$minu[i]/15) + 1
            p[(loc.dy[i]-start.date+1),j] <- x$prcp[i]
      }
      prcp <- array(NA, dim = (end.date-start.date+1))
      for (i in 1:(end.date-start.date+1)) {
            prcp[i] <- mean(p[i,], na.rm = TRUE)
      }
      t <- array(NA, dim = c((end.date-start.date+1), 96))
      for (i in 1:(nrow(x))) {
            j <- (x$hour[i]*4) + (x$minu[i]/15) + 1
            t[(met.dy[i]-start.date+1),j] <- x$prcp[i]
      }
      temp <- array(NA, dim = (end.date-start.date+1))
      tmax <- temp
      tmin <- temp
      for (i in 1:(end.date.t-start.date.t+1)) {
            temp[i] <- mean(t[i,], na.rm = TRUE)
            tmax[i] <- max(t[i,], na.rm = TRUE)
            tmin[i] <- min(t[i,], na.rm = TRUE)
      }
      daily <- data.frame(dt,temp,mint,maxtprcp)
}