# Load Data
facebook_pos <- read.csv("facebook_data_POSITIVE.csv")
facebook_neg <- read.csv("facebook_data_NEGATIVE.csv")

twitter_pos <- read.csv("twitter_data_POSITIVE.csv")
twitter_neg <- read.csv("twitter_data_NEGATIVE.csv")

# Random Data From Facebook
facebook_pos_rand <- facebook_pos[sample(nrow(facebook_pos), 500), ]
facebook_neg_rand <- facebook_neg[sample(nrow(facebook_neg), 500), ]

#facebook_pos_rand <- facebook_pos[,]
#facebook_neg_rand <- facebook_neg[,]

# Random Data From Twitter
twitter_pos_rand <- twitter_pos[sample(nrow(twitter_pos), 150), ]
twitter_neg_rand <- twitter_neg[sample(nrow(twitter_neg), 150), ]

#twitter_pos_rand <- twitter_pos[,]
#twitter_neg_rand <- twitter_neg[,]

# Coverage
facebook_total_sentences <- length(facebook_pos_rand$IdComment ) + length(facebook_neg_rand$IdComment )
twitter_total_sentences <- length(twitter_pos_rand$IdComment ) + length(twitter_neg_rand$IdComment)

cov_oplexicon_facebook <-  (facebook_total_sentences - (length(facebook_pos_rand$IdComment[facebook_pos_rand$OpinionLexicon == 0]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$OpinionLexicon == 0]))) / facebook_total_sentences
cov_oplexicon_twitter <-  (twitter_total_sentences - (length(twitter_pos_rand$IdComment[twitter_pos_rand$OpinionLexicon == 0]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$OpinionLexicon == 0]))) / twitter_total_sentences

cov_affin_facebook <-  (facebook_total_sentences - (length(facebook_pos_rand$IdComment[facebook_pos_rand$Afinn == 0]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Afinn == 0]))) / facebook_total_sentences
cov_affin_twitter <-  (twitter_total_sentences - (length(twitter_pos_rand$IdComment[twitter_pos_rand$Afinn == 0]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Afinn == 0]))) / twitter_total_sentences

cov_sentistrength_facebook <-  (facebook_total_sentences - (length(facebook_pos_rand$IdComment[facebook_pos_rand$SentiStrength == 0]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$SentiStrength == 0]))) / facebook_total_sentences
cov_sentistrength_twitter <-  (twitter_total_sentences - (length(twitter_pos_rand$IdComment[twitter_pos_rand$SentiStrength == 0]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$SentiStrength == 0]))) / twitter_total_sentences

cov_socal_facebook <-  (facebook_total_sentences - (length(facebook_pos_rand$IdComment[facebook_pos_rand$SoCal == 0]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$SoCal == 0]))) / facebook_total_sentences
cov_socal_twitter <-  (twitter_total_sentences - (length(twitter_pos_rand$IdComment[twitter_pos_rand$SoCal == 0]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$SoCal == 0]))) / twitter_total_sentences

cov_umigon_facebook <-  (facebook_total_sentences - (length(facebook_pos_rand$IdComment[facebook_pos_rand$Umigon == 0]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Umigon == 0]))) / facebook_total_sentences
cov_umigon_twitter <-  (twitter_total_sentences - (length(twitter_pos_rand$IdComment[twitter_pos_rand$Umigon == 0]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Umigon == 0]))) / twitter_total_sentences

cov_vader_facebook <-  (facebook_total_sentences - (length(facebook_pos_rand$IdComment[facebook_pos_rand$Vader == 0]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Vader == 0]))) / facebook_total_sentences
cov_vader_twitter <-  (twitter_total_sentences - (length(twitter_pos_rand$IdComment[twitter_pos_rand$Vader == 0]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Vader == 0]))) / twitter_total_sentences

cov_braz_liwc_facebook <-  (facebook_total_sentences - (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_LIWC == 0]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_LIWC == 0]))) / facebook_total_sentences
cov_braz_liwc_twitter <-  (twitter_total_sentences - (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_LIWC == 0]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_LIWC == 0]))) / twitter_total_sentences

