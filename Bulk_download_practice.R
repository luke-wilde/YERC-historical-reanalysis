# tutorial http://phenosens.org/modis-data-download-using-modis-r-package/

#create function to load and install (missing) packages
foo <- function(x){
  for( i in x ){
    #  require returns TRUE invisibly if it was able to load package
    if( ! require( i , character.only = TRUE ) ){
      #  If package was not able to be loaded then re-install
      install.packages( i , dependencies = TRUE )
      #  Load package after installing
      require( i , character.only = TRUE )
    }
  }
}

#install.packages("ruf",repos="http://www.csde.washington.edu/~handcock")

#load or install packages
foo( c("sf", "raster", "rgdal", "ggplot2", "MODIS", "reshape2", "remotes", "reticulate", "tidyverse", "devtools", "landsat", "RStoolbox", "hsdar", "rasterVis", "rgee", "rLandsat", "gdalUtilities"))

lapply(c("sf", "raster", "rgdal", "ggplot2", "MODIS", "reshape2", "remotes", "reticulate", "tidyverse", "devtools", "landsat", "RStoolbox", "hsdar", "rasterVis"), require, character.only = T)

#install_github("r-spatial/rgee")
#devtools::install_github("atlanhq/rLandsat")#choose to skip other downloads


# Load the library
library(rLandsat)


# Set target folder for downloaded MODIS HDF files and MODIS data server
MODISoptions(localArcPath = "C:/Users/14064/Dropbox/YERC Project/Data/Remote Sensing/MODIS/",
             MODISserverOrder = c("LAADS", "LPDAAC"))

# download data from server
getHdf(product="MOD13Q1", begin = "2016001", tileH=10, tileV=4, checkIntegrity = FALSE) 

#By running getHdf(…, checkIntegrity = FALSE), you can avoid the Error in !out[a] : invalid argument type. Thanks to the MODIS developer team for making life so easy!