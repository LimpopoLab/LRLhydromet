# Daily data analysis for LRL Hydrometeorological Station Network
# This is not part of the LRLhydromet package, it is an example code.
# Uses the libraries:
# install.packages("dplyr")
library(dplyr)
# Assumes data import from LRLhydromet import function.
df <- mutale() # Must use app_token to download all data

df <- df %>%
      na_if(-9999) %>%
      na_if(-8888) %>%
      na_if(-7777) %>%
      select(-year, -mont, -dayn, -hour, -minu)

daily <- df %>%
      group_by(loc.dy) %>%
      summarize(prcp = sum(prcp, na.rm = TRUE), temp = mean(temp, na.rm = TRUE), rhmd = mean(rhmd, na.rm = TRUE), srad = sum(srad, na.rm = TRUE), aprs = mean(aprs, na.rm = TRUE))


# # May consider: 
# rename(Precipitation_mm = PRCP,
#        AirTemp_degC = temp,
#        RelHumidity_percent = rhmc,
#        SolarRad_W_m2 = srad,
#        AirPressure_kPa = aprs,
#        WindSpeed_m_s = wspd,
#        WindDir_deg = wdir,
#        RiverStage_m = rivs,
#        WaterTemp_degC = wtmp,
#        Conductivity_uS_cm = cond,
#        Turbidity_NTU = trbd) %>%
