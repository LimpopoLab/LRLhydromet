#' @export
medike <- function() {
      
      # Medike Nature Preserve
      # API access
      
      # install.packages("readr")
      # install.packages("ggplot2")
      # install.packages("dplyr")
      # install.packages("lubridate")
      # install.packages("RCurl")
      
      # library(readr)
      # library(ggplot2)
      # library(dplyr)
      # library(lubridate)
      # library(RCurl)
      
      data <- readr::read_csv(RCurl::getURL("https://data.usaid.gov/resource/chfb-yzu5.csv"))
      
      offset <- 2 # Medike time is SAST, UTC+2
      
      loc.dt <- as.numeric(lubridate::as_datetime(lubridate::ymd_hm(paste0(data$year, "-", data$mont, "-", data$dayn, "T", data$hour, ":", data$minu)))) # Local time
      utc.dt <- as.numeric(lubridate::as_datetime(lubridate::ymd_hm(paste0(data$year, "-", data$mont, "-", data$dayn, "T", data$hour, ":", data$minu)))) - (offset * 3600) # UTC time
      loc.dy <- as.numeric(lubridate::as_date(lubridate::ymd(paste(data$year, "-", data$mont, "-", data$dayn))))
      met.dy <- loc.dy # preallocation for meteorologic day, begins at 08:00
      hydro.yr <- data$year # preallocation for hydrologic year, begins 01 Aug
      hydro.mo <- data$mont # preallocation for hydrologic month, August is first, July is last
      for (i in 1:nrow(data)) {
            if (data$mont[i] >= 8) { # the hydrologic year in the southern hemisphere begins 01 August
                  hydro.yr[i] <- hydro.yr[i] + 1 # if it is August of after (>=), it is next year
                  hydro.mo[i] <- hydro.mo[i] - 7
            } else {
                  hydro.mo[i] <- hydro.mo[i] + 5
            }
            if (data$hour[i] < 8) {
                  met.dy[i] <- met.dy[i] - 1 # if it is before 8AM, it is the previous day
            }
      }
      
      data <- cbind(data, loc.dt, utc.dt, loc.dy, met.dy, hydro.yr, hydro.mo)
      
}