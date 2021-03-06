% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/distinct.R
\name{distinct}
\alias{distinct}
\title{Select distinct/unique rows}
\usage{
distinct(.data, ..., .keep_all = FALSE)
}
\arguments{
\item{.data}{a tbl}

\item{...}{Optional variables to use when determining uniqueness. If there
are multiple rows for a given combination of inputs, only the first
row will be preserved. If omitted, will use all variables.}

\item{.keep_all}{If \code{TRUE}, keep all variables in \code{.data}.
If a combination of \code{...} is not distinct, this keeps the
first row of values.}
}
\description{
Retain only unique/distinct rows from an input tbl. This is similar
to \code{\link[=unique.data.frame]{unique.data.frame()}}, but considerably faster.
}
\details{
Comparing list columns is not fully supported.
Elements in list columns are compared by reference.
A warning will be given when trying to include list columns in the
computation.
This behavior is kept for compatibility reasons and may change in a future
version.
See examples.
}
\examples{
df <- tibble(
  x = sample(10, 100, rep = TRUE),
  y = sample(10, 100, rep = TRUE)
)
nrow(df)
nrow(distinct(df))
nrow(distinct(df, x, y))

distinct(df, x)
distinct(df, y)

# Can choose to keep all other variables as well
distinct(df, x, .keep_all = TRUE)
distinct(df, y, .keep_all = TRUE)

# You can also use distinct on computed variables
distinct(df, diff = abs(x - y))

# The same behaviour applies for grouped data frames
# except that the grouping variables are always included
df <- tibble(
  g = c(1, 1, 2, 2),
  x = c(1, 1, 2, 1)
) \%>\% group_by(g)
df \%>\% distinct()
df \%>\% distinct(x)

# Values in list columns are compared by reference, this can lead to
# surprising results
tibble(a = as.list(c(1, 1, 2))) \%>\% glimpse() \%>\% distinct()
tibble(a = as.list(1:2)[c(1, 1, 2)]) \%>\% glimpse() \%>\% distinct()
}