cov_braz_oplexicon_facebook <-  (facebook_total_sentences - (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_OpLexicon == 0]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_OpLexicon == 0]))) / facebook_total_sentences
cov_braz_oplexicon_twitter <-  (twitter_total_sentences - (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_OpLexicon == 0]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_OpLexicon == 0]))) / twitter_total_sentences

cov_braz_sentilex_facebook <-  (facebook_total_sentences - (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_SentiLex == 0]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_SentiLex == 0]))) / facebook_total_sentences
cov_braz_sentilex_twitter <-  (twitter_total_sentences - (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_SentiLex == 0]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_SentiLex == 0]))) / twitter_total_sentences


# Accuracy

acc_oplexicon_facebook <- (length(facebook_pos_rand$IdComment[facebook_pos_rand$OpinionLexicon == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$OpinionLexicon == facebook_neg_rand$Truth])) / facebook_total_sentences
acc_oplexicon_twitter <- (length(twitter_pos_rand$IdComment[twitter_pos_rand$OpinionLexicon == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$OpinionLexicon == twitter_neg_rand$Truth])) / twitter_total_sentences

acc_affin_facebook <- (length(facebook_pos_rand$IdComment[facebook_pos_rand$Afinn == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Afinn == facebook_neg_rand$Truth])) / facebook_total_sentences
acc_affin_twitter <- (length(twitter_pos_rand$IdComment[twitter_pos_rand$Afinn == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Afinn == twitter_neg_rand$Truth])) / twitter_total_sentences

acc_sentistrength_facebook <- (length(facebook_pos_rand$IdComment[facebook_pos_rand$SentiStrength == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$SentiStrength == facebook_neg_rand$Truth])) / facebook_total_sentences
acc_sentistrength_twitter <- (length(twitter_pos_rand$IdComment[twitter_pos_rand$SentiStrength == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$SentiStrength == twitter_neg_rand$Truth])) / twitter_total_sentences

acc_socal_facebook <- (length(facebook_pos_rand$IdComment[facebook_pos_rand$SoCal == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$SoCal == facebook_neg_rand$Truth])) / facebook_total_sentences
acc_socal_twitter <- (length(twitter_pos_rand$IdComment[twitter_pos_rand$SoCal == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$SoCal == twitter_neg_rand$Truth])) / twitter_total_sentences

acc_umigon_facebook <- (length(facebook_pos_rand$IdComment[facebook_pos_rand$Umigon == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Umigon == facebook_neg_rand$Truth])) / facebook_total_sentences
acc_umigon_twitter <- (length(twitter_pos_rand$IdComment[twitter_pos_rand$Umigon == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Umigon == twitter_neg_rand$Truth])) / twitter_total_sentences

acc_vader_facebook <- (length(facebook_pos_rand$IdComment[facebook_pos_rand$Vader == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Vader == facebook_neg_rand$Truth])) / facebook_total_sentences
acc_vader_twitter <- (length(twitter_pos_rand$IdComment[twitter_pos_rand$Vader == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Vader == twitter_neg_rand$Truth])) / twitter_total_sentences

acc_braz_liwc_facebook <- (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_LIWC == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_LIWC == facebook_neg_rand$Truth])) / facebook_total_sentences
acc_braz_liwc_twitter <- (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_LIWC == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_LIWC == twitter_neg_rand$Truth])) / twitter_total_sentences

acc_braz_oplexicon_facebook <- (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_OpLexicon == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_OpLexicon == facebook_neg_rand$Truth])) / facebook_total_sentences
acc_braz_oplexicon_twitter <- (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_OpLexicon == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_OpLexicon == twitter_neg_rand$Truth])) / twitter_total_sentences

acc_braz_sentilex_facebook <- (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_SentiLex == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_SentiLex == facebook_neg_rand$Truth])) / facebook_total_sentences
acc_braz_sentilex_twitter <- (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_SentiLex == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_SentiLex == twitter_neg_rand$Truth])) / twitter_total_sentences


