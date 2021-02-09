# MIIC Class
# First session: loading the file and learning the ropes 



```{r, misc functions}
## R Documentation-------
#Learn to make the most of R built-in help functions:
#   ?install.packages()
#  ?write

#Nice post for beginners :<https://aosmith.rbind.io/2020/04/28/r-documentation/>

## CRAN documentation 
#https://cran.r-project.org/
#<https://cran.r-project.org/web/packages/quanteda/index.html>

# to use the {quanteda} package
library(quanteda)
?textstat_lexdiv

# To open my dataset called "data1.csv"
#install.packages("readr")
library(readr)
data1 <- read_csv("data1.csv")


# objet = fonction() 
# objet <- fonction() 


# to know what the object txt is   
class(data1)
str(data1)    

# [row,column] R & C 
content <- data1[,7]
content_line1to4 <- data1[1:4,7] 
content_line1to4_bis <- data1[c(1:4),7] 
content_line1to4_ter <- data1[c(1,2,3,4),7] 

## vignettes
install.packages("quanteda")
library(quanteda)
browseVignettes("quanteda")

?ntoken
txt <- c(text1 = "This is a sentence, this.", text2 = "A word. Repeated repeated.")
ntoken(txt)

mycorpus <- corpus(data1$`Conteu (en)`)
mydfm <- dfm(mycorpus)
ntok <- ntoken(mydfm)
data1$ntoken_en <- ntoken(dfm(corpus(data1$`Conteu (en)`)))


## exploring help
ls("package:quanteda")
help(package = "quanteda")

library(quanteda)


## more elaborate papers (R Journal)

# blogs <https://www.r-bloggers.com/>

# quanteda webpage
```


```{r}
class(data$text)
```


class(data1)


***
## Documents : 
```{r, data formats : class()}
library(quanteda)
#dfm Create a document-feature matrix
mycorpus <- corpus(data$text)
summary(mycorpus)
class(mycorpus)
my_dfm <- dfm(mycorpus, remove = stopwords("english"), remove_punct = TRUE)
my_dfm
class(my_dfm)

#<https://www.youtube.com/watch?v=vZ63ndKIYMo&utm_source=Iterable&utm_medium=email&utm_campaign=pqa-engagement&utm_content=newuser-email02>
```

***
## 4. input / output / process ---------
###load data
###subsetting

```{r, comparing subsets}
# getting the number of tokens in {quanteda}
library(sentimentr)
library(quanteda)
library(syuzhet)
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
#mean()
#sd()

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
# https://vita.had.co.nz/papers/density-estimation.pdf

# text mining: sentiment analysis (1)
#http://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm
# NRC http://www.purl.org/net/NRCemotionlexicon
#https://cran.r-project.org/web/packages/syuzhet/vignettes/syuzhet-vignette.html

### sentenceID 
#overall scores over all the texts of the webpage (sentence per sentence)
data$text <- data$`Conteu (en)`
s_v <- get_sentences(data$text)
#s_v <- get_sentences(my_example_text)
nrc_data <- get_nrc_sentiment(s_v)
```

