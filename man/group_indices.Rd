% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/group-indices.R
\name{group_indices}
\alias{group_indices}
\title{Group id.}
\usage{
group_indices(.data, ...)
}
\arguments{
\item{.data}{a tbl}

\item{...}{Variables to group by. All tbls accept variable names.
Some tbls will accept functions of variables. Duplicated groups
will be silently dropped.}
}
\description{
Generate a unique id for each group
}
\examples{
group_indices(mtcars, cyl)
}
\seealso{
\code{\link[=group_by]{group_by()}}

Other grouping functions: \code{\link{group_by_all}},
  \code{\link{group_by}}, \code{\link{group_rows}},
  \code{\link{group_size}}, \code{\link{groups}}
}
\concept{grouping functions}
\keyword{internal}
