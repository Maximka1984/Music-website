create database MUSICs with owner = POSTGRES;

create table if not exists Performers (
    PerformerId SERIAL primary KEY ,
    PerformerName VARCHAR (80) not null 
);

create table if not exists Albums(
    AlbumId int primary key,
    AlbumName VARCHAR(80) not null,
    YearRelease int not NULL
);


create table if not exists Tracks(
    TrackId int primary key,
    AlbumId int references Albums(AlbumId) not NULL,
    TrackName VARCHAR(80) not null,
    Continuity TIME not null
);


create table if not exists TypesofMusic(
    GenreId int primary key,
    MusicName VARCHAR(80) not null unique
);
    
create table if not exists PerformersTypesofMusic(
    PerformerId int references Performers,
    GenreId int references TypesofMusic,
    constraint pk primary key (PerformerId,GenreId)
);
    
 
create table if not exists AlbumsPerformers (
    PerformerId INTEGER references Performers,
    AlbumId INTEGER references Albums,
    constraint PK1 primary key (PerformerId,AlbumId)
);
    
    
create table if not exists Collections (
    CollectionId int primary key,
    CollectionName VARCHAR (80) not null ,
    YearOfProduction int not null
);
    
create table if not exists CollectionsTracks(
     CollectionId int references Collections,
     TrackId int references Tracks,
     constraint PK2 primary key (CollectionId,TrackId)
);
    
    
 
     
 
 