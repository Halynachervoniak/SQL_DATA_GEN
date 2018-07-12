

-- створення робочої таблиці
CREATE TABLE TEST
(id int not null IDENTITY (1,1),
category nvarchar(20) not null,
subcategory nvarchar(20) not null,
subID int not null,
catID int not null)
GO





-- http://www.cyberforum.ru/sql-server/thread891278.html

declare
@name varchar(max),
@i int,
@end_number int,
@x1 varchar(10) ,
@x2 varchar(10) ,
@r1 decimal,
@r2 decimal,
@a1 varchar(10),
@a2 varchar(10)
set @end_number = 2000
set @i = 1

while @i < @end_number
BEGIN
set @r1 = CEILING(rand()*4) --рандом для статі
set @r2 = CEILING(rand()*20) --рандом для субкатегорій

 set @x1 = @r1
 set @x2 = @r2
  begin
   set @a1 = (select category from dbo.Table_1 where id = @r1)
  end
  if @r1 =1
   begin
     set @a2 = (select CholovichyyOdyah from dbo.Table_1 where id = @r2)
   end
  else if  @r1 =2
  begin
   set @a2 = (select ZhinochyyOdyah from dbo.Table_1 where id = @r2)
  end
  else if  @r1 =3
  begin
   set @a2 = (select DytyachyyOdyahKhlopchyky from dbo.Table_1 where id = @r2)
  end
  else
  begin
   set @a2 = (select DytyachyyOdyahDivchata from dbo.Table_1 where id = @r2)
  end
-- ==========================================
/*
if @r2 = 1
begin
set @a2 = 'blue'
end
else
begin
set @a2 = 'poloska'
end
*/
 set @name = @a1 +',' + @a2 + ',' + @x1 + ',' + @x2
 insert into TEST(category, subcategory, subID, catID) values(@a1,@a2,@x1,@x2)

-- print @name
set @i +=1
END
/*
go
insert into ProductCategories(CategoryName, ProdCatDescription) values(v1,vn)
*/

-- =========================================================================
-- Інший варіант генерації -----------------------
/*
declare @t table (id int, name varchar(50));
 
insert into @t
 (id, name)
 select
  row_number() over (order by g.ord, t.ord),
  'men ' + g.n + ' ' + t.v
 from
  (values ('shtany', 1), ('t-shat', 2), ('sviter', 3)) g(n, ord) cross join
  (values ('2 ', 1), ('4 ', 2), ('6 ', 3), ('8', 4), ('10', 5)) t(v, ord);
 
select * from @t order by id;
-- ===========================================================================
*/