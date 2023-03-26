# Rolling sum for data without consecutive days

This query is in use when you want to calculate a rolling sum but your table does not have full consecutive dates. For example, since stock markets don't work on weekend or holidays, there might not be trading data on weekends or holidays and your data table would look like this:
| Date      | Country | Volume
| ----------- | ----------- |-----------
| 2022-01-01  | Vietnam     |2000
| 2022-01-03  | Vietnam     |3000
| 2022-01-04  | Vietnam     |2000
| 2022-01-06  | Vietnam     |3000

Normally, when you need to do a rolling sum, page1 Google or now ChatGPT will give you more or less this answer:

```
Select Date 
, Country 
, Sum(Volume) as ‘Sales’
, Avg(Sum(Volume)) Over (Partition by Country Order By Date Rows Between 29 Preceding and Current row) as ’30 Day Moving Avg.’
from table
Group By Country, Date
```

However, this would work only if your data has every dates in a certain year. So if you apply this syntax on the table above, lets say to produce rolling sum of the last 3 days, it will sum volume of every 3 rows instead.

In short, this query will help you to rolling sum for the last 30 (changes as you want) days, not 30 rows.
