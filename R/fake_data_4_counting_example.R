# 24 March 2018
# This is to create a fake data set for counting example

library(dplyr)
library(readr)

set.seed(20180324)

## a helper function
### no_qs = "Number of questions"
### choice is "number of possible choice for each question", 
data_4_one_person <- function(id_x = "1", no_qs = 4, choices = 3)
{no_of_choices_made <- sample(choices, no_qs, replace = TRUE)
 
 Q_number <- rep(1:no_qs, no_of_choices_made)
 answers <- unlist(lapply(no_of_choices_made, 
                   function(x) sample(LETTERS[1:choices], x, replace = FALSE)))
 ID <- rep(id_x, sum(no_of_choices_made, na.rm = TRUE))
 
 result <- data.frame(ID = ID,
                      Q_NO = Q_number,
                      answers = answers
                     )

}

## data for five people
result_in_list <- lapply(as.character(1:5), function(x) data_4_one_person(id_x = x))

## another helper function: to "simplify" the list
combine_df <- function(a_list)
{n <- length(a_list)
 initial_df <- a_list[[1]]
 
 if(n >= 2)
 {for(i in 2:n) initial_df <- bind_rows(initial_df, a_list[[i]])}
 
 return(initial_df)
}

## output
final_result <- combine_df(result_in_list)

## write into csv
write_csv(final_result, path = "./data/fake_data_4_counting_example.csv")
  