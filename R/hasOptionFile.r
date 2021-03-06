#' @title
#' Check for Existence of Option File
#'
#' @description 
#' Checks if file \code{/options/options_ns.r} exists.
#'   	
#' @param path \strong{Signature argument}.
#'    Object containing path information.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: trigger error on negative check result; \code{FALSE}: return
#'    \code{FALSE} on negative check result.
#' @template threedot
#' @example inst/examples/hasOptionFile.r
#' @seealso \code{
#'   	\link[rapp]{hasOptionFile-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "hasOptionFile",
  signature = c(
    "path"
  ),
  def = function(
    path = "options/options_ns.r",
    strict = FALSE,
    ...
  ) {
    standardGeneric("hasOptionFile")       
  }
)

#' @title
#' Is Package Project
#'
#' @description 
#' See generic: \code{\link[rapp]{hasOptionFile}}
#'      
#' @inheritParams hasOptionFile
#' @param path  \code{\link{missing}}. 
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/hasOptionFile.r
#' @seealso \code{
#'    \link[rapp]{hasOptionFile}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "hasOptionFile", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    strict,
    ...
  ) {
  
  return(hasOptionFile(
    path = path,
    strict = strict,
    ...
  ))
  
  }
)

#' @title
#' Is Package Project
#'
#' @description 
#' See generic: \code{\link[rapp]{hasOptionFile}}
#'      
#' @inheritParams hasOptionFile
#' @param path  \code{\link{character}}. 
#' @return \code{\link{logical}}. \code{TRUE}: exists; \code{FALSE}: does not exist.
#' @example inst/examples/hasOptionFile.r
#' @seealso \code{
#'    \link[rapp]{hasOptionFile}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "hasOptionFile", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ...
  ) {
  
  ## Root directory exist check //
  if (!file.exists(path)) {
    if (!strict) {
      return(FALSE)
    } else {
      rapp::signalCondition(
        condition = "NegativeOptionFileCheck",
        msg = c(
          "Option file does not exist",
          Path = path
        ),
        ns = "rapp",
        type = "error"
      )
    }
  }    
  
  return(TRUE)
  
  }
)
