% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/structureObj_omega.R
\name{structureObj_omega}
\alias{structureObj_omega}
\title{Structure Plot given topic model proportions!}
\usage{
structureObj_omega(omega, samp_metadata, tol, batch_lab, path,
  partition = rep("TRUE", ncol(samp_metadata)), control = list())
}
\arguments{
\item{omega}{the topic proportion matrix returned by topics() in maptpx,
or the omega component from structureObj, with samples along the rows and topics along columns.}

\item{samp_metadata}{the sample metadata, samples along the rows and each column representing some metadata information
that will be used to arrange the Structure plot columns (one plot for one arrangement).}

\item{batch_lab}{the batch labels, the output will have one Structure plot arranged by batch labels too.}

\item{path}{The directory path where we want to save the data and Structure plots.}

\item{partition}{A logical vector of same length as metadata. partition[i]=TRUE will imply that for the Structure
plot for i th metadata, no vertical line parititon between classes is used.}

\item{control()}{A list of control parameters for the Structure plot. The control list has the arguments
       struct.width, struct.height, cex.axis, cex.main, las.struct and las.labels.}
}
\description{
This function takes the counts data (no. of samples x no. of features) and the value of K, the number of topics or
cluster to fit, along with sample metadata information and fits the topic model (due to Matt Taddy, check package
maptpx) and outputs the Structure plot with the column bars in
Structure plot arranged as per the sample metadata information.
}
\author{
Kushal K Dey, Matt Taddy, Matthew Stephens, Ida Moltke
}
\references{
Matt Taddy.On Estimation and Selection for Topic Models. AISTATS 2012, JMLR W\&CP 22.

           Pritchard, Jonathan K., Matthew Stephens, and Peter Donnelly. Inference of population structure using multilocus genotype data.
           Genetics 155.2 (2000): 945-959.
}
\keyword{Structure}
\keyword{clustering,}
\keyword{counts}
\keyword{data,}
\keyword{plot}
