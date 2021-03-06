#' Plot Data
#' 
#' Create a line or scatter plot.
#' 
#' Setting \code{ylabels} or \code{xlabels} to 0 will suppress ticks and
#' labels. That can be useful for relative axes or specialized labeling.
#' 
#' @name xyPlot
#' @rdname xyPlot
#' @aliases xyPlot xyPlot,numeric,numeric-method
#'xyPlot,factor,numeric-method
#' @param x the x-axis data
#' @param y the y-axis data to plot
#' @param Plot control parameters of the plot.
#' @param yaxis.log log-transform the y axis?
#' @param yaxis.rev reverse the y axis?
#' @param yaxis.range set the range of the y-axis.
#' @param xaxis.log log-transform the x axis?
#' @param xaxis.range set the range of the x-axis.
#' @param ylabels set up y-axis labels. See \code{\link{linearPretty}} for
#' details.
#' @param xlabels set up x-axis labels. See \code{\link{linearPretty}} for
#' details.
#' @param xtitle the x-axis title (also called x-axis caption).
#' @param ytitle the y-axis title (also called y-axis caption).
#' @param caption the figure caption.
#' @param margin set up the plot area margins.
#' @param xlabels.rotate rotate x-axis labels 90 degrees (perpendicular to the axis)?
#' @param ... arguments for specific methods.
#' @return Information about the graph
#' @note A call should be made to \code{setPage} to set up the graphics
#' environment before calling \code{xyPlot}.
#' @docType methods
#' @section Methods: \describe{ 
#' \item{signature(x = "numeric", y =
#' "numeric")}{ Create a line or scatter plot from numeric x and
#' y data. } 
#' \item{signature(x = "factor", y ="numeric")")}{ Create a vertical
#'dot plot. Also useful for setting up a bar chart for discrete x-axis values. }
#'}
#' @seealso \code{\link{setPage}}, \code{\link{timePlot}},
#' \code{\link{colorPlot}}
#' @keywords methods hplot
#' @exportMethod xyPlot
setGeneric("xyPlot", function(x, y, Plot=list(),
                              yaxis.log=FALSE, yaxis.rev=FALSE, yaxis.range=c(NA,NA),
                              xaxis.log=FALSE, xaxis.range=c(NA,NA),
                              ylabels=7, xlabels=7, xtitle="", ytitle="",
                              caption="", margin=c(NA, NA, NA, NA), ...)
           standardGeneric("xyPlot")
					 # Coding History:
					 #    2008May13 DLLorenz Original coding.
					 #    2008Jun12 DLLorenz Start of revisions
					 #    2010Nov15 DLLorenz Begin modifications for R
					 #    2011Apr16 DLLorenz Added complete complement of args to setPlot
					 #    2011Aug03 DLLorenz Added axis labeling info to current
					 #    2011Oct24 DLLorenz Tweaks for package
					 #    2012Jan10 DLLorenz Allow labels=0 to suppress ticks and labels
					 #    2012Mar23 DLLorenz dots for future methods
					 #    2012Sep27 DLLorenz Made S4 generic--Note for generic methods that might ever 
					 #                       require or use deparse(substitute(ARG)), those arguments 
					 #                       must be in the call to setGeneric and ...; any other 
					 #                       overriding defaults can be set in the method function!
					 #    2012Nov14 DLLorenz Added signature "factor", "numeric"
					 #    2012Nov15 DLLorenz Changed all defaults to "points"
					 #    2013Apr09 DLLorenz Added setGD 
					 #    2014Jun27 DLLorenz Converted to roxygen
					 )

