posts <- read.csv("final_implementation/data/original_data/humanizaredes/posts_data_humanizaredes.csv")
comments <- read.csv("final_implementation/data/original_data/humanizaredes/all_comments.csv")

posts_2015 <- posts[posts$Year == 2015, ]

comments_2015 <- comments[0,]

for (post_id in posts_2015$Id) {
  curr_comments_2015 <- comments[comments$IdPost == post_id, ]
  comments_2015 = rbind(comments_2015, curr_comments_2015)
  
}

sample_comments <- comments_2015[sample(nrow(comments_2015), 2000), ]

sample_comments_unique <- sample_comments[unique(sample_comments$IdComment), ]

write.csv(sample_comments, 
            file = "final_implementation/data/2015_data_samples/2015_sample_humanizaredes.csv",
            row.names=FALSE, na="",quote = T)

write.csv(comments_2015, 
          file = "final_implementation/data/2015_data/all_comments_2015_humanizaredes.csv",
          row.names=FALSE, na="",quote = T)

test1 <- read.csv("final_implementation/data/2015_data/all_comments_2015_humanizaredes.csv")
test2 <- read.csv("final_implementation/data/2015_data_samples/2015_sample_humanizaredes.csv")
