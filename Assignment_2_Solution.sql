--Question - 1
create table query1 as select 
    g.name,
	count(g.name) as moviecount
from 
    movies m 
inner join 
    genres g 
inner join 
    hasagenre h 
on 
    g.genreid=h.genreid 
on 
    m.movieid=h.movieid 
group by 
    g.name;

--Question - 2
create table query2 as select 
	g.name, 
	avg(r.rating) as rating
from 
	ratings r 
inner join 
    movies m 
inner join 
    genres g 
inner join 
    hasagenre h
on 
    g.genreid=h.genreid 
on 
    m.movieid=h.movieid 
on 
    r.movieid=m.movieid 
group by 
    g.name;

--Question -3 
create table query3 as select 
	m.title,
	count(m.title) as countofratings
from 
	ratings r 
inner join 
	movies m 
on 
	r.movieid=m.movieid 
group by 
	m.title 
having 
	count(m.title)>=10;

--Question - 4
create table query4 as select 
	m.movieid,
	m.title 
from 
	movies m 
inner join 
	genres g 
inner join 
	hasagenre h
on 
	g.genreid=h.genreid 
on 
	m.movieid=h.movieid 
where 
	g.name='Comedy';

--Question - 5
create table query5 as select 
	m.title,
	avg(r.rating) as average 
from 
	movies m 
inner join 
	ratings r 
on 
	m.movieid=r.movieid 
group by 
	m.title;

--Question - 6
create table query6 as select 
	avg(r.rating) as average
from 
	ratings r 
inner join 
	genres g 
inner join 
	hasagenre h
on 
	g.genreid=h.genreid 
on 
	r.movieid=h.movieid 
where 
	g.name='Comedy';

--Question - 7
create table query7 as select 
	avg(rating) as average
from
	ratings 
where 
	movieid 
in(
	select h.movieid from hasagenre h inner join genres g on h.genreid=g.genreid where g.name='Comedy'
	intersect
	select h.movieid from hasagenre h inner join genres g on h.genreid=g.genreid where g.name='Romance'
	);

--Question - 8
create table query8 as select 
	avg(rating) as average
from
	ratings 
where 
	movieid 
in(
	select h.movieid from hasagenre h inner join genres g on h.genreid=g.genreid where g.name='Romance'
	except
	select h.movieid from hasagenre h inner join genres g on h.genreid=g.genreid where g.name='Comedy'
	);

--Question - 9
create table query9 as select movieid,rating from ratings where userid=:v1

