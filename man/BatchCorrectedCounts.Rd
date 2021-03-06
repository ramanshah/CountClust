% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/BatchCorrectedCounts.R
\name{BatchCorrectedCounts}
\alias{BatchCorrectedCounts}
\title{Obtaining Batch effect Corrected counts!}
\usage{
BatchCorrectedCounts(data, batch_lab, use_parallel = TRUE)
}
\arguments{
\item{data}{counts data, with samples along the rows and features along the columns.}

\item{batch_lab}{the batch label vector}

\item{use_parallel}{if TRUE, we do a parallel analysis over featres, else serial application.}
}
\description{
This function first converts counts data to CPM data, then apply a linear model with the batch effect as a factor. We take the sum of
             intercept, residuals and mean batch effect across all the batches and then exponentiate it to bring the data back almost to the original
             space of the counts data, except for the batch adjustment.Generate a Poisson random number for each of the means. The obtained counts
             are then devoid of batch effects.
}
\author{
Kushal K Dey, Joyce HSiao
}
\keyword{batch}
\keyword{counts}
\keyword{data,}
\keyword{effect}

