Thu


# REVISIONS susetting ordered data 
# top10 -------
# top ou flop?
ordered_bouncing <- arrange(data, desc(`Taux de rebond (%)`))
top10_bouncing <- head(ordered_bouncing,10)

ordered_time <- arrange(data, desc(data$`Temps moyen passé sur la page (s)`))
max <- head(ordered_time,1)
print(max$Page)
flop <-tail(ordered_time,1)
print(flop$Page)
flop5 <-tail(ordered_time,5) 

# BARCHARTS ------
# Dashboard
library(ggplot2)
ggplot(data=counts, aes(x=Google_Rank, y=Nb_Visits, fill=page)) + 
  geom_bar(position = 'dodge', stat = "identity") +
  geom_text(aes(label=Nb_Visits), position=position_dodge(width=0.9), vjust=-0.25)



# DATA MINING
library(quanteda)
# more at <https://quanteda.io/>
mycorpus <- corpus(data$`Conteu (en)`)
mycorpus <- corpus(data)
summary(mycorpus)

# stopwrods 
my_dfm <- dfm(mycorpus, remove = stopwords("english"), remove_punct = TRUE)
my_dfm

#Q For French data ?

#wordcloud
set.seed(100)
textplot_wordcloud(my_dfm, min_count = 6, random_order = FALSE,
                   rotation = .25, 
                   colors = RColorBrewer::brewer.pal(8,"Dark2"))

# granularity ??


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

data$Flesh <- scores$Flesch
textstat_readability(txt, measure = c("FOG", "FOG.PSK", "FOG.NRI"))
textstat_readability(data_corpus_inaugural[48:58],
                     measure = c("Flesch.Kincaid", "Dale.Chall.old"))

#CORRELATION
loading a file
data$Flesh <- as.numeric(data$Flesh)
as.numeric(dataset3[[1]])
#plot(Y~X)
plot(data$Flesh~data$`Temps moyen passé sur la page (s)`, data=data)
plot(data$nbtoken_en~data$`Temps moyen passé sur la page (s)`, data=data)



# INTERACTION AND MODELS
# linear moels : http://rug.mnhn.fr/semin-r/PDF/semin-R_lm_SBallesteros_110308.pdf
lm(dependent variable  ~ explanatory variable)
lm(variable à expliquer ~ variable(s) explicative(s))
#model<-lm(TxDDT~Age, data = brochets)
model <- lm(data$nbtoken_en~data$`Temps moyen passé sur la page (s)`)
model
plot(model)
summary.lm(model)
plot(rediduals)


## Foor for thought
# reading time and complexity (Flesch) ?
# reading time and number of tokens ?
# number of visitors and number of tokens?
# number of reading t

## RQ: sentiment scores and number of tokens 