# Precision

prec_oplexicon_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$OpinionLexicon == facebook_pos_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$OpinionLexicon == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$OpinionLexicon == facebook_pos_rand$Truth]))
prec_oplexicon_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$OpinionLexicon == facebook_neg_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$OpinionLexicon == facebook_neg_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$OpinionLexicon == facebook_neg_rand$Truth]))
prec_oplexicon_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$OpinionLexicon == twitter_pos_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$OpinionLexicon == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$OpinionLexicon == twitter_pos_rand$Truth]))
prec_oplexicon_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$OpinionLexicon == twitter_neg_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$OpinionLexicon == twitter_neg_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$OpinionLexicon == twitter_neg_rand$Truth]))

prec_affin_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Afinn == facebook_pos_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Afinn == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Afinn == facebook_pos_rand$Truth]))
prec_affin_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Afinn == facebook_neg_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Afinn == facebook_neg_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Afinn == facebook_neg_rand$Truth]))
prec_affin_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Afinn == twitter_pos_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Afinn == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Afinn == twitter_pos_rand$Truth]))
prec_affin_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Afinn == twitter_neg_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Afinn == twitter_neg_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Afinn == twitter_neg_rand$Truth]))

prec_sentistrength_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$SentiStrength == facebook_pos_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$SentiStrength == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$SentiStrength == facebook_pos_rand$Truth]))
prec_sentistrength_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$SentiStrength == facebook_neg_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$SentiStrength == facebook_neg_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$SentiStrength == facebook_neg_rand$Truth]))
prec_sentistrength_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$SentiStrength == twitter_pos_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$SentiStrength == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$SentiStrength == twitter_pos_rand$Truth]))
prec_sentistrength_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$SentiStrength == twitter_neg_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$SentiStrength == twitter_neg_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$SentiStrength == twitter_neg_rand$Truth]))

prec_socal_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$SoCal == facebook_pos_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$SoCal == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$SoCal == facebook_pos_rand$Truth]))
prec_socal_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$SoCal == facebook_neg_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$SoCal == facebook_neg_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$SoCal == facebook_neg_rand$Truth]))
prec_socal_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$SoCal == twitter_pos_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$SoCal == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$SoCal == twitter_pos_rand$Truth]))
prec_socal_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$SoCal == twitter_neg_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$SoCal == twitter_neg_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$SoCal == twitter_neg_rand$Truth]))

prec_umigon_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Umigon == facebook_pos_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Umigon == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Umigon == facebook_pos_rand$Truth]))
prec_umigon_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Umigon == facebook_neg_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Umigon == facebook_neg_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Umigon == facebook_neg_rand$Truth]))
prec_umigon_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Umigon == twitter_pos_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Umigon == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Umigon == twitter_pos_rand$Truth]))
prec_umigon_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Umigon == twitter_neg_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Umigon == twitter_neg_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Umigon == twitter_neg_rand$Truth]))

prec_vader_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Vader == facebook_pos_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Vader == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Vader == facebook_pos_rand$Truth]))
prec_vader_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Vader == facebook_neg_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Vader == facebook_neg_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Vader == facebook_neg_rand$Truth]))
prec_vader_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Vader == twitter_pos_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Vader == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Vader == twitter_pos_rand$Truth]))
prec_vader_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Vader == twitter_neg_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Vader == twitter_neg_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Vader == twitter_neg_rand$Truth]))

prec_braz_liwc_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_LIWC == facebook_pos_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_LIWC == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_LIWC == facebook_pos_rand$Truth]))
prec_braz_liwc_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_LIWC == facebook_neg_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_LIWC == facebook_neg_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_LIWC == facebook_neg_rand$Truth]))
prec_braz_liwc_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_LIWC == twitter_pos_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_LIWC == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_LIWC == twitter_pos_rand$Truth]))
prec_braz_liwc_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_LIWC == twitter_neg_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_LIWC == twitter_neg_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_LIWC == twitter_neg_rand$Truth]))

