\name{CSPThreeBlackCrows}
\alias{CSPThreeBlackCrows}
\alias{ThreeBlackCrows}
\title{Three Black Crows Candlestick Pattern}
\description{Look for Three Black Crows in a Open/Close price series}
\usage{
  CSPThreeBlackCrows(TS, strict=TRUE, n=20,  minbodysizeMedian=1)
}
\arguments{
  \item{TS}{xts Time Series containing Open and Close prices}
  \item{strict}{if FALSE, use less strict conditions to detect pattern. See details.}
  \item{n}{number of preceding candles to calculate median candle length}
  \item{minbodysizeMedian}{minimum candle length in relation to the median candle length of \code{n} preceding candles}  
}
\details{
  Number of candle lines: \bold{3}\cr\cr
  The market forms a uptrend. The pattern is characterized by three long candlesticks stepping downward like a staircase. In strict mode, the opening of each day is higher than the previous close but lower than the previous open. When strict=FALSE, candle 2 and/or 3 of the formation may open lower than the previous day's close, thus forming a gap.
}
\value{
  A xts object containing the column:
  \item{ThreeBlackCrows}{TRUE if Three Black Crows pattern detected}
}
\author{Andreas Voellenklee}
\references{
The following site(s) were used to code/document this indicator:\cr
  \url{http://www.candlesticker.com/Bullish.asp}\cr
  \url{http://www.candlesticker.com/Bearish.asp}
}
\note{The function filters patterns that look like three black crows, without considering the current trend direction. If only pattern in uptrends should be filtered, a external trend detection function must be used. See examples.}
\seealso{
  \code{\link{ThreeWhiteSoldiers}}
  \code{\link{CSPNLongBlackCandles}}
  \code{\link{CSPNLongBlackCandleBodies}}
}
\examples{
\dontrun{
  getSymbols('YHOO',adjust=TRUE)
  CSPThreeBlackCrows(YHOO)
  CSPThreeBlackCrows(YHOO, strict=FALSE)
  
  # filter for three black crows that occur in uptrends
  ThreeBlackCrows <- CSPThreeBlackCrows(YHOO) & 
    TrendDetectionChannel(lag(YHOO,k=3))[,"UpTrend"]
    
  # how often does that occur?
  colSums(ThreeBlackCrows, na.rm=TRUE)
}
}
\keyword{}
