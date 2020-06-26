# FIABILISATION DES DONNEES
# NORMALISATION 
###token-based sentiment scores and data size : take into account 
edito$ntype_en 

# NA 
omit.na(data)
##imputation of missing data

# DATA WRANGLING  / DATA CLEANING------- 
#Eliminate pages with no visitors
PagesWithNoVisitors <- data[data$`Nombre de visites` == "0",]
NoZeroData <- data[data$`Nombre de visites` != "0",]

#subset
data_above20visits <- data[which(data$NbVisits <= 20),]


#DATA MODELLING: A VERY BASIC INTRODUCTION-------
-----------------
#Exploratory analysis- display interaction between variables 

splom(~datanum, groups = TypesText , data = datanum,
      panel = panel.superpose,
      key = list(title = "Varieties of Features for text types",
                 columns = 12, 
                 points = list(pch = super.sym$pch[1:2],
                 col = super.sym$col[1:2]),
                 ylab="colnames(datanum)",
                 text = list(c("Editorial", "Transactionnel"))))

# linear models ?
 	lm(dependent variable  ~ explanatory variable)
	lm(variable à expliquer ~ variable(s) explicative(s))
	model<-lm(TxDDT~Age, data = brochets)
	model
	plot(model)
	summary.lm(model)

	
# HYPOTHESIS TESTING ----------- 
all the parameters we did not discuss
- size effect 
- hypothesis testing 
Are editorial pages really different from transactional pages ?  
- power of the test 

# hypothesis testing -----
edito vs. transac
  
# functions for correlations 
corrplot()

# DESCRIPTIVE STATS : -------------
sd(data$"Nombre de visites") # écart-type
mean(data$"Nombre de visites") # moyenne
summary(data$"Nombre de visites") # répartition par quartiles
summary(data)

# ASSIGNMENT  misc graphic tricks---
# to display plots side by side
#Splits the screen into 1 row and  2 columns =  (1,2)
par(mfrow=c(1,2))
plot(sort(edito$`Nombre de visites`,decreasing=TRUE), ylab ="Number of Visits", xlab= "webpages",main="Editorial Pages")
plot(sort(transac$`Nombre de visites`,decreasing=TRUE), ylab ="Number of Visits", xlab= "webpages",main="Transactional Pages")

# kills the split
dev.off()


# Superimpose 2 density plots
#install.packages(reshape2)
library(ggplot2)
library(reshape2)
fordensities <- as.data.frame(cbind(data$`Nombre de visites`,data$`Temps moyen passé sur la page (s)`))
dataplot<- melt(fordensities)
ggplot(dataplot,aes(x=value, fill=variable)) + geom_density(alpha=0.25)

# superimpose the barplots 
ggplot(dataplot,aes(x=value, fill=variable)) + geom_histogram(alpha=0.25)

# compare boxplots 
ggplot(dataplot,aes(x=variable, y=value, fill=variable)) + geom_boxplot()


plot(density(data$`Nombre de visites`))
dataplot <- melt(data.frame(density(data$`Nombre de visites`),density(data$`Temps moyen passé sur la page (s)`),density(data$`Nombre de visites`)))
ggplot(dataplot,aes(x=value, fill=variable)) + geom_density(alpha=0.25)
class(data$`Nombre de visites`)
data <- data2  
  

# A MINUTE TO UNDERSTAND, A LIFETIME TO MASTER------------
# Learning R 
# "learning curve": a meme, not a myth !
https://www.reddit.com/r/linuxmemes/comments/erfj2o/learning_curve_for_a_game_but_also_for_linux/
https://twitter.com/rogierk/status/730863729420701697
https://twitter.com/leahawasser/status/890604301508157441

{quanteda} : 4 functions / 130 pages
Sentiment Analysis : at least for 4 more active R packages for Sentana...
{meanr}
{sentimentr} # https://github.com/trinker/sentimentr
# <https://medium.com/@ODSC/an-introduction-to-sentence-level-sentiment-analysis-with-sentimentr-ac556bd7f75a>
# <https://www.lexalytics.com/technology/sentiment-analysis>      
<https://www.r-bloggers.com/sentiment-analysis-in-r-with-sentimentr-that-handles-negation-valence-shifters/>
<https://www.lexalytics.com/technology/sentiment-analysis>


# OTHER data mining approaches: -------
KEYNESS
https://tutorials.quanteda.io/statistical-analysis/keyness/
(association scores) : (mutual information)

# MORE HARDCORE DATA MINING--------------
- topicmodels  library(topicmodels)
https://www.tidytextmining.com/topicmodeling.html
- LDA (Latent Dirichlet allocation)
https://www.tidytextmining.com/topicmodeling.html#latent-dirichlet-allocation
- more on n-gram analysis:
https://www.tidytextmining.com/ngrams.html


# Machine learning and sentiment analysis
- the Emolex (nrc) model
Alternative models {tidytext} package
https://www.tidytextmining.com/sentiment.html
Three general-purpose lexicons are
- AFINN from Finn Årup Nielsen,
- bing from Bing Liu and collaborators
Hu, M., & Liu, B. (2004). Mining opinion features in customer reviews. National Conference on Artificial Intelligence.
- nrc from Saif Mohammad and Peter Turney.
- Package ‘meanr’

# Nouvelles frontières de l'économie connectée: Some NLP contributions--------
Semantic web
ontologies
Word embeddings
Word2Vec: Slide 22: https://www.slideshare.net/hen_drik/word2vec-from-theory-to-practice
Neural networks (DeepL, Linguee)	 
chatbot Siri/Alexa/ Amazon echo

# MACHINE LEARNING 
https://uc-r.github.io/kmeans_clustering

# DATA --------
DATA modeling life cycle
<http://evolved-analytics.com/?q=support/learning/modeling/modelLifeCycle>

Data life cycle:
<https://medium.com/jagoanhosting/what-is-data-lifecycle-management-and-what-phases-would-it-pass-through-94dbd207ff54>

The life cycle : Data sciences
https://www.datasciencecentral.com/profiles/blogs/the-lifecycle-of-data

# Microsoft / Azure
https://docs.microsoft.com/en-us/azure/machine-learning/team-data-science-process/lifecycle-modeling

# SCALING (making money with Data )-------
- RStudio / Rserver 
- Amazon (Amazon Turk), AWS
- Azure (Microsoft)
- google clould perform : 
https://console.cloud.google.com/
- Watson (IBM cloud) : https://pypi.org/project/watson-developer-cloud/#running-in-ibm-cloud
python library : watson-developer-cloud 2.10.1 

# STATS 101
http://eric.univ-lyon2.fr/~ricco/cours/

# LEARNING-BY-DOING PARADIGM
- data cleaning
colnames(data)
data$time <-  
- data wrangling 

# WHAT'S DIFFERENT FROM THE REAL WORLD ?
- size (scalability)
- computing resources
- pre-requisites in maths  

# What's in for me? Take home message??
- row, column : tabular data
- tidy data {tidyverse}
- coding (navigating StackOverflow)
- data visualisation
- data wrangling
 
