#' Average wind direction
#' 
#' This function takes a wind direction array (1-D) 
#' and averages the direction.  Returns average over 
#' all data provided.  Defaults to data in degrees.  
#' This is needed because if you average 10 degrees 
#' with 350 degrees, the average is zero, but the 
#' result will be 180.  Uses na.rm = TRUE if there 
#' are NAs in the input data array.
#'
#' @param t is angle array
#' @param v is speed array
#' @param dr is ("D")egrees or ("R")adians, default is degrees 
#' @return averaged direction over all data
#' @export
wind <- function(t, v, dr = "D") {
      if (dr == "D") {
            final <- "D"
            direction <- 2 * pi * (t / 360)
            dr <- "R"
      } else {
            final <- "R"
            direction <- t
      }
      if (dr == "R") {
            s <- v * sin(direction)
            s_bar <- mean(s, na.rm = TRUE)
            c <- v * cos(direction)
            c_bar <- mean(c, na.rm = TRUE)
            wind <- atan(s_bar/c_bar)
            if (c_bar < 0) {wind <- wind +pi}
            if (final == "D") {
                  wind <- 360 * (wind / (2 * pi))
            }
      } else {
            print("Please select D or R, in double quotes, for degrees or radians, respectively")
      }
}