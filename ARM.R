library("arules")
library("arulesViz")

df <- read.csv("house-votes-84.data")

senate <- as(df, "transactions")

itemFrequencyPlot(senate,topN=20,type="absolute")

rules <- apriori(senate, parameter = list(support = 0.1, confidence = 0.6))

top10<-head(rules, n=10, by= "confidence")
inspect(top10)

rulesDemocrat <- subset(rules, subset = rhs %in% "party=democrat" & lift > 1.2)
rulesRepublican <- subset(rules, subset = rhs %in% "party=republican" & lift > 1.2)

inspect(head(rulesDemocrat, n=5, by="confidence"))
inspect(head(rulesRepublican, n=5, by="confidence"))

plot(head(rulesDemocrat, n=5, by = "confidence"),method="graph",interactive=TRUE,shading=NA)
