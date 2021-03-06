# Limpopo Resilience Lab  
## Hydrometeorological Station Network

### Purpose  
The purpose of this respository is to distribute data and code to help import and handle those data from the Limpopo Resilience Lab Hydrometeorological Station Network in the Limpopo River Basin, southern Africa.  This work is a collaboration between Duquesne University, University of Venda, and Rensselaer Polytechnic Institute.  It was supported by the United States Agency for International Development, Southern Africa Regional Mission, Fixed Amount Award 72067419FA00001. This work reflects the work of the authors and does not necessarily reflect the views of USAID or the United States Government.  For more information about the project, please visit [www.duq.edu/limpopo](https://www.duq.edu/academics/schools/natural-and-environmental-sciences/academics/departments-and-programs/environmental-science-and-environmental-science-and-management/limpopo-resilience-lab).  

### Installation  
These data tools can be pulled directly from GitHub.  The code depends on several Tidyverse libraries and RCurl.  The package installation should prompt these additional libraries.  You will also need the devtools library to load from GitHub.  For example:  
> install.packages("devtools")  
> library(devtools)  
> install.github("LimpopoLab/LRLhydromet")  
> library(LRLhydromet)

To run, for example, the Medike Nature Preserve data command, assign the output data from medike():
> data <- medike()  

More information is available on [Tidyverse](https://www.tidyverse.org/) and [RCurl](https://cran.r-project.org/web/packages/RCurl/RCurl.pdf).

### Commands  
#### Data Download  
- mutale(app_token) # Mutale Weir  
- medike(app_token) # Medike Nature Preserve  
#### Data Analysis  
- daily(x) # where x is the data output from one of the data import functions
- wind(t, s, "D") # where t is the angle, s is the speed, and "D" or "R" indicates degrees or radians, respectively.
#### Download Requirements  
The Socrata system that USAID uses to manage their API requires a token to download the full datasets.  Individual users should obtain an application token from [USAID](https://data.usaid.gov/profile/edit/developer_settings).  

### Output  
The output of the data commands are in the form:
|Variable|Unit|Notes|
|---|---|---|
|year||Local time|
|mont||Local time|
|dayn||Local time|
|hour||Local time|
|minu||Local time|
|prcp|mm||
|srad|W/m/m||
|temp|deg. C||
|rhmd|%||
|aprs|kPa||
|wspd|m/s||
|wdir|deg.||
|rivs|m|where available|
|wtmp|deg. C|where available|
|cond|uS/cm|where available|
|trbd|NTU|where available|
|loc.dt||Local date-time number^|
|utc.dt||UTC date-time number^|
|loc.dy||Local day number+|
|met.dy||Local day number+|
|hydro.yr||Hydrologic year++|
|hydro.mo||Hydrologic month++|  

^ date-time is number of seconds from 01 Jan 1970, 00:00, in either local time (SAST) or universal coordinated time (UTC).  
++ hydrologic year begins, in the southern hemisphere, in August, the first hydrologic month, and is labeled by the calendar month in which it ends.  

### Additional Information  
The map of the locations is available at [www.duq.edu/limpopo](https://www.duq.edu/academics/schools/natural-and-environmental-sciences/academics/departments-and-programs/environmental-science-and-environmental-science-and-management/limpopo-resilience-lab/data) under data.  

Data are archived at USAID's Development Data Library (DDL) at [data.usaid.gov](https://data.usaid.gov/).  Data, and data dictionary, can be found at the DDL for the sites:  
- [Mutale Weir](https://data.usaid.gov/d/9ru6-b4nc)  
- [Medike Nature Preserve](https://data.usaid.gov/Environment/Medike-Nature-Preserve/chfb-yzu5)  

### License  
The license is provided in the repository.  The code may be used for any purpose; please credit this project and its funding source.  

