# Załadowanie bibliotek
library(tm)


# zmiana katologu roboczego 
workDir <- "D:\\KT\\TextMining"
setwd(workDir)

# definicja katalogow funkcjonalnych 
inputDir <- ".\\data"
outputDir <- ".\\results"
scriptsDir <- ".\\scripts"
workspacesDir <- ".\\workspaces"
dir.create(outputDir, showWarnings = FALSE)
dir.create(workspacesDir, showWarnings = TRUE)


# utworzenie korpusu dokumentów
corpusDir <- paste(
  inputDir, 
  "Literatura - streszczenia - oryginał",
  sep = "\\"
  )

corpus <- VCorpus(
  DirSource(
    corpusDir,
    pattern = "*.txt",
    encoding = "utf-8",
  ),
  readerControl = list(
    language = "pl_PL"
  )
)

# wstępne przetwarzanie
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, content_transformer(tolower))
stopListFile <- paste(
  inputDir, 
  "stopwords_pl.txt",
  sep = "\\"
)
stopList <- readLines(stopListFile, encoding = "utf-8")

corpus <- tm_map(corpus, removeWords, stopList)
corpus <- tm_map

# wyświetlenie zawartości korpusu
writeLines(as.character(corpus[[1]]))
writeLines(corpus[[1]]$content)






