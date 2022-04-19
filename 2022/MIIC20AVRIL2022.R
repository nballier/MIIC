# MICC SCRIPT FOR PARETO CHART AND WORDCLOUD


# open my dataset selecting my file with file.choose()
data1 <- read.csv(file.choose())

# inspect my data
str(data1)
summary(data1)


# ARCHIVES POUR LES WORDCLOUDS:

# WORDCLOUDS WITHOUT QUANTEDA - For English data
# adapted from https://towardsdatascience.com/create-a-word-cloud-with-r-bde3e7422e8a

install.packages("tm")
library(tm)
text <- data1$Conteu..en.
docs <- Corpus(VectorSource(text))
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("english"))

dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

library(wordcloud)
set.seed(1234) # for reproducibility 
wordcloud(words = df$word, freq = df$freq, min.freq = 1, max.words=200, random.order=FALSE, rot.per=0.35, colors=brewer.pal(8, "Dark2"))


# WORDCLOUDS WITHOUT QUANTEDA - For French data
# adapted from https://towardsdatascience.com/create-a-word-cloud-with-r-bde3e7422e8a

# install a text mining package , as the wordcloud() functions requires a certain format 
install.packages("tm")
library(tm)
text.f <- data1$Contenu
docs.f <- Corpus(VectorSource(text.f))
docs.f <- tm_map(docs.f, content_transformer(tolower))  # get rid of capitals
docs.f <- tm_map(docs.f, removeWords, stopwords("french"))  # get rid of very frequent words 


# prepare the data by counting tokens per documents
dtm.f <- TermDocumentMatrix(docs.f) 
matrix.f <- as.matrix(dtm.f) 
words.f <- sort(rowSums(matrix.f),decreasing=TRUE)   # sorts in decreasing order
df.f <- data.frame(word = names(words.f),freq=words.f) # builds the data frame for the analysis

# visualise the wordcloud
library(wordcloud)
set.seed(1234) # for reproducibility 
wordcloud(words = df.f$word, freq = df.f$freq, min.freq = 1, max.words=200, random.order=FALSE, rot.per=0.35, colors=brewer.pal(8, "Dark2"))   


# rescale the vertical axis for the Pareto chart
install.packages("qcc")
library(qcc)
#help(pareto.chart) 
#pareto.chart(..., ylim=c(0,4500))


pareto.chart(data1$Nombre.de.visites , xlab = "pages", las=1, ylab = "Number of visits", main="Pareto Chart of Number of visits ", ylim=c(0,4500))
# 
pareto.chart(data1$Nombre.de.visites , xlab = "pages", las=1, ylab = "Number of visits", main="Pareto Chart of Number of visits ", ylim=c(0,max(data1$Nombre.de.visites)))


