% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/WindHazaRds.R
\name{TCHazaRdsWindField}
\alias{TCHazaRdsWindField}
\title{Compute the Wind and Pressure Spatial Hazards Field Associated with TCs Single Time Step.}
\usage{
TCHazaRdsWindField(GEO_land, TC, paramsTable, returnWaves = FALSE)
}
\arguments{
\item{GEO_land}{SpatVector or dataframe hazard geometry generated with land_geometry}

\item{TC}{SpatVector or data.frame of Tropical cyclone track parameters for a single time step.}

\item{paramsTable}{Global parameters to compute TC Hazards.}

\item{returnWaves}{Return ocean wave parameters (default = FALSE)}
}
\value{
SpatRaster with the following attributes\tabular{lll}{
   abbreviated attribute \tab description \tab units \cr
   P \tab Atmospheric pressure \tab hPa \cr
   Uw \tab Meridional  wind speed \tab m/s \cr
   Vw \tab Zonal wind speed \tab m/s \cr
   Sw \tab Wind speed \tab m/s \cr
   Dw \tab The direction from which wind originates \tab deg clockwise from true north. \cr
   Hs0 \tab Deep water significant wave height \tab m \cr
   Tp0 \tab Deep water Peak wave period \tab s \cr
   Dp0 \tab The peak direction in which wave are heading \tab deg clockwise from true north. \cr
}
}
\description{
Compute the Wind and Pressure Spatial Hazards Field Associated with TCs Single Time Step.
}
\examples{
require(terra)
dem <- rast(system.file("extdata/DEMs/YASI_dem.tif", package="TCHazaRds"))
land <- dem; land[land > 0] = 0
inland_proximity = distance(land,target = 0)
GEO_land = land_geometry(dem,inland_proximity)

TCi = vect(cbind(c(154,154),c(-26.1,-26)),"lines",crs="epsg:4283") #track line segment
TCi$PRES = 950
TCi$RMAX = 40
TCi$VMAX = 60
TCi$B = 1.4
TCi$ISO_TIME = "2022-10-04 20:00:00"
TCi$LON = geom(TCi)[1,3]
TCi$LAT = geom(TCi)[1,4]
TCi$STORM_SPD = perim(TCi)/(3*3600) #m/s
TCi$thetaFm = 90-returnBearing(TCi)
#OR
TC <- vect(system.file("extdata/YASI/YASI.shp", package="TCHazaRds"))
TC$PRES <- TC$BOM_PRES
TCi = TC[47]
plot(dem);lines(TCi,lwd = 4,col=2)

paramsTable = read.csv(system.file("extdata/tuningParams/defult_params.csv",package = "TCHazaRds"))
#calculate the wind hazard
HAZ = TCHazaRdsWindField(GEO_land,TCi,paramsTable)
plot(HAZ)

#require(rasterVis) #pretty spatial vector plot
#ats = seq(0, 80, length=9)
#UV = as(c(HAZ["Uw"],HAZ["Vw"]),"Raster") #need to convert back to raster
#vectorplot(UV, isField='dXY', col.arrows='white', aspX=0.002,aspY=0.002,at=ats ,
#colorkey=list( at=ats), par.settings=viridisTheme)

}
