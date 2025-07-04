% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/WindHazaRds.R
\name{rMax175ms_solver}
\alias{rMax175ms_solver}
\title{rMax175ms_solver}
\usage{
rMax175ms_solver(rMax175ms_m, vMax, rmax_predict_m, TClats)
}
\arguments{
\item{rMax175ms_m}{Numeric. Guessed radius of 17.5 m/s winds in meters.}

\item{vMax}{Numeric. Maximum wind speed (m/s).}

\item{rmax_predict_m}{Numeric. Target radius of maximum winds in meters.}

\item{TClats}{Numeric. Latitude of the tropical cyclone in degrees.}
}
\value{
The difference between the guessed rmax and the target rmax.
}
\description{
A helper function for numerically solving the radius of 17.5 m/s winds using the
Chavas and Knaff (2022) model. This function is called by `uniroot` to compute
the difference between the guessed and actual rmax values.
}
\examples{
rMax175ms_solver(100000, 50, 36000, 20)
}
