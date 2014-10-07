\dontrun{

## Save current options state //  
opts_old <- getOption(".rapp")

## Set option container //
setNamespaceRappOption(ns = "test")
getNsRappOption(ns = "test")

## Set context-specific option //
setNamespaceRappOption(ns = "test", id = "option_1", value = letters)
getNsRappOption(ns = "test", id = "option_1")

setNamespaceRappOption(ns = "test", id = "option_group_1/option_1", 
   value = TRUE, branch_gap = TRUE)
getNsRappOption(ns = "test", id = "option_group_1/option_1")

## Clean up //
on.exit(options(".rapp" = opts_old))

}
