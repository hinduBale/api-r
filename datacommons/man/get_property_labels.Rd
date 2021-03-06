% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/node-core.R
\name{get_property_labels}
\alias{get_property_labels}
\title{Return property labels of specified nodes}
\usage{
get_property_labels(dcids, out = TRUE)
}
\arguments{
\item{dcids}{required, vector of string(s) of dcid(s) to get
property labels for.}

\item{out}{optional, boolean flag indicating whether to get properties
that point away from the given node(s). TRUE by default.}
}
\value{
Named list mapping dcids to lists of property labels via the
  given direction.
}
\description{
Returns a map between nodes and outgoing (default) or incoming
  property labels.
}
\examples{
# dcid string of Santa Clara County.
sccDcid <- 'geoId/06085'
# Get incoming and outgoing properties for Santa Clara County.
inLabels <- get_property_labels(sccDcid, out = FALSE)
outLabels <- get_property_labels(sccDcid)

# List of dcid strings of Florida, Planned Parenthood West, and the
# Republican Party.
dcids <- c('geoId/12', 'plannedParenthood-PlannedParenthoodWest',
           'politicalParty/RepublicanParty')
# Get incoming and outgoing properties for Santa Clara County.
inLabels <- get_property_labels(dcids, out = FALSE)
outLabels <- get_property_labels(dcids)
}
