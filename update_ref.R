update_ref <- function(ref_name = "references.bib"){
  
  refs <- RefManageR::ReadBib(ref_name) %>% 
    as.data.frame()
  
  ids <- substr(row.names(as.data.frame(refs)), 1, nchar(row.names(as.data.frame(refs)))-3)
  
  refs <- magrittr::set_rownames(refs, ids) %>% 
    dplyr::mutate(key = ids) %>% 
    RefManageR::as.BibEntry()
  
  RefManageR::WriteBib(bib = refs, file = ref_name)
}