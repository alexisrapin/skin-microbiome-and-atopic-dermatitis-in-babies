# This file contains functions used across the R project

# Handle labels imported from SPSS
clear_labels <- function(x){
  if(is.list(x)){
    for(i in 1:length(x)) class(x[[i]]) <- setdiff(class(x[[i]]), "labelled")
    for(i in 1:length(x)) attr(x[[i]], "label") <- NULL
  } else {
    class(x) <- setdiff(class(x), "labelled")
    attr(x, "label") <- NULL
  }
  return(x)
}

# Swap elements of two vectors
swap <- function(x, e1 = NULL, e2 = NULL){
  e1.i <- which(x == e1)
  e2.i <- which(x == e2)
  x[e1.i] <- e2
  x[e2.i] <- e1
  return(x)
}

# Get the mode of a categorical array
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Scale a vector on a range
scale_range <- function(x, range = c(0, 1)) {
  return(((max(range)-min(range))*(x-min(x))/(max(x)-min(x)))+min(range))
}

# Format perMANOVA table for printing/reports
format_adonis_output_table <- function(x = NULL){
  x %>%
    mutate(SumsOfSqs = round(SumsOfSqs, digits = 2),
           MeanSqs = round(MeanSqs, digits = 2),
           F.Model = round(F.Model, digits = 2),
           R2 = round(R2, digits = 2),
           `Pr(>F)` = round(`Pr(>F)`, digits = 4),
           Sig = symnum(`Pr(>F)`,
                        corr = F, na = F,
                        cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1),
                        symbols = c("****", "***", "**", "*", "ns"))) %>%
    return
}

# Remove replicates from age-independent variables
remove_replicates <- function(data) {
  d <- data %>%
    t %>%
    as.data.frame %>%
    unique %>%
    t %>%
    as.data.frame
  
  d.names <- names(d)
  n <- d %>%
    names %>%
    gsub(paste(paste0("_", unique(data$Age), "$"), collapse = "|"), "", .) %>%
    table %>%
    subset(. == 1) %>%
    names
  for (i in 1:length(n)) {
    d.names <- gsub(paste(paste0("^", n[i], "_", unique(data$Age), "$"), collapse = "|"), n[i], d.names)
  }
  names(d) <- d.names
  return(d)
}

# Calculates odds ratio between delivery mode and an array of variables
delivery.mode.odds.ratio <- function(x){
  x %>%
    dplyr::mutate(delivery_mode = recode_factor(delivery_mode,
                                                `Vaginal fødsel (normal)` = "Vaginal delivery",
                                                `Vaginal forløsning i vann` = "Vaginal delivery in water",
                                                `C-section acute` = "Emergency C-section",
                                                `C-section elective` = "Elective C-section")) %>%
    dplyr::arrange(delivery_mode) %>%
    `row.names<-`(.$delivery_mode) %>%
    {
      levels <- levels(.$delivery_mode)
      
      list(freq = .,
           odds.ratio = select(., -delivery_mode) %>%
             as.matrix %>%
             oddsratio.wald() %>%
             {
               d1 <- .
               d1$measure %>%
                 as.data.frame %>%
                 mutate(delivery_mode = factor(row.names(.), levels = levels)) %>%
                 bind_cols(d1$p.value %>%
                             as.data.frame)
             }
      )
    }
}
