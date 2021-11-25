create database Audible
use Audible

create table "User"(
	userId int primary key identity(1,1),
	first_name nvarchar(30) not null,
	last_name nvarchar(30) not null,
	email nvarchar(60) not null,
	address nvarchar(50) not null,
	gender char(1) null default 'M' check ((gender is null) or (gender in ('M', 'F'))),
	age int not null,
)

create table Account(
	accountId int primary key identity(1,1),
	userId int not null foreign key references "User"(userId),
	membershipId int foreign key references Membership(membershipId),
	start_date date null
)

create table Membership(
	membershipId int primary key identity(1,1),
	membership_type nvarchar(30) not null,
	price numeric(8,2) not null
)

create table Book(
	bookId int primary key identity(1,1),
	title nvarchar(30) not null,
	year_of_release int not null check (year_of_release > 0),
	genre nvarchar(30) not null,
	duration float not null,
	rating float,
	authorId int not null foreign key references Author(authorId)
)

create table User_Books(
	user_books_id int primary key identity(1,1),
	bookId int not null foreign key references Book(bookId),
	accountId int not null foreign key references Account(accountId)
)

create table Book_Narrator(
	book_narrator_id int primary key identity(1,1),
	bookId int not null foreign key references Book(bookId),
	narratorId int not null foreign key references Narrator(narratorId)
)

create table Author(
	authorId int primary key identity(1,1),
	first_name nvarchar(30) not null,
	last_name nvarchar(30) not null,
	date_of_birth date not null,
	country nvarchar(30) not null
)

create table Narrator(
	narratorId int primary key identity(1,1),
	first_name nvarchar(30) not null,
	last_name nvarchar(30) not null,
	country nvarchar(30) not null,
	language nvarchar(20) not null
)

create table Podcast(
	podcastId int primary key identity(1,1),
	title nvarchar(50) not null,
	host_first_name nvarchar(30) not null,
	host_last_name nvarchar(30) not null,
	duration float not null,
	date_of_recording date not null,
	rating float
)

create table User_Podcasts(
	user_podcasts_id int primary key identity(1,1),
	podcastId int not null foreign key references Podcast(podcastId),
	accountId int not null foreign key references Account(accountId)
)

create table Guest(
	guestId int primary key identity(1,1),
	first_name nvarchar(30) not null,
	last_name nvarchar(30) not null
)

create table Podcast_Guest(
	podcast_guest_id int primary key identity(1,1),
	podcastId int not null foreign key references Podcast(podcastId),
	guestId  int not null foreign key references Guest(guestId)
)

create table Review(
	reviewId int primary key identity(1,1),
	reviewer_name nvarchar(30) not null,
	review_date date not null,
	review_text text not null,
	bookId int null foreign key references Book(bookId),
	podcastId int null foreign key references Podcast(podcastId)
)

--end create tables

insert into Membership(membership_type, price)
values('Non-Member', 0.00)

insert into Membership(membership_type,price)
values ('Plus', 7.95)

insert into Membership(membership_type,price)
values ('Premium Plus', 14.95)

insert into "User"(first_name, last_name, email, address, age)
values ('Ivan', 'Ivanov', 'ivan@gmail.com', 'Plovdiv', 19)

insert into "User"(first_name, last_name, email, address, age)
values ('Georgi', 'Georgiev', 'georgi@gmail.com', 'Sofia', 14)

insert into "User"(first_name, last_name, email, address, age)
values ('Tosho', 'Toshev', 'tosho@gmail.com', 'Plovdiv', 33)

insert into "User"(first_name, last_name, email, address, age)
values ('Pesho', 'Peshev', 'pesho@gmail.com', 'Plovdiv', 22)

insert into "User"(first_name, last_name, email, address, age)
values ('Dimo', 'Dimov', 'dimo@gmail.com', 'Burgas', 40)

insert into "User"(first_name, last_name, email, address, age, gender)
values ('Gergana', 'Dimitrova', 'geri@gmail.com', 'Varna', 19, 'F')

insert into "User"(first_name, last_name, email, address, age, gender)
values ('Maria', 'Marinova', 'maria@gmail.com', 'Sofia', 56, 'F')

insert into "User"(first_name, last_name, email, address, age, gender)
values ('Alexandra', 'Alexandrova', 'alex@gmail.com', 'Plovdiv', 18, 'F')

insert into Account(userId, membershipId)
values(1,1)

insert into Account(userId, membershipId)
values(2,2)

insert into Account(userId, membershipId)
values(3,3)

insert into Account(userId, membershipId)
values(4,2)

insert into Account(userId, membershipId)
values(5,1)

insert into Account(userId, membershipId)
values(6,2)

insert into Account(userId, membershipId)
values(7,3)

insert into Author(first_name,last_name,date_of_birth,country)
values('JK', 'Rowling', '1965-07-31', 'England')

insert into Author(first_name,last_name,date_of_birth,country)
values('Frank', 'Herbert', '1920-10-08', 'USA')

insert into Author(first_name,last_name,date_of_birth,country)
values('Will', 'Smith', '1975-09-11', 'USA')

insert into Author(first_name,last_name,date_of_birth,country)
values('Diana', 'Gabaldon', '1986-11-23', 'USA')