prec_braz_oplexicon_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_OpLexicon == facebook_pos_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_OpLexicon == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_OpLexicon == facebook_pos_rand$Truth]))
prec_braz_oplexicon_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_OpLexicon == facebook_neg_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_OpLexicon == facebook_neg_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_OpLexicon == facebook_neg_rand$Truth]))
prec_braz_oplexicon_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_OpLexicon == twitter_pos_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_OpLexicon == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_OpLexicon == twitter_pos_rand$Truth]))
prec_braz_oplexicon_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_OpLexicon == twitter_neg_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_OpLexicon == twitter_neg_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_OpLexicon == twitter_neg_rand$Truth]))

prec_braz_sentilex_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_SentiLex == facebook_pos_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_SentiLex == facebook_pos_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_SentiLex == facebook_pos_rand$Truth]))
prec_braz_sentilex_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_SentiLex == facebook_neg_rand$Truth]) / (length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_SentiLex == facebook_neg_rand$Truth]) + length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_SentiLex == facebook_neg_rand$Truth]))
prec_braz_sentilex_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_SentiLex == twitter_pos_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_SentiLex == twitter_pos_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_SentiLex == twitter_pos_rand$Truth]))
prec_braz_sentilex_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_SentiLex == twitter_neg_rand$Truth]) / (length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_SentiLex == twitter_neg_rand$Truth]) + length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_SentiLex == twitter_neg_rand$Truth]))


# Recall

rec_oplexicon_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$OpinionLexicon == facebook_pos_rand$Truth]) / length(facebook_pos_rand$IdComment)
rec_oplexicon_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$OpinionLexicon == facebook_neg_rand$Truth]) / length(facebook_neg_rand$IdComment)
rec_oplexicon_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$OpinionLexicon == twitter_pos_rand$Truth]) / length(twitter_pos_rand$IdComment)
rec_oplexicon_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$OpinionLexicon == twitter_neg_rand$Truth]) / length(twitter_neg_rand$IdComment)

rec_affin_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Afinn == facebook_pos_rand$Truth]) / length(facebook_pos_rand$IdComment)
rec_affin_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Afinn == facebook_neg_rand$Truth]) / length(facebook_neg_rand$IdComment)
rec_affin_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Afinn == twitter_pos_rand$Truth]) / length(twitter_pos_rand$IdComment)
rec_affin_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Afinn == twitter_neg_rand$Truth]) / length(twitter_neg_rand$IdComment)

rec_sentistrength_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$SentiStrength == facebook_pos_rand$Truth]) / length(facebook_pos_rand$IdComment)
rec_sentistrength_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$SentiStrength == facebook_neg_rand$Truth]) / length(facebook_neg_rand$IdComment)
rec_sentistrength_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$SentiStrength == twitter_pos_rand$Truth]) / length(twitter_pos_rand$IdComment)
rec_sentistrength_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$SentiStrength == twitter_neg_rand$Truth]) / length(twitter_neg_rand$IdComment)

rec_socal_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$SoCal == facebook_pos_rand$Truth]) / length(facebook_pos_rand$IdComment)
rec_socal_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$SoCal == facebook_neg_rand$Truth]) / length(facebook_neg_rand$IdComment)
rec_socal_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$SoCal == twitter_pos_rand$Truth]) / length(twitter_pos_rand$IdComment)
rec_socal_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$SoCal == twitter_neg_rand$Truth]) / length(twitter_neg_rand$IdComment)

rec_umigon_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Umigon == facebook_pos_rand$Truth]) / length(facebook_pos_rand$IdComment)
rec_umigon_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Umigon == facebook_neg_rand$Truth]) / length(facebook_neg_rand$IdComment)
rec_umigon_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Umigon == twitter_pos_rand$Truth]) / length(twitter_pos_rand$IdComment)
rec_umigon_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Umigon == twitter_neg_rand$Truth]) / length(twitter_neg_rand$IdComment)

