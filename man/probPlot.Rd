% Generated by roxygen2 (4.0.2): do not edit by hand
\name{probPlot}
\alias{probPlot}
\alias{probPlot.default}
\title{Probability Plot}
\usage{
probPlot(x, truncate = NA, FLIP = FALSE, distribution = "normal",
  alpha = 0.4, Plot = list(name = "", what = "points", type = "solid", width
  = "standard", symbol = "circle", filled = TRUE, size = 0.09, color = "black"),
  yaxis.log = TRUE, yaxis.range = c(NA, NA), ylabels = 11, xlabels = 11,
  CDF = !RI, xtitle = ifelse(CDF, "Cumulative Probability",
  "Exceedence Probability"), RI = FALSE,
  RItitle = "Recurrence Interval, in years",
  ytitle = deparse(substitute(x)), caption = "", margin = c(NA, NA, NA,
  NA), ...)

\method{probPlot}{default}(x, truncate = NA, FLIP = FALSE,
  distribution = "normal", alpha = 0.4, Plot = list(name = "", what =
  "points", type = "solid", width = "standard", symbol = "circle", filled =
  TRUE, size = 0.09, color = "black"), yaxis.log = TRUE, yaxis.range = c(NA,
  NA), ylabels = 11, xlabels = 11, CDF = !RI, xtitle = ifelse(CDF,
  "Cumulative Probability", "Exceedence Probability"), RI = FALSE,
  RItitle = "Recurrence Interval, in years",
  ytitle = deparse(substitute(x)), caption = "", margin = c(NA, NA, NA,
  NA), ...)
}
\arguments{
\item{x}{the data to plot. Missing values are allowed and ignored.}

\item{truncate}{truncate the data at the specified value. See
\bold{Details}.}

\item{FLIP}{if TRUE, the plot the cumumlative distribution. Otherwise, plot
as flipped data (largest values on left).}

\item{distribution}{the name of the desired function converting from
probabilities to coordinates.}

\item{alpha}{the alpha value of the function for computing plotting
positions.}

\item{Plot}{control parameters of the plot.}

\item{yaxis.log}{log-transform the y axis?}

\item{yaxis.range}{set the range of the y axis.}

\item{ylabels}{set the y-axis labels. See \code{\link{linearPretty}} for
details.}

\item{xlabels}{set the x-axis labels. See \code{\link{probPretty}} for
details.}

\item{CDF}{if TRUE, then label with increasing probabilities. Otherwise
label with decreasing probabilities.}

\item{xtitle}{the x-axis title (also called x-axis caption).}

\item{RI}{label the top axis with recurrence intervals? If \code{RI} is set
to \code{TRUE}, then \code{CDF} will be set to \code{FALSE}.}

\item{RItitle}{the top x-axis title if \code{RI} is \code{TRUE}.}

\item{ytitle}{the y-axis title (also called y-axis caption).}

\item{caption}{the figure caption.}

\item{margin}{the parameters of the margin of the plot area.}

\item{\dots}{parameters for the distribution function. If any parameter is
specified, then an attempt is made to draw the fit between the computed
distribution and the observed data.}
}
\value{
Information about the graph.
}
\description{
Produce a probability plot.
}
\details{
Truncation of the data to plot (\code{x}) results in a conditional
probability plot. For any numeric value for \code{truncate}, the values in
\code{x} less than or equal to \code{truncate} are not plotted and the
remaining values are plotted at their conditional probability (the
probability computed with all values). The behavior for the default value
for \code{truncate} = NA, depends on \code{yaxis.log}. If \code{yaxis.log}
is TRUE, then \code{truncate} is treated as though it was 0; otherwise
\code{truncate} is treated as though it was \code{-Inf}, which results in no
truncation.
}
\note{
A call should be made to \code{setPage} to set up the graphics
environment before calling \code{probPlot}.
}
\seealso{
\code{\link{setPage}}, \code{\link{ecdfPlot}}, \code{\link{qqPlot}}
}
\keyword{hplot}

