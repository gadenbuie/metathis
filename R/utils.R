# nocov start
has_package_version <- function(package, version) {
  pkg_v <- packageVersion(package)
  if (is.null(pkg_v)) {
    return(FALSE)
  }
  pkg_v >= package_version(version)
}

packageVersion <- function(package) {
  if (!requireNamespace(package, quietly = TRUE)) {
    return(NULL)
  }
  pkg_v <- read.dcf(
    system.file("DESCRIPTION", package = package),
    fields = "Version"
  )
  package_version(pkg_v[[1]])
}
# nocov end
