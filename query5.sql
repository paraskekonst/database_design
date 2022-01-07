select *
from `match`
where home_team='Croatia' AND date LIKE '2018%'
UNION select *
from `match`
where away_team='Croatia' AND date LIKE '2018%'