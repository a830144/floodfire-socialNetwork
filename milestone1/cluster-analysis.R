setwd("D:\\");
df<-read.csv("D:\\fifa19clean.csv")
df1<-df[55:86];
kmeans.result <- kmeans(df1, 10)
print(kmeans.result)

table(df$Nationality, kmeans.result$cluster)


str(df1)