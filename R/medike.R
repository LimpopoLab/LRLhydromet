#' Import Medike Data
#' 
#' This function loads the Medike data and provides 
#' some processing, will pass to analysis function 
#' for daily data
#' 
#' @return data frame for hydromet station
#' @export
medike <- function() {
      df <- readr::read_csv(RCurl::getURL("https://data.usaid.gov/resource/chfb-yzu5.csv"))
      offset <- 2 
      loc.dt <- as.numeric(lubridate::as_datetime(lubridate::ymd_hm(paste0(data$year, "-", data$mont, "-", data$dayn, "T", data$hour, ":", data$minu)))) 
      utc.dt <- as.numeric(lubridate::as_datetime(lubridate::ymd_hm(paste0(data$year, "-", data$mont, "-", data$dayn, "T", data$hour, ":", data$minu)))) - (offset * 3600) 
      loc.dy <- as.numeric(lubridate::as_date(lubridate::ymd(paste(data$year, "-", data$mont, "-", data$dayn))))
      met.dy <- loc.dy 
      hydro.yr <- data$year 
      hydro.mo <- data$mont 
      for (i in 1:nrow(data)) {
            if (data$mont[i] >= 8) { 
                  hydro.yr[i] <- hydro.yr[i] + 1 
                  hydro.mo[i] <- hydro.mo[i] - 7
            } else {
                  hydro.mo[i] <- hydro.mo[i] + 5
            }
            if (data$hour[i] < 8) {
                  met.dy[i] <- met.dy[i] - 1 
            }
      }
      medike <- cbind(df, loc.dt, utc.dt, loc.dy, met.dy, hydro.yr, hydro.mo)
      return(medike)
}