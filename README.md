# Limpopo Resilience Lab Hydrometeorological Station Network

## Purpose  
The purpose of this respository is to distribute data and code to help import and handle those data from the Limpopo Resilience Lab Hydrometeorological Station Network in the Limpopo River Basin, southern Africa.  This work is a collaboration between Duquesne University, University of Venda, and Rensselaer Polytechnic Institute.  It was supported by the United States Agency for International Development, Southern Africa Regional Mission, Fixed Amount Award 72067419FA00001. This work reflects the work of the authors and does not necessarily reflect the views of USAID or the United States Government.  For more information about the project, please visit [www.duq.edu/limpopo](https://www.duq.edu/academics/schools/natural-and-environmental-sciences/academics/departments-and-programs/environmental-science-and-environmental-science-and-management/limpopo-resilience-lab).  

## Installation  
These data tools can be pulled directly from GitHub.  The code depends on several Tidyverse libraries and RCurl.  The package installation should prompt these additional libraries.  You will also need the devtools library to load from GitHub.  For example:  
> install.packages("devtools")  
> library(devtools)  
> install.github("LimpopoLab/LRLhydromet")  
> library(LRLhydromet)

To run, for example, the Medike Nature Preserve data command, assign the output data from medike():
> data <- medike()  

More information is available on [Tidyverse](https://www.tidyverse.org/) and [RCurl](https://cran.r-project.org/web/packages/RCurl/RCurl.pdf).

## Commands  
- medike() # Medike Nature Preserve  

## More Information  
The map of the locations is available at [www.duq.edu/limpopo](https://www.duq.edu/academics/schools/natural-and-environmental-sciences/academics/departments-and-programs/environmental-science-and-environmental-science-and-management/limpopo-resilience-lab/data) under data.  

## License  
The license is provided in the repository.  The code may be used for any purpose; please credit this project and its funding source.  

