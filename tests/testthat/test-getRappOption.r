context("getRappOption-1")
test_that("getRappOption", {

  opts_old <- getOption(".rapp")
  
  ## Create example content //
  container <- initializeRappOptions()
  expect_is(cont_this <- getRappOption(id = ".rte"), "environment")
  
  setRappOption(
    id = ".rte/test",
    value = TRUE
  )
  
  expect_equal(res <- getRappOption(id = ".rte/test"), TRUE)
  expect_equal(res <- getRappOption(id = ".rte/abcd"), NULL)
  expect_error(res <- getRappOption(id = ".rte/abcd", strict = TRUE))
  
  ## Numerical names //
  container <- initializeRappOptions()
  expect_true(setRappOption(id = "20140101", value = TRUE))
  expect_equal(res <- getRappOption(id = "20140101"), TRUE)
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
