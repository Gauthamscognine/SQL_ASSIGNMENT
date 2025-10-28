declare @y int = 2017;
with calendar as(
select cast(concat(@y,'-01-01') as date) as calendardate
	union all 
select dateadd(day,1,calendardate) from calendar where calendardate < eomonth(concat(@y,'-12-01')) 
)
select 
	calendardate as [date],
	datepart(dayofyear,calendardate),
	datepart(week,calendardate),
	datepart(weekday,calendardate),
	datepart(month,calendardate),
	datepart(day,calendardate)
	from calendar
option(maxrecursion 366);