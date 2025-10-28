use joins;


create table testtable(No int);
insert into testtable values(7859),
(6897),
(9875),
(8659),
(7600),
(7550);
 
select top 1 no from testtable order by no desc;
 
 