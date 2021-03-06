#' Check if an argument is a matrix
#'
#' @templateVar fn Matrix
#' @template x
#' @template mode
#' @param any.missing [\code{logical(1)}]\cr
#'  Are missing values allowed? Default is \code{TRUE}.
#' @param all.missing [\code{logical(1)}]\cr
#'  Are matrices with only missing values allowed? Default is \code{TRUE}.
#' @param min.rows [\code{integer(1)}]\cr
#'  Minimum number of rows.
#' @param max.rows [\code{integer(1)}]\cr
#'  Maximum number of rows.
#' @param min.cols [\code{integer(1)}]\cr
#'  Minimum number of columns.
#' @param max.cols [\code{integer(1)}]\cr
#'  Maximum number of columns.
#' @param nrows [\code{integer(1)}]\cr
#'  Exact number of rows.
#' @param ncols [\code{integer(1)}]\cr
#'  Exact number of columns.
#' @param row.names [\code{character(1)}]\cr
#'  Check for row names. Default is \dQuote{NULL} (no check).
#'  See \code{\link{checkNamed}} for possible values.
#'  Note that you can use \code{\link{checkSubset}} to check for a specific set of names.
#' @param col.names [\code{character(1)}]\cr
#'  Check for column names. Default is \dQuote{NULL} (no check).
#'  See \code{\link{checkNamed}} for possible values.
#'  Note that you can use \code{\link{checkSubset}} to test for a specific set of names.
#' @template null.ok
#' @template checker
#' @family basetypes
#' @family compound
#' @useDynLib checkmate c_check_matrix
#' @export
#' @examples
#' x = matrix(1:9, 3)
#' colnames(x) = letters[1:3]
#' testMatrix(x, nrows = 3, min.cols = 1, col.names = "named")
checkMatrix = function(x, mode = NULL, any.missing = TRUE, all.missing = TRUE, min.rows = NULL, max.rows = NULL, min.cols = NULL, max.cols = NULL, nrows = NULL, ncols = NULL, row.names = NULL, col.names = NULL, null.ok = FALSE) {
  .Call(c_check_matrix, x, mode, any.missing, all.missing, min.rows, max.rows, min.cols, max.cols, nrows, ncols, row.names, col.names, null.ok)
}

#' @export
#' @rdname checkMatrix
check_matrix = checkMatrix

#' @export
#' @include makeAssertion.R
#' @template assert
#' @rdname checkMatrix
assertMatrix = makeAssertionFunction(checkMatrix, c.fun = "c_check_matrix", use.namespace = FALSE)

#' @export
#' @rdname checkMatrix
assert_matrix = assertMatrix

#' @export
#' @include makeTest.R
#' @rdname checkMatrix
testMatrix = makeTestFunction(checkMatrix, c.fun = "c_check_matrix")

#' @export
#' @rdname checkMatrix
test_matrix = testMatrix

#' @export
#' @include makeExpectation.R
#' @template expect
#' @rdname checkMatrix
expect_matrix = makeExpectationFunction(checkMatrix, c.fun = "c_check_matrix", use.namespace = FALSE)
