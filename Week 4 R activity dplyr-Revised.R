#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
df<-data.frame(HairEyeColor)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(df,5)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")

library(dplyr)

#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
select(df,Hair,Sex)

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
df_hs<-select(df,Hair,Sex)

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
select(df_hs,-Sex)

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
rename(df,gender=Sex)

#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
df1<-rename(df,gender=Sex)

#Let's 'filter' just the females from our dataset
#TASK: Write the function that includes only rows that are 'female'
df1_females<-filter(df1,gender=="Female")
df1_females

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
group_by(df1,gender)

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#TASK: After you run it, write the total here:____592 is the total
total=mutate(df1, total=cumsum(Freq))
total

#Since we have a females dataset, let's make a males dataset
#TASK: Write the function that includes only rows that are 'male'
df1_males<-filter(df1,gender=="Male")
df1_males

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
bind_rows(df1_females, df1_males, id = NULL) 

#Optional Task: add any of the other functions 
#you learned about from the dplyr package

#slice():-used to select the rows
slice(df1,4:8)

#union():Used to join two dataframes
union(df1_females, df1_males)

#arrange():used to reorder the rows
arrange(df1, Hair)
