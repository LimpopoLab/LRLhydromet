#' Import Mutale Weir Data
#' 
#' This function loads the Mutale data and provides 
#' some processing, will pass to analysis function 
#' for daily data
#' 
#' @param apptoken from Socrata service
#' @return data frame for hydromet station
#' @export
mutale <- function(apptoken = "null") {
      if (apptoken == "null") {
            df <- readr::read_csv(RCurl::getURL("https://data.usaid.gov/resource/9ru6-b4nc.csv"))
      } else {
            df <- RSocrata::read.socrata("https://data.usaid.gov/resource/9ru6-b4nc.csv",
                                         app_token = apptoken)
      }
      offset <- 2 
      loc.dt <- as.numeric(lubridate::as_datetime(lubridate::ymd_hm(paste0(df$year, "-", df$mont, "-", df$dayn, "T", df$hour, ":", df$minu)))) 
      utc.dt <- as.numeric(lubridate::as_datetime(lubridate::ymd_hm(paste0(df$year, "-", df$mont, "-", df$dayn, "T", df$hour, ":", df$minu)))) - (offset * 3600) 
      loc.dy <- as.numeric(lubridate::as_date(lubridate::ymd(paste(df$year, "-", df$mont, "-", df$dayn))))
      met.dy <- loc.dy 
      hydro.yr <- df$year 
      hydro.mo <- df$mont 
      for (i in 1:nrow(df)) {
            if (df$mont[i] >= 8) { 
                  hydro.yr[i] <- hydro.yr[i] + 1 
                  hydro.mo[i] <- hydro.mo[i] - 7
            } else {
                  hydro.mo[i] <- hydro.mo[i] + 5
            }
            if (df$hour[i] < 8) {
                  met.dy[i] <- met.dy[i] - 1 
            }
      }
      mutale <- cbind(df, loc.dt, utc.dt, loc.dy, met.dy, hydro.yr, hydro.mo)
      return(mutale)
}