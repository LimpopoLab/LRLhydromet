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
      start.date <- min(x$loc.dy)
      end.date <- max(x$loc.dy)
      dt <- c(start.date:end.date)
      prcp <- array(NA, dim = c((end.date-start.date+1), 96))
      for (i in 1:(nrow(x))) {
            j <- (x$hour[i]*4) + (x$minu[i]/15) + 1
            prcp[(loc.dy[i]-start.date+1),j] <- x$prcp[i]
      }
      p <- array(NA, dim = (end.date-start.date+1))
      for (i in 1:(end.date-start.date+1)) {
            p[i] <- mean(prcp[i,], na.rm = TRUE)
      }
      daily <- data.frame(dt,p)

# Daily Minimum and Maximum Temperature, based on meteorologic day
minmax <- data %>%
      group_by(met.dy) %>%
      summarize(mintemp_C = min(temp), maxtemp_C = max(temp))
}