rec_vader_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Vader == facebook_pos_rand$Truth]) / length(facebook_pos_rand$IdComment)
rec_vader_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Vader == facebook_neg_rand$Truth]) / length(facebook_neg_rand$IdComment)
rec_vader_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Vader == twitter_pos_rand$Truth]) / length(twitter_pos_rand$IdComment)
rec_vader_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Vader == twitter_neg_rand$Truth]) / length(twitter_neg_rand$IdComment)

rec_braz_liwc_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_LIWC == facebook_pos_rand$Truth]) / length(facebook_pos_rand$IdComment)
rec_braz_liwc_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_LIWC == facebook_neg_rand$Truth]) / length(facebook_neg_rand$IdComment)
rec_braz_liwc_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_LIWC == twitter_pos_rand$Truth]) / length(twitter_pos_rand$IdComment)
rec_braz_liwc_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_LIWC == twitter_neg_rand$Truth]) / length(twitter_neg_rand$IdComment)

rec_braz_oplexicon_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_OpLexicon == facebook_pos_rand$Truth]) / length(facebook_pos_rand$IdComment)
rec_braz_oplexicon_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_OpLexicon == facebook_neg_rand$Truth]) / length(facebook_neg_rand$IdComment)
rec_braz_oplexicon_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_OpLexicon == twitter_pos_rand$Truth]) / length(twitter_pos_rand$IdComment)
rec_braz_oplexicon_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_OpLexicon == twitter_neg_rand$Truth]) / length(twitter_neg_rand$IdComment)

rec_braz_sentilex_pos_facebook <- length(facebook_pos_rand$IdComment[facebook_pos_rand$Brazilian_SentiLex == facebook_pos_rand$Truth]) / length(facebook_pos_rand$IdComment)
rec_braz_sentilex_neg_facebook <- length(facebook_neg_rand$IdComment[facebook_neg_rand$Brazilian_SentiLex == facebook_neg_rand$Truth]) / length(facebook_neg_rand$IdComment)
rec_braz_sentilex_pos_twitter <- length(twitter_pos_rand$IdComment[twitter_pos_rand$Brazilian_SentiLex == twitter_pos_rand$Truth]) / length(twitter_pos_rand$IdComment)
rec_braz_sentilex_neg_twitter <- length(twitter_neg_rand$IdComment[twitter_neg_rand$Brazilian_SentiLex == twitter_neg_rand$Truth]) / length(twitter_neg_rand$IdComment)


# F1

f1_oplexicon_pos_facebook <- (2 * prec_oplexicon_pos_facebook * rec_oplexicon_pos_facebook) / (prec_oplexicon_pos_facebook + rec_oplexicon_pos_facebook)
f1_oplexicon_neg_facebook <- (2 * prec_oplexicon_neg_facebook * rec_oplexicon_neg_facebook) / (prec_oplexicon_neg_facebook + rec_oplexicon_neg_facebook)
f1_oplexicon_pos_twitter <- (2 * prec_oplexicon_pos_twitter * rec_oplexicon_pos_twitter) / (prec_oplexicon_pos_twitter + rec_oplexicon_pos_twitter)
f1_oplexicon_neg_twitter <- (2 * prec_oplexicon_neg_twitter * rec_oplexicon_neg_twitter) / (prec_oplexicon_neg_twitter + rec_oplexicon_neg_twitter)
  
f1_affin_pos_facebook <- (2 * prec_affin_pos_facebook * rec_affin_pos_facebook) / (prec_affin_pos_facebook + rec_affin_pos_facebook)
f1_affin_neg_facebook <- (2 * prec_affin_neg_facebook * rec_affin_neg_facebook) / (prec_affin_neg_facebook + rec_affin_neg_facebook)
f1_affin_pos_twitter <- (2 * prec_affin_pos_twitter * rec_affin_pos_twitter) / (prec_affin_pos_twitter + rec_affin_pos_twitter)
f1_affin_neg_twitter <- (2 * prec_affin_neg_twitter * rec_affin_neg_twitter) / (prec_affin_neg_twitter + rec_affin_neg_twitter)

