# Working with Date and Time in R


## Basics: standard format in R is yyyy-mm-dd (the format in which R stores date internally)

##returns today's date
Sys.Date()
#Ans: "2017-12-04" it returns adta type object and hence we can add numbers to it

Sys.Date() +10
#Ans: "2017-12-14"
## we can do mathematical opertaions

typeof(Sys.Date())
#Ans "double"

#dates are stored as days since 1st jan 1970; calculates the days since this arbitrary date
as.integer(Sys.Date())
unclass(Sys.Date())


##Date format
#converting into dates using as.date
#1.1 %d-%m-%Y

typeof("25-12-2017")
d1 <- as.Date("25-12-2017", format="%d-%m-%Y")
d1 # returns in format %Y-%m-%d
typeof(d1)

d2 <- as.Date("12-25-2017", format="%m-%d-%Y")
d2

