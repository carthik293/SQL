# DBMS II Mini Project
# Table Used "icc test batting Figues"
# Karthik M
 #############************Questions*******************#####################
 
#1. Import the csv file to a table in the database
# Table "icc test batting Figues" has been imported under mini_project database
use mini_project;

#Displaying the table content
select * from `icc test batting figures`;


#2.Remove the column 'Player Profile' from the table.

ALTER TABLE `icc test batting figures`
DROP COLUMN `Player Profile`;

# Use symbol(``) to remove column name seperated with spaces.

#3.Extract the country name and player names from the given data and store it in seperate columns for further usage.

SELECT REPLACE(Player, SUBSTRING_INDEX(Player, '(', -1),'')
AS Player_name, SUBSTRING_INDEX(Player, '(', -1) AS Country from `icc test batting figures`;

#4.From the column 'Span' extract the start_year and end_year and store them in seperate columns for further usage.

SELECT REPLACE(Span, SUBSTRING_INDEX(Span, '-', -1),'')
AS Start, SUBSTRING_INDEX(Span, '-', -1) AS End from `icc test batting figures`;

#5.The column 'HS' has the highest score scored by the player so far in any given match. 
 #The column also has details if the player had completed the match in a NOT OUT status.
 #Extract the data and store the highest runs and the NOT OUT status in different columns.
 
select *, 
case 
when HS like'%*' 
then "Not Out"
else "Out"
end as HS_Status
from `icc test batting figures`;

#6 6.Using the data given, considering the players who were active in the year of 2019, 
 #create a set of batting order of best 6 players using the selection criteria of those 
 #who have a good average score across all matches for India.
 
 
#Using Normal Method 
Select Player,Avg
from `icc test batting figures`
Where (Span like "%2019") and (Player like "%INDIA)")
order by Avg desc 
limit 6;

#Using Sub Query Method 
Select Player,Avg
from `icc test batting figures`
Where Span  in (select Span from `icc test batting figures` where (Span like "%2019"))
and Player like "%INDIA)" 
order by Avg desc
limit 6 ;
 
 
 
 #7.Using the data given, considering the players who were active in the year of 2019, 
  #create a set of batting order of best 6 players using the selection criteria of those
  #who have highest number of 100s across all matches for India.

#Using Normal Method   
Select Player,`100`
from `icc test batting figures`
Where (Span like "%2019") and (Player like "%INDIA)")
order by `100` desc 
limit 6;

#Using Sub Query Method 
Select Player,`100`
from `icc test batting figures`
Where Span  in (select Span from `icc test batting figures` where (Span like "%2019"))
and Player like "%INDIA)" 
order by `100` desc
limit 6 ;
  
  #8.Using the data given, considering the players who were active in the year of 2019, 
   #create a set of batting order of best 6 players using 2 selection criterias of your own for India.
   
   # Selection Criterias 1. Avg Score 2. Most number of Not out'savepoint

#Using Normal Method    
Select Player,HS,Avg
from `icc test batting figures`
Where (Span like "%2019") and (Player like "%INDIA)")
order by Avg desc , HS Desc
limit 6;


#Using Sub Query Method 
Select Player,HS,Avg
from `icc test batting figures`
Where Span  in (select Span from `icc test batting figures` where (Span like "%2019"))
and Player like "%INDIA)" 
order by Avg desc, HS Desc
limit 6 ;


#9.Create a View named ‘Batting_Order_GoodAvgScorers_SA’ using the data given, considering the players who were active in the year of 2019, 
 #create a set of batting order of best 6 players using the selection criteria of those 
 #who have a good average score across all matches for South Africa.

#Using Normal Method  
Select Player as ‘Batting_Order_GoodAvgScorers_SA’
from `icc test batting figures`
Where (Span like "%2019") and (Player like "%SA)")
order by Avg desc
limit 6;


#Using Sub Query Method 
Select Player as ‘Batting_Order_HighestCenturyScorers_SA’
from `icc test batting figures`
Where Span  in (select Span from `icc test batting figures` where (Span like "%2019"))
and Player like "%SA)" 
order by Avg desc
limit 6 ;



#10.Create a View named ‘Batting_Order_HighestCenturyScorers_SA’ Using the data given, 
 #considering the players who were active in the year of 2019,
 #create a set of batting order of best 6 players using the selection criteria of those 
 #who have highest number of 100s across all matches for South Africa. 
 
#Using Normal Method  
Select Player as ‘Batting_Order_HighestCenturyScorers_SA’
from `icc test batting figures`
Where (Span like "%2019") and (Player like "%SA)")
order by `100` desc
limit 6;


#Using Sub Query Method   
Select Player as ‘Batting_Order_HighestCenturyScorers_SA’
from `icc test batting figures`
Where Span  in (select Span from `icc test batting figures` where (Span like "%2019"))
and Player like "%SA)" 
order by `100` desc
limit 6 ;
