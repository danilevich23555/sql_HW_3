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


select kind_name, count(artist_nickname) from music_artist_table, join_table_3, kind_table
where music_artist_table.id_artist = join_table_3.id_artist and join_table_3.id_kind = kind_table.id_kind
group by kind_name
order by count(artist_nickname) desc;

select count(*) from track_table 
where trac_album_id in (
select id_album from music_album_table 
where year_of_release between 2018 and 2020);

select album_name, avg_a from music_album_table, (
select trac_album_id, avg(duration) as avg_a from track_table
group by trac_album_id) as track_table_tmp
where track_table_tmp.trac_album_id = music_album_table.id_album;


select artist_nickname, album_name, year_of_release from music_artist_table, join_table_1, music_album_table
where music_artist_table.id_artist = join_table_1.id_artist and music_album_table.id_album = join_table_1.id_album
and year_of_release != 2020;


select distinct collection_name from collection_table, join_table_4, track_table
where track_table.id_track = join_table_4.id_track and collection_table.id_collection = join_table_4.id_collection 
and track_table.id_track in (
select id_track from track_table
where trac_album_id in (
select music_album_table.id_album from music_album_table, join_table_1, music_artist_table
where music_artist_table.artist_nickname like 'Луи Армстронг' and 
music_artist_table.id_artist = join_table_1.id_artist and music_album_table.id_album = join_table_1.id_album));

select music_album_table.album_name  from music_album_table, join_table_1, music_artist_table
where music_artist_table.id_artist = join_table_1.id_artist and music_album_table.id_album = join_table_1.id_album
and music_artist_table.id_artist in (
select  music_artist_table.id_artist from music_artist_table, join_table_3, kind_table
where music_artist_table.id_artist = join_table_3.id_artist and  join_table_3.id_kind = kind_table.id_kind 
group by music_artist_table.id_artist
having count(kind_table.id_kind) > 1);


select music_artist_table.artist_nickname from music_artist_table,join_table_1, music_album_table
where music_artist_table.id_artist = join_table_1.id_artist and music_album_table.id_album = join_table_1.id_album
and music_album_table.id_album in (
select track_table.trac_album_id from track_table
where duration in (select min(duration) from track_table));


select album_name from music_album_table
where id_album in (
select trac_album_id as counter from track_table
group by trac_album_id
having (count(id_track) = (
select  min(tmp.counter) from(
select trac_album_id, count(id_track) as counter from track_table
group by trac_album_id) as tmp)));