#' @rdname xyPlot
setMethod("xyPlot", signature("numeric", "numeric"),
function(x, y, # data
         Plot=list(name="", what="points", type="solid",
           width="standard", symbol="circle", filled=TRUE,
           size=0.09, color="black"), # plot controls
         yaxis.log=FALSE, yaxis.rev=FALSE, yaxis.range=c(NA,NA), # y-axis controls
         xaxis.log=FALSE, xaxis.range=c(NA,NA), # x-axis controls
         ylabels=7, xlabels=7, # labels
         xtitle=deparse(substitute(x)),
         ytitle=deparse(substitute(y)), # axis titles
         caption="", # caption 
         margin=c(NA, NA, NA, NA), ...) { # margin controls
  ## build a simple (single line or scatter) x-y plot
  ##
  ## create the plotting positions
  ## set up the axes
  xtitle <- xtitle # needed to 'set' names
  ytitle <- ytitle
  ylabel0 <- FALSE
  if(dev.cur() == 1)
    setGD("XYPlot")
  if(is.list(ylabels))
    yax <- c(list(data=y, axis.range=yaxis.range, axis.log=yaxis.log,
                  axis.rev=yaxis.rev), ylabels)
  else {
    if(is.numeric(ylabels) && length(ylabels) == 1 && ylabels == 0) {
      ylabel0 <- TRUE
      yax <- list(data=y, axis.range=yaxis.range, axis.log=yaxis.log,
                  axis.rev=yaxis.rev, axis.labels=2)
    }
    else
      yax <- list(data=y, axis.range=yaxis.range, axis.log=yaxis.log,
                  axis.rev=yaxis.rev, axis.labels=ylabels)
  }
  if(!is.null(Plot$what) && Plot$what == "lines") #Suppress extension for lines and x-axis
  	yax$extend.range <- FALSE
  yax <- do.call("setAxis", yax)
  y <- yax$data
  yax <- yax$dax
  xlabel0 <- FALSE
  if(is.list(xlabels))
    xax <- c(list(data=x, axis.range=xaxis.range, axis.log=xaxis.log,
                  axis.rev=FALSE), xlabels)
  else {
    if(is.numeric(xlabels) && length(xlabels) == 1 && xlabels == 0) {
      xlabel0 <- TRUE
      xax <- list(data=x, axis.range=xaxis.range, axis.log=xaxis.log,
                axis.rev=FALSE, axis.labels=2)
    }
    else
      xax <- list(data=x, axis.range=xaxis.range, axis.log=xaxis.log,
                  axis.rev=FALSE, axis.labels=xlabels)
  }
  if(!is.null(Plot$what) && Plot$what == "lines")
  	xax$extend.range <- FALSE
  xax <- do.call("setAxis", xax)
  x <- xax$data
  xax <- xax$dax
  ## Set margins and controls
  margin.control <- setMargin(margin, yax)
  margin <- margin.control$margin
  right <- margin.control$right
  top <- margin.control$top
  left <- margin.control$left
  bot <- margin.control$bot
  ## Suppress ticks and labels if requested
  if(ylabel0)
    left$ticks <- left$labels <- right$ticks <- right$labels <- FALSE
  if(xlabel0)
    bot$ticks <- bot$labels <- top$ticks <- top$labels <- FALSE
  par(mar=margin)
  ##
  plot(x, y, type="n", xlim=xax$range, xaxs="i", axes=FALSE,
       ylim=yax$range, yaxs="i", ylab="", xlab="")
  Plot <- setPlot(Plot, name="", what="points", type="solid",
                     width="standard", symbol="circle", filled=TRUE,
                     size=0.09, color="black") # force defaults if not set
  explan <- setExplan(Plot) # add info to set up explanation
  plotPars <- explan$current
  lines(x, y, type=plotPars$type, lwd=plotPars$lwd, lty=plotPars$lty,
        pch=plotPars$pch, cex=plotPars$cex, col=plotPars$col, bg=plotPars$col)
  box(lwd=frameWt())
  ## label the axes
  renderY(yax, lefttitle=ytitle, left=left, right=right)
  renderX(xax, bottitle=xtitle, bottom=bot, top=top, caption=caption)
  invisible((list(x=x, y=y, yaxis.log=yaxis.log, yaxis.rev=yaxis.rev,
                  xaxis.log=xaxis.log, explanation=explan, margin=margin,
                  yax=yax, xax=xax)))
}
)

