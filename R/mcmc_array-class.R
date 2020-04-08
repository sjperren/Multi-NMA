#' Working with 3D MCMC arrays
#'
#' 3D MCMC arrays (Iterations, Chains, Parameters) are produced by `as.array()`
#' methods applied to `stan_nma` or `nma_summary` objects.
#'
#' @rdname mcmc_array-class
#' @name mcmc_array-class
#' @aliases mcmc_array
#'
NULL

#' @param x,object A 3D MCMC array of class `mcmc_array`
#' @param probs Numeric vector of quantiles of interest
#' @param ... Further arguments passed to other methods
#'
#' @rdname mcmc_array-class
#' @return The `summary()` method returns a [nma_summary] object, the `print()`
#'   method returns `x` invisibly.
#' @export
summary.mcmc_array <- function(object, ..., probs = c(0.025, 0.25, 0.5, 0.75, 0.975)) {
  ss <- summary_mcmc_array(object, probs = probs)
  out <- list(summary = ss, sims = object)
  class(out) <- "nma_summary"
  return(out)
}

#' @rdname mcmc_array-class
#' @export
print.mcmc_array <- function(x, ...) {
  d <- dim(x)
  cglue("A MCMC array with {prod(d[1:2])} draws ({d[1]} iterations in {d[2]} chain{if (d[2] > 1) 's' else ''}) of {d[3]} parameter{if (d[3] > 1) 's' else ''}.")
  NextMethod(...)
  invisible(x)
}