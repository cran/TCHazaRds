% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/WindHazaRds.R
\name{tunedParams}
\alias{tunedParams}
\title{Update Parameter List to Calibrated Values}
\usage{
tunedParams(
  paramsTable,
  infile = system.file("extdata/tuningParams/QLD_modelSummaryTable.csv", package =
    "TCHazaRds")
)
}
\arguments{
\item{paramsTable}{Global parameters to compute TC Hazards.}

\item{infile}{File containing tuning parameters in a .csv. Default for QLD calibration.}
}
\value{
list of params with updated tuning wind parameters.
}
\description{
Update Parameter List to Calibrated Values
}
\examples{
paramsTable <- read.csv(system.file("extdata/tuningParams/defult_params.csv",package = "TCHazaRds"))

tunedParams(paramsTable)
}