insert into Author(first_name,last_name,date_of_birth,country)
values('Anderson', 'Cooper', '1972-01-02', 'UK')


insert into Book(title,year_of_release,genre,duration,rating,authorId)
values('Dune', 1965, 'science fiction', 21.02, 4.7, 2)

insert into Book(title,year_of_release,genre,duration,rating,authorId)
values('Harry Potter', 1997, 'fantasy', 9.33, 4.9, 1)

insert into Book(title,year_of_release,genre,duration,rating,authorId)
values('Will', 2021, 'autobiography', 16.16, 4.9, 6)

insert into Book(title,year_of_release,genre,duration,rating,authorId)
values('Go Tell The Bees That Im Gone', 2021, 'history', 49.27, 5.0, 7)

insert into Narrator(first_name,last_name,country,language)
values('Stephen', 'Fry', 'USA', 'english')

insert into Narrator(first_name,last_name,country,language)
values('Scott', 'Brick', 'USA', 'english')

insert into Narrator(first_name,last_name,country,language)
values('Orlagh', 'Cassidy', 'USA', 'english')

insert into Narrator(first_name,last_name,country,language)
values('Diana', 'Porter', 'USA', 'english')

insert into Narrator(first_name,last_name,country,language)
values('Kate', 'Reading', 'UK', 'english')


insert into Book_Narrator
values(3, 5)

insert into Book_Narrator
values(5, 4)

insert into Book_Narrator
values(1, 2)

insert into Book_Narrator
values(1, 3)

insert into Book_Narrator
values(2, 1)

insert into User_Books
values(1,2)

insert into User_Books
values(2,3)

insert into User_Books
values(2,4)

insert into User_Books
values(1,5)

insert into User_Books
values(3,2)

insert into User_Books
values(5,3)

insert into User_Books
values(5,2)

select * from User_Books

insert into Podcast
values('Just Sleep', 'Taesha' , 'Glasgow', 0.34, '2021-11-14', 4.5)

insert into Podcast
values('Meltdown', 'David' , 'Sirota', 0.54, '2021-10-28', 3.7)

insert into User_Podcasts
values(1,6)

insert into User_Podcasts
values(2,7)

insert into Guest
values('Dimitar', 'Dimitrov')

insert into Guest
values('Ivailo', 'Ivov')

insert into Podcast_Guest
values(2,1)

insert into Podcast_Guest
values(1,2)

insert into Review(reviewer_name,review_date,review_text,bookId)
values('Maria', GETDATE(), 'Awesome book!', 1)

insert into Review(reviewer_name,review_date,review_text,podcastId)
values('Alexander', '2021-11-18', 'Very good information', 1)

insert into Review(reviewer_name,review_date,review_text,bookId)
values('Pavel', '2020-03-08', 'My favourite book', 2)

insert into Review(reviewer_name,review_date,review_text,bookId)
values('Pavel', '2021-11-11', 'Great', 3)

insert into Review(reviewer_name,review_date,review_text,bookId)
values('Elena', '2021-11-24', 'Amazing', 5)
--end insert


create procedure getUserData
as
begin
select first_name as 'First Name', last_name as 'Last Name', membership_type as 'Membership Type', accountId 
from Account a 
join "User" u on a.userId = u.userId
join Membership M on a.membershipId = m.membershipId
order by membership_type desc
end
--end procedure getUserData

create procedure getBookData
as
begin
select * from 
(
select title as 'Title', concat(first_name,' ',last_name) as 'Author Name', genre as Genre, year_of_release as 'Year', rating as Rating, review_text as 'Review'
from Book b
join Author a on b.authorId = a.authorId
join Review r on b.bookId = r.bookId
) t1 
inner join
	(
	select concat(first_name, ' ',last_name) as 'Narrator Name', title as 'Title'
	from Book_Narrator bn
	join Book b on bn.bookId = b.bookId
	join Narrator n on bn.narratorId = n.narratorId
	) t2 on t1.title = t2.title
end
--end procedure getBookData

create procedure getPodcastData
as
begin
select * from
(
select title as Title, concat(host_first_name, ' ', host_last_name) as 'Host Name', duration as Duration
from Podcast p
) t1
right join
	(
		select concat(first_name, ' ', last_name) as 'Guest Name', title as Title, date_of_recording as 'Date'
		from Podcast_Guest pg
		join Podcast p on pg.podcastId = p.podcastId
		join Guest g on pg.guestId = g.guestId
	)t2 on t1.title = t2.title
end
--end procedure getPodcastData

create trigger trg_account_start_time
on Account
for insert
as
begin
	update Account
	set start_date = GETDATE()
	where accountId in (select accountId from inserted)
end
go
--end trigger

create function fnc_user(@accountId int)
returns table
as
return
(
	select concat(first_name, ' ',last_name) as 'Full Name',email as Email, membership_type as 'Membership Type'
	from Account a 
	join "User" u on a.userId = u.userId
	join Membership M on a.membershipId = m.membershipId
	where accountId = @accountId
)
--end function

select * from fnc_user(2)
exec getBookData
exec getUserData
exec getPodcastData

insert into Account(userId, membershipId)
values(8,3)

select * from Account