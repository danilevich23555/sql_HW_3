
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
	duration int not null,
	trac_album_id int references music_album_table(id_album)
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