f1_sentistrength_pos_facebook <- (2 * prec_sentistrength_pos_facebook * rec_sentistrength_pos_facebook) / (prec_sentistrength_pos_facebook + rec_sentistrength_pos_facebook)
f1_sentistrength_neg_facebook <- (2 * prec_sentistrength_neg_facebook * rec_sentistrength_neg_facebook) / (prec_sentistrength_neg_facebook + rec_sentistrength_neg_facebook)
f1_sentistrength_pos_twitter <- (2 * prec_sentistrength_pos_twitter * rec_sentistrength_pos_twitter) / (prec_sentistrength_pos_twitter + rec_sentistrength_pos_twitter)
f1_sentistrength_neg_twitter <- (2 * prec_sentistrength_neg_twitter * rec_sentistrength_neg_twitter) / (prec_sentistrength_neg_twitter + rec_sentistrength_neg_twitter)

f1_socal_pos_facebook <- (2 * prec_socal_pos_facebook * rec_socal_pos_facebook) / (prec_socal_pos_facebook + rec_socal_pos_facebook)
f1_socal_neg_facebook <- (2 * prec_socal_neg_facebook * rec_socal_neg_facebook) / (prec_socal_neg_facebook + rec_socal_neg_facebook)
f1_socal_pos_twitter <- (2 * prec_socal_pos_twitter * rec_socal_pos_twitter) / (prec_socal_pos_twitter + rec_socal_pos_twitter)
f1_socal_neg_twitter <- (2 * prec_socal_neg_twitter * rec_socal_neg_twitter) / (prec_socal_neg_twitter + rec_socal_neg_twitter)

f1_umigon_pos_facebook <- (2 * prec_umigon_pos_facebook * rec_umigon_pos_facebook) / (prec_umigon_pos_facebook + rec_umigon_pos_facebook)
f1_umigon_neg_facebook <- (2 * prec_umigon_neg_facebook * rec_umigon_neg_facebook) / (prec_umigon_neg_facebook + rec_umigon_neg_facebook)
f1_umigon_pos_twitter <- (2 * prec_umigon_pos_twitter * rec_umigon_pos_twitter) / (prec_umigon_pos_twitter + rec_umigon_pos_twitter)
f1_umigon_neg_twitter <- (2 * prec_umigon_neg_twitter * rec_umigon_neg_twitter) / (prec_umigon_neg_twitter + rec_umigon_neg_twitter)

f1_vader_pos_facebook <- (2 * prec_vader_pos_facebook * rec_vader_pos_facebook) / (prec_vader_pos_facebook + rec_vader_pos_facebook)
f1_vader_neg_facebook <- (2 * prec_vader_neg_facebook * rec_vader_neg_facebook) / (prec_vader_neg_facebook + rec_vader_neg_facebook)
f1_vader_pos_twitter <- (2 * prec_vader_pos_twitter * rec_vader_pos_twitter) / (prec_vader_pos_twitter + rec_vader_pos_twitter)
f1_vader_neg_twitter <- (2 * prec_vader_neg_twitter * rec_vader_neg_twitter) / (prec_vader_neg_twitter + rec_vader_neg_twitter)

f1_braz_liwc_pos_facebook <- (2 * prec_braz_liwc_pos_facebook * rec_braz_liwc_pos_facebook) / (prec_braz_liwc_pos_facebook + rec_braz_liwc_pos_facebook)
f1_braz_liwc_neg_facebook <- (2 * prec_braz_liwc_neg_facebook * rec_braz_liwc_neg_facebook) / (prec_braz_liwc_neg_facebook + rec_braz_liwc_neg_facebook)
f1_braz_liwc_pos_twitter <- (2 * prec_braz_liwc_pos_twitter * rec_braz_liwc_pos_twitter) / (prec_braz_liwc_pos_twitter + rec_braz_liwc_pos_twitter)
f1_braz_liwc_neg_twitter <- (2 * prec_braz_liwc_neg_twitter * rec_braz_liwc_neg_twitter) / (prec_braz_liwc_neg_twitter + rec_braz_liwc_neg_twitter)

