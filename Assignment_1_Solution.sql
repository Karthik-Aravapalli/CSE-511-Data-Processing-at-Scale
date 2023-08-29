create table users(
	userid int PRIMARY Key,
	name text
);
create table movies(
	movieid int PRIMARY Key,
	title text
);
create table taginfo(
	tagid int PRIMARY Key,
	content text
);
create table genres(
	genreid int PRIMARY Key,
    name text
);
create table ratings(
	userid int,
	movieid int, 
	rating numeric check(rating between 0 and 5.00), 
	timestamp bigint not null,
	primary key(userid,movieid),
	FOREIGN Key(userid) references users(userid),
	FOREIGN Key(movieid) references movies(movieid)
);
create table tags(
	userid int,
	movieid int,
	tagid int,
	timestamp bigint not null,
	primary key(userid,movieid,tagid),
	FOREIGN Key(userid) references users(userid),
	FOREIGN Key(movieid) references movies(movieid),
	FOREIGN Key(tagid) references taginfo(tagid)
);
create table hasagenre(
	movieid int,
	genreid int,
	primary key(movieid,genreid),
	FOREIGN Key(movieid) references movies(movieid),
	FOREIGN Key(genreid) references genres(genreid)
);