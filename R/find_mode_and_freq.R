library(dplyr)

set.seed(12022018)

fk_df <- 
  # using data_frame rather than data.frame, for dealing with "negative" factor effect
  data_frame(sex = sample(c("M", "F"), 100, replace = TRUE),
             age = sample(19:25, 100, replace = TRUE),
             score = sample(LETTERS[1:4], 100, replace = TRUE))

# Mode function
# https://stackoverflow.com/questions/2547402/is-there-a-built-in-function-for-finding-the-mode
Mode_and_freq <- function(x) {
  ux <- unique(x)
  the_mode <- ux[which.max(tabulate(match(x, ux)))]
  list(the_mode, sum(x == the_mode)) 
}

result_df <- 
  sapply(fk_df, function(x){Mode_and_freq(x)}) %>% 
  t() %>%   
  as.data.frame() %>% 
  mutate(V1 = as.character(V1)) %>% 
  rename(the_mode = V1,
         the_freq = V2) %>% 
  tibble::add_column(var_name = names(fk_df), .after = 0)
  