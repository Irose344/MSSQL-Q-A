--1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.
create FUNCTION dbo.quickchickenbites(@restauranttype VARCHAR(100),@stuffname varchar(50))
RETURNS TABLE
AS
RETURN (
    SELECT *,
           STUFF(RestaurantType,charindex(' ',@restauranttype),1,concat(' ',@stuffname,' ')) AS quickchickenbites
    FROM Assignment2
    WHERE RestaurantType=@restauranttype
);
SELECT * FROM dbo.quickchickenbites('quick bites','chicken');

--2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating.
create function rating
(

)
returns table
as
return
(
select RestaurantName,CuisinesType from assignment2 where No_of_Rating=
(select max(No_of_Rating) from assignment2)
)

select * from dbo.rating()

--3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
--start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
--and below 3.5 and ‘Bad’ if it is below 3 star rating.

select *,
case
	when Rating>4 then 'Excellent'
	when Rating>3.5 and Rating<=4 then 'Good'
	when Rating>3 and Rating<=3.5 then 'Average'
	else 'Bad' end as Rating_Status
from assignment2

--4. Find the Ceil, floor and absolute values of the rating column and display the current date
--and separately display the year, month_name and day.
select OrderId,RestaurantName,ceiling(Rating) as Rating_Ceiling,floor(Rating) as Rating_Floor,abs(Rating) as Absolute_Rating,
getdate() as Present_Date,Year(getdate()) as [Year],Month(getdate()) as month_name,Day(getdate()) as [Day]
from assignment2
--5. Display the restaurant type and total average cost using rollup.
select RestaurantType,sum(AverageCost) as AverageCost from assignment2 group by rollup(RestaurantType)





