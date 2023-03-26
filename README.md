# Rolling sum for data without consecutive days

This query is in use when you want to calculate a rolling sum but your table does not have full consecutive dates. For example, since stock markets don't work on weekend or holidays, there might not be trading data on weekends or holidays and your data table looks like this:
| Date      | Country | Volume
| ----------- | ----------- |-----------
| 2022-01-01  | Vietnam     |2000
| 2022-01-03  | Vietnam     |3000
| 2022-01-04  | Vietnam     |2000
| 2022-01-06  | Vietnam     |3000

Normally, when you need to do a rolling sum, page1 Google or now ChatGPT will give you more or less this answer:

Select [Region] <br>
, [Order Date]
, Sum([Sales]) as ‘Sales’
, Avg(Sum(Sales)) Over (Partition by [Region] Order By [Order Date] Rows Between 29 Preceding and Current row) as ’30 Day Moving Avg.’
From superstore
Group By Region, [Order Date]

However, this would work only if your data has every dates in a certain year.
