 
#	Import the Bollywood data set in Rstudio in a variable named bollywood

  bollywood <- read.csv("C:/Users/212488767/Desktop/Data Science training/IIITB/Intermediate R/bollywood.csv")
  View(bollywood)


#	When you import a data set, R stores character vectors as factors (by default)
# You can check the structure of the data frame by using str()
  str(bollywood)

# You can change the attribute 'Movie' from factor to character type using the given command
  bollywood$Movie <- as.character(bollywood$Movie)
	str(bollywood)

#Q1.
#	Access the last 10 movies (from the bottom of the Bollywood data frame) using column bollywood$Movie
# Store the names of those movies in last_10 vector (in the same order)
last_10<- tail(bollywood$Movie, n = 10)
#last_10 <- bollywood[30:50,'Movie'] EXTRACTS rows from dataset

last_10
	 
	  
#Q2.
#	Find out the total number of  missing values (NA) in the bollywood data frame.
# Store the result in na_bollywood vector
     
	na_bollywood <- sum(is.na(bollywood))
	na_bollywood 
	#colSums(is.na(bollywood)) - shows column wise NA
	
#Q3
#	Write the command to find out which movie tops the list in terms of Total Collections
# Store the movie name in variable named top_movie
 sort_movies <- bollywood[order(-bollywood$Tcollection),]
 #head(bollywood[order(-bollywood$Tcollection),])
	
  top_movie <- sort_movies$Movie[1]
  top_movie
  
#Q4
#	Write the command to find out which movie comes second on the list in terms of Total Collections
# Store the movie name in variable named top_2_movie
  sort_movies <- bollywood[order(-bollywood$Tcollection),]
  top_2_movie <- sort_movies$Movie[2]
  
	
# Now let's find out the movies shot by Shahrukh, Akshay and Amitabh separately.
# subset() function is used for that. The code has already been written for you. 
	
	shahrukh <- subset(bollywood, Lead == "Shahrukh")
	akshay <- subset(bollywood, Lead == "Akshay")
	amitabh <- subset(bollywood, Lead  == "Amitabh")

# You can view what the above data frames look like
View(shahrukh)
View(akshay)
View(amitabh)
#Q5
#	What is the total collection of Shahrukh, Akshay and Amitabh movies individually?
# You can use	a column named 'Tcollection' for this 
 
    shahrukh_collection <- sum(shahrukh$Tcollection)
    
	akshay_collection <- sum(akshay$Tcollection)
    
	amitabh_collection <- sum(amitabh$Tcollection)
    
	
#Q6  
# Write command/s to find out how many movies are in Flop, Average, Hit and Superhit categories in the entire Bollywood data set.
View (bollywood)
superhit <- sum(bollywood$Verdict== "Super Hit")
Hit <- sum(bollywood$Verdict=="Hit")
average <- sum(bollywood$Verdict=="Average")
flop <- sum(bollywood$Verdict=="Flop")

#You can use SAPPLY function if you want to apply a function specific columns in a data frame 
#You can write a command to find the maximum value of Ocollection, Wcollection, Fwcollecion and Tcollection using sapply

  
#Q7 
# Write a command to find the names of the movies which have the maximum Ocollection, Wcollection, Fwcollecion & Tcollection
# Store the names of 4 movies in same sequence in movie_result vector

#maximum Ocollection
max(bollywood$Ocollection)
highest_Ocollection_movie <- which.max(bollywood$Ocollection)
highest_Ocollection_movie <- bollywood[highest_Ocollection_movie, 'Movie']
highest_Ocollection_movie

#maximum Wcollection
max(bollywood$Wcollection)
highest_Wcollection_movie <- which.max(bollywood$Wcollection)
highest_Wcollection_movie <- bollywood[highest_Wcollection_movie, 'Movie']
highest_Wcollection_movie

#maximum Fcollection

max(bollywood$Fwcollection)
highest_Fwcollection_movie <- which.max(bollywood$Fwcollection)
highest_Fwcollection_movie <- bollywood[highest_Fwcollection_movie, 'Movie']
highest_Fwcollection_movie


#maximum Tcollection

max(bollywood$Tcollection)
highest_Tcollection_movie <- which.max(bollywood$Tcollection)
highest_Tcollection_movie <- bollywood[highest_Tcollection_movie, 'Movie']
highest_Tcollection_movie
   
    

movie_result <- c(highest_Ocollection_movie,highest_Wcollection_movie, highest_Fwcollection_movie,highest_Fcollection_movie, highest_Tcollection_movie)
	
movie_result
   
    
    


    
    
    