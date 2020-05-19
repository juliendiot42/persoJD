# soucre: https://towardsdatascience.com/create-a-word-cloud-with-r-bde3e7422e8a

library(wordcloud)
library(RColorBrewer)
library(wordcloud2)

library(tm)
library(magrittr)

# import text and create corpus
text <- readLines("slidesBayesianNetworks.Rmd")
text <- paste(text, collapse = "\t")


# clean text
text <- gsub("https\\S*", "", text)
text <- gsub("@\\S*", "", text)
text <- gsub("amp", "", text)
text <- gsub("[\r\n]", "", text)
text <- gsub("[[:punct:]]", " ", text)
# text <- gsub("bayesian network", "Bayesian-Networks", text)
# text <- gsub("bayesian networks", "Bayesian-Networks", text)
# text <- gsub("Bayesian network", "Bayesian-Networks", text)
# text <- gsub("Bayesian networks", "Bayesian-Networks", text)
# text <- gsub("Bayesian Network", "Bayesian-Networks", text)
# text <- gsub("Bayesian Networks", "Bayesian-Networks", text)

docs <- Corpus(VectorSource(text))

docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(stripWhitespace)
# docs <- tm_map(docs, removePunctuation) %>%
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs,removeWords,
               c(stopwords("english"),
                 "footnote",
                 "class",
                 "pull",
                 "begin",
                 "top",
                 "mathcal",
                 "png",
                 "img",
                 "align",
                 "left",
                 "src",
                 "frac",
                 "sum")
)

content(docs)

# create document-term-matrix
dtm <- TermDocumentMatrix(docs)
matrix <- as.matrix(dtm)
words <- sort(rowSums(matrix),decreasing = TRUE)
df <- data.frame(word = names(words),freq = words)



# create cloud
set.seed(1234) # for reproducibility

(wc <- wordcloud(
  words = df$word,
  freq = df$freq,
  min.freq = 1,
  max.words = 50,
  random.order = FALSE,
  rot.per = 0.35,
  colors = c("#4C4B4C","#AAA59F","#f9be00","#ecd977","#187fc3")
  # colors = brewer.pal(8, "Accent")
))

wordcloud2(
  data = df,
  size = 1,
  color = c("#4C4B4C", "#AAA59F", "#f9be00", "#ecd977", "#187fc3")
)

set.seed(1234)
(wc <-
    wordcloud2(
      data = df,
      size = 0.7,
      shape = 'pentagon',
      color = c("#187fc3", "#f9be00", "#74b9e7", "#f9be00")
    ))
