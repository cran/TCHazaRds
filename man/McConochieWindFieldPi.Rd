% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{McConochieWindFieldPi}
\alias{McConochieWindFieldPi}
\title{McConochie Wind Field Time Series}
\usage{
McConochieWindFieldPi(rMax, vMax, vFm, thetaFm, Rlam, V, f, surface)
}
\arguments{
\item{rMax}{radius of maximum winds in km}

\item{vMax}{maximum wind velocity calculation in m/s}

\item{vFm}{input forward velocity of TC}

\item{thetaFm}{input forward direction of TC}

\item{Rlam}{two columns for distances and direction from grid points to TC centre in km}

\item{V}{velocity profile}

\item{f}{coriolis parameter at the centre of TC in hz}

\item{surface}{equals one if winds are reduced from the gradient level to the surface, otherwise gradient winds.}
}
\value{
array with two columns for zonal and meridional wind speed vector-components.
//@example McConochieWindFieldPi(-1e-4,20,2,10,rbind(c(50,35),c(45,40)),c(20,20))
}
\description{
Time series vortex Wind, wind vectors. McConochie, J.D., T.A.Hardy and L.B.Mason, 2004: Modelling tropical cyclone over - water wind and pressure fields. Ocean Engineering, 31, 1757 - 1782.
}
