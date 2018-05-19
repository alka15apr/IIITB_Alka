
#Public datasets
# Awesome public datasets
#data.gov.in
#It is recommended that you keep the following data sources handy when looking for data sets.
#GitHub: Awesome Public Datasets 
#Open Government Data (OGD) Platform India
#GitHub: DataMeet
#Data sourcing is only the first step in the process. After being sourced, the data needs to be cleaned before you can analyse it

##Data cleaning: to clean it to remove all the data quality issues
## cleaning is one of the most time-consuming steps of data analysis. 
##For example, there could be formatting errors (e.g. rows and columns are merged), missing values, repeated rows, spelling inconsistencies etc. 
##These issues could make it difficult to analyse data and could lead to errors or irrelevant results
##Though data cleaning is often done in a somewhat haphazard way and it is too difficult to define a 'single structured process', we will study data cleaning in the following steps:
#Fix rows and columns
#Fix missing values
#Standardise values
#Fix invalid values
#Filter data

##Checklist for Fixing Rows
#Delete summary rows: Total, Subtotal rows
#Delete incorrect rows: Header rows, Footer rows
#Delete extra rows: Column number, indicators, Blank rows, Page No.

##Checklist for Fixing Columns
#Merge columns for creating unique identifiers if needed: E.g. Merge State, City into Full address
#Split columns for more data: Split address to get State and City to analyse each separately
#Add column names: Add column names if missing
#Rename columns consistently: Abbreviations, encoded columns
#Delete columns: Delete unnecessary columns
#Align misaligned columns: Dataset may have shifted columns

#Treating missing values
#Let us summarise how to deal with missing values:
#Set values as missing values: Identify values that indicate missing data, and yet are not recognised by the software as such, e.g treat blank strings, "NA", "XX", "999", etc. as missing.
#Adding is good, exaggerating is bad: You should try to get information from reliable external sources as much as possible, but if you can't, then it is better to keep missing values as such rather than exaggerating the existing rows/columns.
#Delete rows, columns: Rows could be deleted if the number of missing values are insignificant in number, as this would not impact the analysis. Columns could be removed if the missing values are quite significant in number.
#Fill partial missing values using business judgement: Missing time zone, century, etc. These values are easily identifiable.

c(21,""," " ,34,"-",78, 98) to your function

# Write a function which identifies blank characters representing the unavailable values, and replaces them with NA 
# Make sure that the resultant vector is a numeric vector
# Consider these as blank values :  " ", "", "-"

remove_blank <- function(vector){
  
  vector[which(vector == "-"| vector == ""|vector == " ")]<- NA
  corrected_vector <- as.numeric(vector)
  
  
  return(corrected_vector)
}

##standardizing values
##Standardise units: Ensure all observations under a variable have a common and consistent unit, e.g. convert lbs to kgs, miles/hr to km/hr, etc.
#Scale values if required:  Make sure the observations under a variable have a common scale
#Standardise precision for better presentation of data, e.g. 4.5312341 kgs to 4.53 kgs.
#Remove outliers: Remove high and low values that would disproportionately affect the results of your analysis.

## standardizing text values



#Remove extra characters like such as common prefix/suffix, leading/trailing/multiple spaces, etc. These are irrelevant to analysis.
#Standardise case: There are various cases that string variables may take, e.g. UPPERCASE, lowercase, Title Case, Sentence case, etc. Since R is case sensitive, ensure that all the observations under a variable have the same case.
#Standardise format: E.g. 23/10/16 to 2016/10/20, "Modi, Narendra" to "Narendra Modi", etc.

##
#Write a function which identifies and removes the "*" character after some numeric values in a vector.
# Make sure that the resultant vector is a numeric vector.
remove_string(c(21,34,"99*",56,"90*", "45*"))
remove_string <- function(vector){
  
  
  corrected_vector <- as.numeric(gsub("[*]","",vector))
  
  
  return(corrected_vector)
}


#fixing invalid values
## Encode unicode properly: In case the data is being read as junk characters, try to change encoding, E.g. CP1252 instead of UTF-8.
#Convert incorrect data types: Correct the incorrect data types to the correct data types for ease of analysis. E.g. if numeric values are stored as strings, it would not be possible to calculate metrics such as mean, median, etc. Some of the common data type corrections are - string to number: "12,300" to "12300"; string to date: "2013-Aug" to "2013/08"; number to string: "PIN Code 110001" to "110001"; etc.
#Correct values that go beyond range: If some of the values are beyond logical range, e.g. temperature less than -273° C (0° K), you would need to correct them as required. A close look would help you check if there is scope for correction, or if the value needs to be removed.
#Correct values not in the list: Remove values that don't belong to a list. E.g. In a data set containing blood groups of individuals, strings "E" or "F" are invalid values and can be removed.
#Correct wrong structure: Values that don't follow a defined structure can be removed. E.g. In a data set containing pin codes of Indian cities, a pin code of 12 digits would be an invalid value and needs to be removed. Similarly, a phone number of 12 digits would be an invalid value.
#Validate internal rules: If there are internal rules such as a date of a product's delivery must definitely be after the date of the order, they should be correct and consistent.

# Write a function which takes a vector of marks and replaces every value above 100 with NA

vector - c(89, 90, 108, 56)

remove_invalid <- function(marks_vector){
  
  
  marks_vector[which(marks_vector > 100)]<- NA
  corrected_marks <- marks_vector
  
  return(corrected_marks)
}

remove_invalid(c(89, 90, 108, 56))

#Let's summarise what you learnt about filtering data. You could use this as a checklist for future data cleaning exercises.
#Deduplicate data: Remove identical rows, remove rows where some columns are identical
#Filter rows: Filter by segment, filter by date period to get only the rows relevant to the analysis
#Filter columns: Pick columns relevant to the analysis
#Aggregate data: Group by required keys, aggregate the rest

#Inner join is used to merge the data sets, only keeping the rows corresponding to employee IDs that are common to both the data sets while removing the rest. Outer join, on the other hand, is used when you want to display all the rows from both the tables (even if the rows do not have a common key in both the tables)


### some_df is a dataframe which may contain duplicate rows
# Complete the function such that it returns a dataframe after removing them from some_df
some_df <-data.frame(rbind(c(2,9,6),c(4,6,7),c(4,6,7),c(4,6,7),c(2,9,6)))
remove_dup <- function(some_df){
  
  
  new_df <- some_df[-which(duplicated(some_df)), ]
  
  return(new_df)
}

remove_dup(data.frame(rbind(c(2,9,6),c(4,6,7),c(4,6,7),c(4,6,7),c(2,9,6))))

### Complete the function which takes in a vector & replaces the phone numbers not having exactly 10 digits with NA

phone <- function(phone_vector){
  
  invalid <- which(nchar(as.character(phone_vector))!= 10)
  phone_vector[invalid] <- NA
  clean_vector <- phone_vector
  
  return(clean_vector)
}


# Test - Passing a vector - c(99887766, 998877665521, 9897932453) to your function
phone(c(99887766, 998877665521, 9897932453))
# The ideal output should look like: NA NA 9897932453


#summary:
  
#Understanding domain

#Understanding data and preparing it for analysis

#Univariate analysis and segmented univariate analysis

#Bivariate analysis

#Deriving new metrics from the existing data
