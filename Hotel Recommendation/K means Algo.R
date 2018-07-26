hotel_metadata <- read.csv("D:/R - research/Hotel Recommendation/subsetHotel_Arena.csv")

View(hotel_metadata)
str(hotel_metadata)
nrow(hotel_metadata)


#preprocess data to avoid null values

hotel_metadata <- na.omit(hotel_metadata)
summary(hotel_metadata)

#apply Kmeans
set.seed(20)
clusters <- kmeans(hotel_metadata,3)

# Save the cluster number in the dataset as column 'Category'
hotel_metadata$Category <- as.factor(clusters$cluster)

# Inspect 'clusters'
str(clusters)
library(ggplot2)
#You can plot the graph and cluster centroid using the following command.
plot(hotel_metadata, col =(clusters$cluster +1) , pch=1, cex=1, las=1)

ggplot(hotel_metadata, aes(Diff_pos_neg,Reviewer_Score, color = Category)) + geom_point()

#export the data

str(hotel_metadata)

write.csv(hotel_metadata,"D:/R - research/Hotel Recommendation/hotel_arena_label.csv", quote = FALSE, row.names = TRUE)