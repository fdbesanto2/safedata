% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_safe.R
\name{download_safe_files}
\alias{download_safe_files}
\title{Download SAFE dataset files}
\usage{
download_safe_files(
  record_ids,
  confirm = TRUE,
  xlsx_only = TRUE,
  download_metadata = TRUE,
  refresh = FALSE,
  token = NULL
)
}
\arguments{
\item{record_ids}{A vector of SAFE dataset record ids or a 
\code{\link{safe_record_set}} object.}

\item{confirm}{Requires the user to confirm before download (logical)}

\item{xlsx_only}{Should all files be downloaded or just the core .xslx file (logical)}

\item{download_metadata}{Should the metadata record for the file be downloaded (logical)}

\item{refresh}{Should the function check if local copies have been modified and 
download fresh copies. This is useful if the local copies have unintentionally 
been modified but note the warning above.}

\item{token}{An access token for restricted datasets. Not currently implemented.}
}
\value{
Invisibly, a vector of paths for successfully downloaded files.
}
\description{
This downloads files associated with SAFE datasets, either all of the files 
included in a set of records (\code{xlsx_only=FALSE}) or just the core .xlsx
files (\code{xlsx_only=FALSE}), and stores them in the SAFE data directory.
Currently, there is no mechanism for importing restricted datasets.
}
\details{
By default, the function will also download the dataset metadata. This 
information is required by many of the functions in the package but users
can turn off automatic metadata download.
}
\section{Warning}{

Using \code{refresh=TRUE} will \strong{overwrite locally modified files} and 
replace them with the versions of record from Zenodo.
}

\examples{
   \dontrun{
   safedir <- system.file('example_data_dir', package='safedata')
   set_safe_dir(safedir, update=FALSE, validate=FALSE)
   recs <- validate_record_ids(c(3247631, 3266827, 3266821))
   download_safe_files(recs, confirm=FALSE)
   }
}
