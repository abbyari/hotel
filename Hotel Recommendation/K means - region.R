hotel_metadata <- read.csv("D:/R - research/Hotel Recommendation/region.csv")

View(hotel_metadata)
str(hotel_metadata)
nrow(hotel_metadata)


#preprocess data to avoid null values

hotel_metadata <- na.omit(hotel_metadata)
summary(hotel_metadata)


#Elbow Method for finding the optimal number of clusters
set.seed(123)
# Compute and plot wss for k = 2 to k = 15.
k.max <- 15
data <- hotel_metadata
wss <- sapply(1:k.max, 
              function(k){kmeans(data, k, nstart=50,iter.max = 15 )$tot.withinss})
wss
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")



# we can consider k=5

#apply Kmeans
set.seed(20)
clusters <- kmeans(hotel_metadata,5)

# Save the cluster number in the dataset as column 'Category'
hotel_metadata$Category <- as.factor(clusters$cluster)

# Inspect 'clusters'
str(clusters)
library(ggplot2)
#You can plot the graph and cluster centroid using the following command.
plot(hotel_metadata, col =(clusters$cluster +1) , pch=1, cex=1, las=1)

ggplot(hotel_metadata, aes(lat,lng, color = Category)) + geom_point()


#let's consider k=4

#apply Kmeans
set.seed(20)
clusters <- kmeans(hotel_metadata,4)

# Save the cluster number in the dataset as column 'Category'
hotel_metadata$Category <- as.factor(clusters$cluster)

# Inspect 'clusters'
str(clusters)
library(ggplot2)
#You can plot the graph and cluster centroid using the following command.
plot(hotel_metadata, col =(clusters$cluster +1) , pch=1, cex=1, las=1)

ggplot(hotel_metadata, aes(lat,lng, color = Category)) + geom_point()


#export the data

str(hotel_metadata)

write.csv(hotel_metadata,"D:/R - research/Hotel Recommendation/hotel_region.csv", quote = FALSE, row.names = TRUE)