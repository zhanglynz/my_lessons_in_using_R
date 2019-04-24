latin_1 <- matrix(c(1, 2, 3, 4,
                    2, 1, 4, 3,
                    3, 4, 1, 2,
                    4, 3, 2, 1), 4, 4, byrow = TRUE)
latin_2 <- matrix(c(1, 2, 3, 4,
                    3, 4, 1, 2,
                    4, 3, 2, 1,
                    2, 1, 4, 3), 4, 4, byrow = TRUE)

# combine two Latin squares
latin <- 10 * latin_1 + latin_2

(length(unique(c(latin))) == 16) 
# if TRUE, it shows latin_1 and latin_2 are orthogonal

# separate the Latin square and do coding for the first  
latin_in_Letter <- apply(latin, 2, function(x) LETTERS[x %/% 10])
latin_n <- apply(latin, 2, function(x) as.integer(x %% 10))


  