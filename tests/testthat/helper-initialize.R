testthat_spark_connection <- function(version = NULL) {

  # generate connection if none yet exists
  connected <- FALSE
  if (exists(".testthat_spark_connection", envir = .GlobalEnv)) {
    sc <- get(".testthat_spark_connection", envir = .GlobalEnv)
    connected <- sparklyr::connection_is_open(sc)
  }

  if (!connected) {
    version <- version %||% Sys.getenv("SPARK_VERSION", unset = "2.0.0")
    setwd(tempdir())
    sc <- spark_connect(master = "local", version = version)
    assign(".testthat_spark_connection", sc, envir = .GlobalEnv)
  }

  # retrieve spark connection
  get(".testthat_spark_connection", envir = .GlobalEnv)
}

testthat_tbl <- function(name) {
  sc <- testthat_spark_connection()
  tbl <- tryCatch(dplyr::tbl(sc, name), error = identity)
  if (inherits(tbl, "error")) {
    data <- eval(as.name(name), envir = .GlobalEnv)
    tbl <- dplyr::copy_to(sc, data, name = name)
  }

  tbl
}

skip_unless_verbose <- function(message = NULL) {
  message <- message %||% "Verbose test skipped"
  verbose <- Sys.getenv("SPARKLYR_TESTS_VERBOSE", unset = NA)
  if (is.na(verbose)) skip(message)
  TRUE
}

if (require("janeaustenr", quietly = TRUE))
  assign("austen", janeaustenr::austen_books(), envir = .GlobalEnv)
