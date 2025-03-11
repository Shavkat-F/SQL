select distinct col1, col2 from InputTbl
except
select distinct col1, col2 from InputTbl where col1>col2
	
SELECT MIN(col1) AS col1, MAX(col2) AS col2
FROM InputTbl
GROUP BY 
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END;

select  Typ, count (*) as Counts from GroupbyMultipleColumns where Value1 = 'a' or Value2 = 'a' or Value3 = 'a'
group by Typ

select * from [dbo].[TestMultipleZero] where A!= '0' OR B!= '0' OR C!= '0' OR D!= '0'
	
select Name, 
	count (case Fruit when 'Mango' then 1 else null end) as MangoCount,
	count (case Fruit when 'Apple' then 1 else NULL end) as APPLECount,
	count (case Fruit when 'Lichi' then 1 else null end) as LICHICount,
	count (case Fruit when 'Orange' then 1 else null end) as ORANGECount
from FruitCount
group by Name