f1_braz_oplexicon_pos_facebook <- (2 * prec_braz_oplexicon_pos_facebook * rec_braz_oplexicon_pos_facebook) / (prec_braz_oplexicon_pos_facebook + rec_braz_oplexicon_pos_facebook)
f1_braz_oplexicon_neg_facebook <- (2 * prec_braz_oplexicon_neg_facebook * rec_braz_oplexicon_neg_facebook) / (prec_braz_oplexicon_neg_facebook + rec_braz_oplexicon_neg_facebook)
f1_braz_oplexicon_pos_twitter <- (2 * prec_braz_oplexicon_pos_twitter * rec_braz_oplexicon_pos_twitter) / (prec_braz_oplexicon_pos_twitter + rec_braz_oplexicon_pos_twitter)
f1_braz_oplexicon_neg_twitter <- (2 * prec_braz_oplexicon_neg_twitter * rec_braz_oplexicon_neg_twitter) / (prec_braz_oplexicon_neg_twitter + rec_braz_oplexicon_neg_twitter)

f1_braz_sentilex_pos_facebook <- (2 * prec_braz_sentilex_pos_facebook * rec_braz_sentilex_pos_facebook) / (prec_braz_sentilex_pos_facebook + rec_braz_sentilex_pos_facebook)
f1_braz_sentilex_neg_facebook <- (2 * prec_braz_sentilex_neg_facebook * rec_braz_sentilex_neg_facebook) / (prec_braz_sentilex_neg_facebook + rec_braz_sentilex_neg_facebook)
f1_braz_sentilex_pos_twitter <- (2 * prec_braz_sentilex_pos_twitter * rec_braz_sentilex_pos_twitter) / (prec_braz_sentilex_pos_twitter + rec_braz_sentilex_pos_twitter)
f1_braz_sentilex_neg_twitter <- (2 * prec_braz_sentilex_neg_twitter * rec_braz_sentilex_neg_twitter) / (prec_braz_sentilex_neg_twitter + rec_braz_sentilex_neg_twitter)

# Macro F1

macro_f1_oplexicon_facebook <- (f1_oplexicon_pos_facebook + f1_oplexicon_neg_facebook) / 2
macro_f1_oplexicon_twitter <- (f1_oplexicon_pos_twitter + f1_oplexicon_neg_twitter) / 2

macro_f1_affin_facebook <- (f1_affin_pos_facebook + f1_affin_neg_facebook) / 2
macro_f1_affin_twitter <- (f1_affin_pos_twitter + f1_affin_neg_twitter) / 2

macro_f1_sentistrength_facebook <- (f1_sentistrength_pos_facebook + f1_sentistrength_neg_facebook) / 2
macro_f1_sentistrength_twitter <- (f1_sentistrength_pos_twitter + f1_sentistrength_neg_twitter) / 2

macro_f1_socal_facebook <- (f1_socal_pos_facebook + f1_socal_neg_facebook) / 2
macro_f1_socal_twitter <- (f1_socal_pos_twitter + f1_socal_neg_twitter) / 2

macro_f1_umigon_facebook <- (f1_umigon_pos_facebook + f1_umigon_neg_facebook) / 2
macro_f1_umigon_twitter <- (f1_umigon_pos_twitter + f1_umigon_neg_twitter) / 2

macro_f1_vader_facebook <- (f1_vader_pos_facebook + f1_vader_neg_facebook) / 2
macro_f1_vader_twitter <- (f1_vader_pos_twitter + f1_vader_neg_twitter) / 2

macro_f1_braz_liwc_facebook <- (f1_braz_liwc_pos_facebook + f1_braz_liwc_neg_facebook) / 2
macro_f1_braz_liwc_twitter <- (f1_braz_liwc_pos_twitter + f1_braz_liwc_neg_twitter) / 2

macro_f1_braz_oplexicon_facebook <- (f1_braz_oplexicon_pos_facebook + f1_braz_oplexicon_neg_facebook) / 2
macro_f1_braz_oplexicon_twitter <- (f1_braz_oplexicon_pos_twitter + f1_braz_oplexicon_neg_twitter) / 2

