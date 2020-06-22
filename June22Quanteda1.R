---
title: "Help with R"
author: "Nicolas Ballier"
date: "4/30/2020"
output: html_document
---

# to erase all objects
rm(list=ls())

# where am I? ## to know where your files are saved
getwd()

## set this directory as working directory
setwd("~/Desktop/MIIC/data-GoogleAnalytics/bis")


# to install the package called {quanteda}
install.packages("quanteda")

install.packages("tidyverse")


## R Documentation-------
Learn to make the most of R built-in help functions:
?install.packages()
?write
??write

# create a 2 by 5 matrix
x <- matrix(1:10, ncol = 5)

fil <- tempfile("data")
# the file data contains x, two rows, five cols
# 1 3 5 7 9 will form the first row
write(t(x), fil)
if(interactive()) file.show(fil)
unlink(fil) # tidy up

# Writing to the "console" 'tab-delimited'
# two rows, five cols but the first row is 1 2 3 4 5
write(x, "", sep = "\t")

Nice post for beginners :<https://aosmith.rbind.io/2020/04/28/r-documentation/>

## CRAN documentation 
https://cran.r-project.org/
<https://cran.r-project.org/web/packages/quanteda/index.html>

# to use the {quanteda} package
library(quanteda)
?textstat_lexdiv


# To open my dataset called "data1.csv"
install.packages("readr")
library(readr)
data1 <- read_csv("data1.csv")


# objet = fonction() 
# objet <- fonction() 

txt <- c("Anyway, like I was sayin', shrimp is the fruit of the sea. You can
              barbecue it, boil it, broil it, bake it, saute it.",
             "There's shrimp-kabobs,
              shrimp creole, shrimp gumbo. Pan fried, deep fried, stir-fried. There's
              pineapple shrimp, lemon shrimp, coconut shrimp, pepper shrimp, shrimp soup,
              shrimp stew, shrimp salad, shrimp and potatoes, shrimp burger, shrimp
              sandwich.")

# to know what the object txt is   
class(txt)              
tokens(txt) %>%
      textstat_lexdiv(measure = c("TTR", "CTTR", "K"))

class(data1)
str(data1)    

# [row,column] R & C 
content <- data1[,7]
content_line1to4 <- data1[1:4,7] 
content_line1to4_bis <- data1[c(1:4),7] 
content_line1to4_ter <- data1[c(1,2,3,4),7] 

## vignettes
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
data()

## more elaborate papers (R Journal)

# blogs
<https://www.r-bloggers.com/>

# quanteda


# simple example
    txt <- c(text1 = "This is a sentence, this.", text2 = "A word. Repeated repeated.")
    ntoken(txt)
    ntype(txt)
    ntoken(char_tolower(txt))  # same
    ntype(char_tolower(txt))   # fewer types
    ntoken(char_tolower(txt), remove_punct = TRUE)
    ntype(char_tolower(txt), remove_punct = TRUE)
    # with some real texts
    ntoken(corpus_subset(data_corpus_inaugural, Year < 1806), remove_punct = TRUE)
ntype(corpus_subset(data_corpus_inaugural, Year < 1806), remove_punct = TRUE)
ntoken(dfm(corpus_subset(data_corpus_inaugural, Year < 1800)))
ntype(dfm(corpus_subset(data_corpus_inaugural, Year < 1800)))


#dfm Create a document-feature matrix
mycorpus <- corpus(data$`Conteu (en)`)
mycorpus <- corpus(data)
summary(mycorpus)
my_dfm <- dfm(mycorpus, remove = stopwords("english"), remove_punct = TRUE)
my_dfm






## STACK OVERFLOW
Get an answer

Asking a clear, detailed question makes it more likely you will get an answer.

Read on for the 3 easy steps.
alt_text
Step 1 - Explain your problem

Yes, skip writing the title for now. In the body, describe what you were trying to do. Describe what results you expected to see and what results you actually saw. Include any error messages you received.
Step 2 - Provide more details and “Show me your code”

Tell us what you’ve tried and tell us what you found (on this site or elsewhere) when you did your own research and why the solution(s) didn’t meet your needs. Include enough of your actual code so people can run it themselves, identify the problem, and provide you a solution (in other words, “Show me your code”).

The more information you can put in the question, the more likely you will be to get an answer.
Step 3 - Write a title that summarizes the problem

Now that you’ve summarized your problem and everything you’ve tried, it should be easier to write a title for your question. People scan titles to figure out which ones they want to answer.

Make your question more likely to get answered by using these best practices for titles:

    Make it a question. An easy way to make sure it reads like a question is to start your title with “what”, “where”, “when”, “why” or “how.”
    Include the action you want. Are you looking for a “fix”, are you looking to “prevent” something from happening, are you looking to “compare”, do you want to “access” something. If you aren’t sure about the action, look at what you wrote about the results you wanted from your code.
    Look at your title. If someone else read the title, would they know what you needed help with? If not, think about if you were asking someone sitting next to you for help - what would you tell them you needed help with?


<https://www.youtube.com/watch?v=vZ63ndKIYMo&utm_source=Iterable&utm_medium=email&utm_campaign=pqa-engagement&utm_content=newuser-email02>