#' @rdname xyPlot
setMethod("xyPlot", signature("factor", "numeric"),
function(x, y, # data
         Plot=list(name="", what="points", type="solid",
           width="standard", symbol="circle", filled=TRUE,
           size=0.09, color="black"), # plot controls
         yaxis.log=FALSE, yaxis.rev=FALSE, yaxis.range=c(NA,NA), # y-axis controls
         xaxis.log=FALSE, xaxis.range=c(NA,NA), # x-axis controls
         ylabels=7, xlabels="Auto", # labels
         xtitle="",
         ytitle=deparse(substitute(y)), # axis titles
         caption="", # caption 
         margin=c(NA, NA, NA, NA), xlabels.rotate=FALSE, ...) { # margin controls
  ## build a simple (single line or scatter) x-y plot
  ##
  ## Set up the axes
  xtitle <- xtitle # needed to 'set' names
  ytitle <- ytitle
  ylabel0 <- FALSE
  if(dev.cur() == 1)
    setGD("XYPlot")
  if(is.list(ylabels))
    yax <- c(list(data=y, axis.range=yaxis.range, axis.log=yaxis.log,
                  axis.rev=yaxis.rev), ylabels)
  else {
    if(is.numeric(ylabels) && length(ylabels) == 1 && ylabels == 0) {
      ylabel0 <- TRUE
      yax <- list(data=y, axis.range=yaxis.range, axis.log=yaxis.log,
                  axis.rev=yaxis.rev, axis.labels=2)
    }
    else
      yax <- list(data=y, axis.range=yaxis.range, axis.log=yaxis.log,
                  axis.rev=yaxis.rev, axis.labels=ylabels)
  }
  yax <- do.call("setAxis", yax)
  y <- yax$data
  yax <- yax$dax
  ## Set up for rotated axis labels
  if(xlabels[1] != "Auto") 
    parnames <- xlabels
  else
    parnames <- levels(x)
  if(xlabels.rotate) {
    botmar <- max(strwidth(parnames, units="inches", family="USGS"))/par("cin")[2] + 2.2
    if(is.na(margin[1]))
      margin[1] <- pmax(3.2, botmar)
  }
  ## Set margins and controls
  margin.control <- setMargin(margin, yax)
  margin <- margin.control$margin
  right <- margin.control$right
  top <- margin.control$top
  left <- margin.control$left
  bot <- margin.control$bot
  ## Continue with x-axis
  xax <- namePretty(parnames, orientation="grid", offset=1)
  bot$ticks <- top$ticks <- FALSE
  x <- as.numeric(x)
  ## Suppress y-axis ticks and labels if requested
  if(ylabel0)
    left$ticks <- left$labels <- right$ticks <- right$labels <- FALSE
  par(mar=margin)
  ##
  plot(x, y, type="n", xlim=xax$range, xaxs="i", axes=FALSE,
       ylim=yax$range, yaxs="i", ylab="", xlab="")
  Plot <- setPlot(Plot, name="", what="points", type="solid",
                     width="standard", symbol="circle", filled=TRUE,
                     size=0.09, color="black") # force defaults if not set
  explan <- setExplan(Plot) # add info to set up explanation
  plotPars <- explan$current
  lines(x, y, type=plotPars$type, lwd=plotPars$lwd, lty=plotPars$lty,
        pch=plotPars$pch, cex=plotPars$cex, col=plotPars$col, bg=plotPars$col)
  box(lwd=frameWt())
  ## label the axes
  renderY(yax, lefttitle=ytitle, left=left, right=right)
  renderX(xax, bottitle=xtitle, bottom=bot, top=top, caption=caption)
  invisible((list(x=x, y=y, yaxis.log=yaxis.log, yaxis.rev=yaxis.rev,
                  xaxis.log=xaxis.log, explanation=explan, margin=margin,
                  yax=yax, xax=xax)))
}
)