macro_f1_braz_sentilex_facebook <- (f1_braz_sentilex_pos_facebook + f1_braz_sentilex_neg_facebook) / 2
macro_f1_braz_sentilex_twitter <- (f1_braz_sentilex_pos_twitter + f1_braz_sentilex_neg_twitter) / 2


# Agreement

only_3_evaluators_pos_facebook <- facebook_pos_rand[facebook_pos_rand$Votes == 3, ]
only_3_evaluators_neg_facebook <- facebook_neg_rand[facebook_neg_rand$Votes == 3, ]
only_3_evaluators_pos_twitter <- twitter_pos_rand[twitter_pos_rand$Votes == 3, ]
only_3_evaluators_neg_twitter <- twitter_pos_rand[twitter_neg_rand$Votes == 3, ]

agreement_pos_facebook <- 0

for (i in 1:nrow(only_3_evaluators_pos_facebook)) {
  row_data <- only_3_evaluators_pos_facebook[i,]
  max_votes <- max(c(row_data$Positive, row_data$VeryPositive))
  agreement_pos_facebook <- agreement_pos_facebook + ((max_votes * 100) / 3)
}
agreement_pos_facebook <- agreement_pos_facebook / length(only_3_evaluators_pos_facebook$IdComment)


agreement_neg_facebook <- 0
for (i in 1:nrow(only_3_evaluators_neg_facebook)) {
  row_data <- only_3_evaluators_neg_facebook[i,]
  max_votes <- max(c(row_data$Negative, row_data$VeryNegative))
  agreement_neg_facebook <- agreement_neg_facebook + ((max_votes * 100) / 3)
}
agreement_neg_facebook <- agreement_neg_facebook / length(only_3_evaluators_neg_facebook$IdComment)


agreement_pos_twitter <- 0
for (i in 1:nrow(only_3_evaluators_pos_twitter)) {
  row_data <- only_3_evaluators_pos_twitter[i,]
  max_votes <- max(c(row_data$Positive, row_data$VeryPositive))
  agreement_pos_twitter <- agreement_pos_twitter + ((max_votes * 100) / 3)
}
agreement_pos_twitter <- agreement_pos_twitter / length(only_3_evaluators_pos_twitter$IdComment)


agreement_neg_twitter <- 0
for (i in 1:nrow(only_3_evaluators_neg_twitter)) {
  row_data <- only_3_evaluators_neg_twitter[i,]
  max_votes <- max(c(row_data$Negative, row_data$VeryNegative))
  agreement_neg_twitter <- agreement_neg_twitter + ((max_votes * 100) / 3)
}
agreement_neg_twitter <- agreement_pos_twitter / length(only_3_evaluators_pos_twitter$IdComment)

# Number of evaluations with 100% confidence
conf_100_pos_facebook <- (length(only_3_evaluators_pos_facebook$IdComment[only_3_evaluators_pos_facebook$Positive == 3]) + length(only_3_evaluators_pos_facebook$IdComment[only_3_evaluators_pos_facebook$VeryPositive == 3]))
conf_100_neg_facebook <- (length(only_3_evaluators_neg_facebook$IdComment[only_3_evaluators_neg_facebook$Negative == 3]) + length(only_3_evaluators_neg_facebook$IdComment[only_3_evaluators_neg_facebook$VeryNegative == 3]))
conf_100_pos_twitter <- (length(only_3_evaluators_pos_twitter$IdComment[only_3_evaluators_pos_twitter$Positive == 3]) + length(only_3_evaluators_pos_twitter$IdComment[only_3_evaluators_pos_twitter$VeryPositive == 3]))
conf_100_neg_twitter <- (length(only_3_evaluators_neg_twitter$IdComment[only_3_evaluators_neg_twitter$Negative == 3]) + length(only_3_evaluators_neg_twitter$IdComment[only_3_evaluators_neg_twitter$VeryNegative == 3]))
