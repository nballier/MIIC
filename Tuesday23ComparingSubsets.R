
## Tuesday23  : comparing subsets

#REVISION:---------

# loading a dataset

# installing the package {syuzhet}

# getting info about get_nrc_sentiment()

# getting info about my dataset


# getting the number of tokens in {quanteda}
mycorpus <- corpus(data1$`Conteu (en)`)
mydfm <- dfm(mycorpus)
ntok <- ntoken(mydfm)
data1$ntoken_en <- ntoken(dfm(corpus(data1$`Conteu (en)`)))


# subsetting data --------
table(data$`Type de page`)

# subset 
edito <- data[data$`Type de page`=="Editorial",] 
# TASK subset for transactional pages


# basic plots ---------

boxplot(data$`Temps moyen passé sur la page (s)`)

#TASK boxplot for othe numerical variables 

# basic descriptive stats--------

mean(data$`Temps moyen passé sur la page (s)`)

# TASK :  means and sd() for other subsets and variables
mean()
sd()

# density
require(graphics)
kde <- density(data$`Temps moyen passé sur la page (s)`)
# plot
plot(density(data$`Temps moyen passé sur la page (s)`))  
# what just changed?
plot(density(data$`Temps moyen passé sur la page (s)`),main="Density estimation on duration (s) for the whole dataset")  

# skewed distribution ??
# Gaussian distribution

#TASK : what about editorial vs. transactional pages?? 


### more about density estimation
https://vita.had.co.nz/papers/density-estimation.pdf

# text mining: sentiment analysis (1)
http://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm
# NRC http://www.purl.org/net/NRCemotionlexicon
https://cran.r-project.org/web/packages/syuzhet/vignettes/syuzhet-vignette.html

### sentenceID 
#overall scores over all the texts of the webpage (sentence per sentence)
s_v <- get_sentences(data$text)
s_v <- get_sentences(my_example_text)
nrc_data <- get_nrc_sentiment(s_v)

# TASK :  plot the sentiments of the 10 most/less popular pages
data$`Temps moyen passé sur la page (s)`

# sentiments  of the 10 best pages ?
data$text <- data$`Conteu (en)`

library(dplyr)
#select 10 best
top10 <- data %>% 
arrange(desc(`Temps moyen passé sur la page (s)`))

# extractg all the sentences of the dataset
s_v <- get_sentences(top10$text)
# get all sentiment scores
## be patient
# list score per line 
nrc_data <- get_nrc_sentiment(s_v)

sum_nrctop10 <- apply(nrc_data,2,sum)
sentiments <- colnames(nrc_data)
# plot the different 
barplot(sum_nrctop10,xlab=sentiments)

# TASK: compare sentiments for best editorial pages and best  
table(data$`Type de page`)

# TEXT MINING : wordclouds and readbility metrics ------

library(quanteda)
# more at <https://quanteda.io/>
mycorpus <- corpus(data$`Conteu (en)`)
mycorpus <- corpus(data)
summary(mycorpus)

# stopwords 
my_dfm <- dfm(mycorpus, remove = stopwords("english"), remove_punct = TRUE)
my_dfm

#wordcloud
set.seed(100)
textplot_wordcloud(my_dfm, min_count = 6, random_order = FALSE,
                   rotation = .25, 
                   colors = RColorBrewer::brewer.pal(8,"Dark2"))

# lexical diversity
stat_lexdiv <- textstat_lexdiv(my_dfm)
head(stat_lexdiv, 5)
tail(stat_lexdiv, 5)

# readability 
textstat_readability(mycorpus,measure = "Flesch", remove_hyphens = TRUE,min_sentence_length = 1,
  max_sentence_length = 10000,intermediate = FALSE)
scores <- textstat_readability(mycorpus,measure = "Flesch", remove_hyphens = TRUE,min_sentence_length = 1,  max_sentence_length = 10000,intermediate = FALSE)


# TBC : stats 
Wed : more on operationalisating a research question
- "modelling"
- interaction between variables
- hypothesis testing 




