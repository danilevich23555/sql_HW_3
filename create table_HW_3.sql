
create table if not exists music_artist_table(
	id_artist serial primary key,
	artist_name varchar(40) not null,
	artist_surname varchar(40) not null,
	artist_nickname varchar(40) not null unique
);
create table if not exists music_album_table(
	id_album serial primary key,
	album_name varchar(40) not null,
	year_of_release int not null
);
create table if not exists track_table(
	id_track serial primary key,
	track_name varchar(40) not null,
	duration int not null
);
create table join_table_2(
	id_artist int references music_artist_table(id_artist),
	id_track int references track_table(id_track),
	constraint artist_track primary key (id_artist, id_track)
);
create table join_table_1(
	id_artist int references music_artist_table(id_artist),
	id_album int references music_album_table(id_album),
	constraint artist_album primary key (id_artist, id_album)
);
create table if not exists collection_table(
	id_collection serial primary key,
	collection_name varchar(40) not null unique,
	year_of_release varchar(40) not null
);
create table if not exists kind_table(
	id_kind serial primary key,
	kind_name varchar(40) not null unique
);
create table join_table_3(
	id_artist int references music_artist_table(id_artist),
	id_kind int references kind_table(id_kind),
	constraint artist_kind primary key (id_artist, id_kind)
);
create table join_table_4(
	id_track int references track_table(id_track),
	id_collection int references collection_table(id_collection),
	constraint track_collection primary key (id_track, id_collection)
);
create table join_table_5(
	id_track int references track_table(id_track),
	id_album int references music_album_table(id_album),
	constraint track_album primary key (id_track, id_album)
);
create table join_table_6(
	id_collection int references collection_table(id_collection),
	id_album int references music_album_table(id_album),
	constraint collection_album primary key (id_collection, id_album)
);
alter table music_album_table 
	add collection_album_id int references collection_table(id_collection);
alter table music_album_table 
	drop year_of_release;
alter table track_table 
	add duration int not null;
insert into music_artist_table 
values 
(1, 'Филипп', 'Киркоров', 'Король эстрады'),
(2, 'Иманбек', 'Маратович', 'FILV'),
(3, 'Алла', 'Пугачева', 'Алла Пугачева'),
(4, 'Алексей', 'Крупов', 'ATL'),
(5, 'Азамат', 'Кудзаев', 'MiyaGi'),
(6, 'Travis', 'Scot', 'Travis Scot'),
(7, 'Алсу', 'Абрамова', 'Алсу'),
(8, 'Матвей', 'Мельников', 'Мот');
insert into kind_table 
values 
(1, 'Поп-музыка'),
(2, 'РЭП'),
(3, 'Электроная музыка');
insert into join_table_3 
values 
(1, 1),
(2, 3),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 1),
(8, 2);
insert into music_artist_table 
values 
(9, 'Луи', 'Армстронг', 'Луи Армстронг'),
(10, 'Linkin Park', 'Linkin  Park', 'Linkin Park');
insert into kind_table 
values 
(4, 'Альтернативный рок'),
(5, 'Джаз');
insert into join_table_3 
values 
(9, 5),
(10, 4);
insert into music_album_table 
values
(1, 'Наизнанку', 2016),
(2, 'Singin Satchmo', 2018),
(3, 'Лимб', 2017),
(4, 'Meteora (Deluxe Edition)', 2003),
(5, 'Зеркало души', 1977),
(6, 'Приглашение на закат', 2009),
(7, 'Алсу', 1999),
(8, 'Hajime (Part. 1)', 2018);
insert into track_table
values
(1, 'Невераятно', 190),
(2, 'Изюм', 227),
(3, 'Муссоны', 274),
(4, 'Маврикий', 236),
(5, 'Суперзвезда', 174),
(6, 'I Only Have Eyes For You', 274),
(7, 'Sittin In The Sun', 236),
(8, 'Chantez-Les Bas (Sing Em Low)', 174),
(9, 'Танцуйте', 220),
(10, 'Шаман', 195),
(11, '1000', 274),
(12, 'Майк', 236),
(13, 'Архитектор', 185),
(14, 'Гори ясно', 192),
(15, 'В унисон', 140),
(16, 'Nobody s Listening', 178),
(17, 'Breaking the Habit', 196),
(18, 'Numb', 187),
(19, 'Foreword', 13),
(20, 'Faint', 162),
(21, 'Figure.09', 196),
(22, 'Balenciaga', 154),
(23, 'Бубен шамана', 374),
(24, 'Без меня', 274),
(25, 'Зимний сон', 278),
(26, 'Лабиринты', 194);
insert into join_table_2 
values 
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(9, 6),
(9, 7),
(9, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(10, 16),
(10, 17),
(10, 18),
(10, 19),
(10, 20),
(10, 21),
(10, 22);
insert into join_table_4 
values 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(6, 5),
(7, 5),
(8, 5);
insert into join_table_5
values 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(23, 5),
(24, 5),
(25, 7),
(26, 8);
insert into collection_table 
values
(1, 'РЭП музыка 2020', 2020),
(2, 'POP музыка хиты', 2018),
(3, 'РЭП музыка 2018', 2018),
(4, 'РЭП музыка 2021', 2021),
(5, 'Джаз хиты XX века', 2019),
(6, 'хиты Linkin Park', 2021),
(7, 'сборник альтернативного рока', 2020),
(8, 'mix music', 2020);
insert into join_table_1 
values 
(3, 5),
(3, 6),
(4, 3),
(5, 8),
(7, 7),
(8, 1),
(9, 2),
(10, 4);
insert into join_table_2 
values 
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(9, 6),
(9, 7),
(9, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(10, 16),
(10, 17),
(10, 18),
(10, 19),
(10, 20),
(10, 21),
(2, 22),
(3, 23),
(3, 24),
(7, 25),
(7, 26);
select album_name, year_of_release from music_album_table
where year_of_release = 2018;

select track_name, duration from track_table
where duration in (select  max(duration) from track_table);

select track_name, duration from track_table
group by track_name, duration
having duration > 190
order by duration desc;


select collection_name, year_of_release from collection_table
where year_of_release between '2018' and '2020'
order by year_of_release desc;


select artist_nickname from music_artist_table
where artist_nickname not like '% %';

update track_table
set track_name = 'my song'
where id_track = 26;

select track_name from track_table;

select track_name from track_table
where track_name like '%my%' or track_name like '%мой%';


