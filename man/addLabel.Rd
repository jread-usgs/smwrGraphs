% Generated by roxygen2 (4.0.2): do not edit by hand
\name{addLabel}
\alias{addLabel}
\title{Axis Labels}
\usage{
addLabel(label, x, side = "bottom", size = "Auto", distance = 0.2,
  justification = "center", orientation = "parallel",
  current = list(yaxis.log = FALSE, yaxis.rev = FALSE, xaxis.log = FALSE))
}
\arguments{
\item{label}{The text or expression to add to the graph.}

\item{x}{the axis location in the correct user units.}

\item{side}{the side to place \code{label}. Must be "bottom," "left," "top,"
or "right." Only the first letter is necessary.}

\item{size}{the sized of the text in points.}

\item{distance}{the distance from the axis, in lines of text.}

\item{justification}{defines the placement of the text relative to \code{x}
if \code{orientation} is "parallel" and relative to \code{distance} if if
\code{orientation} is "perdendicular." Must be one of "left," "center," or
"right."}

\item{orientation}{the orientation of the label relative to the axis. Must
be either "parallel" or "perdendicular."}

\item{current}{the current plot parameters. Typically, this would be the
output from one of the graph creation functions like \code{xyPlot}.}
}
\value{
Nothing is returned.
}
\description{
Adds text in the margin for axis labels.
}
\seealso{
\code{\link{mtext}}, \code{\link{plotmath}} for example
expressions, \code{\link{xyPlot}}
}
\keyword{aplot}

