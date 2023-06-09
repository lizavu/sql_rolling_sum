with t1 as (
    select datecl
    , co_name
    , sum(pv) as pv
    from clicks
    group by 1, 2
)
select t1.datecl
, t1.co_name
, sum(case when t2.datecl = t1.datecl then t2.pv end) as pv
, sum(case when t2.datecl between t1.datecl - interval 6 day and t1.datecl then t2.pv end) as pv_7day
, sum(t2.pv) as pv_30day
from t1
left join t1 as t2 on ((t2.datecl between t1.datecl - interval 29 day and t1.datecl) and t1.co_name = t2.co_name)
group by 1,2
order by 1


