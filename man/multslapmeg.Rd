% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multslapmeg.R
\name{multslapmeg}
\alias{multslapmeg}
\title{Testing multiple pathways using SLaPMEG (shared latent process mixed effects model and Globaltest) for
longitudinal Omics data}
\usage{
multslapmeg(pathlist, fixed, random, grouping, subject, method = "BH", data)
}
\arguments{
\item{pathlist}{A list of pathways to be tested.}

\item{fixed}{A one-sided linear formula object for specifying the
fixed-effects in the linear mixed model at the latent process level that
starts with the \code{~} sign.}

\item{random}{A one-sided formula for the random-effects in the
latent process mixed model and starts with the \code{~} sign. At least one random
effect should be included. Covariates with a random-effect are separated
by \code{+}.}

\item{grouping}{name of the covariate representing the grouping structure.}

\item{subject}{name of the covariate representing the repeated measures structure such as subject IDs.}

\item{method}{Correction method for p-values, the default is "BH". For more methods see\code{?p.adjust}.}

\item{data}{data frame containing the variables named in list of \code{pathlist}, \code{fixed},
\code{random}, \code{grouping} and \code{subject}.}
}
\value{
A datafram including the name of pathways and corresponding adjusted p-values.
}
\description{
Run slapmeg simultaneously for several pathways. For each pathway a p-value is calculated based
on SLaPMEG prodcedure as in \code{\link{multslapmeg}}.
Then the p-values are adjusted for multiple comparisons based on the selected procedure.
}
\examples{

\donttest{
# simulate data with 20 omics
testdata<-simslapmeg(nY=20, ntime=5, nsubj = 30, seed=123)
head(testdata)

# creat a list of 3 random pathways of different sizes
pathlist<-list(path1=sample(colnames(testdata)[-c(1:3)],5),
              path2=sample(colnames(testdata)[-c(1:3)],11),
              path3=sample(colnames(testdata)[-c(1:3)],9) )


#use mult slampmeg to get test for the differential expression of all pathways
#and get adjusted p-values
mfit<- multslapmeg(pathlist, ~time, ~1+time, grouping="group", subject="ID", data=testdata)
summary(mfit)
}

}
\references{
Ebrahimpoor, Mitra, Pietro Spitali, Jelle J. Goeman, and Roula Tsonaka. "Pathway testing for longitudinal metabolomics." Statistics in Medicine (2021).
}
\seealso{
\code{\link{slapmeg}}, \code{\link{pairslapmeg}}, \code{\link{plotslapmeg}}
}
\author{
Mitra Ebrahimpoor

\email{m.ebrahimpoor@lumc.nl}
}
