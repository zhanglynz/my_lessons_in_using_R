library(dplyr)

set.seed(12022018)

# temp data_frame
temp_df <- data_frame(group_ID = 4L,
                      L_1 = list("a"),
                      L_2 = list(NULL))

# fake data_frame
fk_df <- 
  data_frame(group_ID = sample(1:3, 30, replace = TRUE),
             v1 = sample(c(letters, NA), 30, replace = TRUE),
             v2 = sample(c(letters, NA), 30, replace = TRUE)) %>% 
  group_by(group_ID) %>% 
  summarise(L_1 = list(v1),
            L_2 = list(v2)) %>% 
  bind_rows(temp_df)

result_df <- 
  fk_df %>% 
  mutate(inter_set = mapply(intersect, L_1, L_2)) %>% 
  mutate(n = sapply(inter_set, length))
