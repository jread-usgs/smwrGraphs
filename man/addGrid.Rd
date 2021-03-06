% Generated by roxygen2 (4.0.2): do not edit by hand
\name{addGrid}
\alias{addGrid}
\title{Grid Lines}
\usage{
addGrid(current, Xgrid = list(grid = "gray50", finegrid = "none"),
  Ygrid = list(grid = "gray50", finegrid = "none"))
}
\arguments{
\item{current}{the current plot information. Typically, this would be the
output from one of the graph creation functions like \code{xyPlot}. See
\bold{Details}.}

\item{Xgrid}{parameters defining the characteristics of the x-axis grid
lines. The components refer to the color to draw the \code{grid} (at ticks)
or \code{finegrid} (between ticks).}

\item{Ygrid}{parameters defining the characteristics of the y-axis grid
lines. The components refer to the color to draw the \code{grid} (at ticks)
or \code{finerid} (between ticks).}
}
\value{
NULL is returned invisibly.
}
\description{
Add grid lines to a graph.
}
\details{
Information about grid lines is containined in the information returned from
high-level plotting functions in the smwrGraphs package.
}
\note{
The function \code{addGrid} should be used after
setting up a graph with a high-level plotting function in the smwrGraphs
package and setting the \code{what} component in the \code{Plot} argument to
"none." The graph can be completed by using \code{addXY}.
}
\seealso{
\code{\link{xyPlot}}, \code{\link{timePlot}}, \code{\link{addXY}}
}
\keyword{aplot}

