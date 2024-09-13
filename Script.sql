 create database MUSICs with owner = POSTGRES;

 create table if not exists Performers (
     ID SERIAL primary key ,
     Name VARCHAR (80) not null unique);
    
 create table if not exists TypesofMusic(
     ID SERIAL primary key,
     Title VARCHAR(80) not null unique);
    
 create table if not exists PerformersTypesofMusic(
     PerformersID INTEGER references Performers,
     GenreID INTEGER references TypesofMusic,
     constraint PK_PerformersTypesofMusic primary key (PerformersID,GenreID));
    
 create table if not exists Albums(
     ID SERIAL primary key,
     Title VARCHAR(80) not null unique,
     year INTEGER check (year > 1950 and year < 2050));
    
 create table if not exists AlbumsPerformers (
     PerformersID INTEGER references Performers,
     AlbumID INTEGER references Albums,
     constraint PK_AlbumsPerformers primary key (PerformersID,AlbumID));
    
 create table if not exists Tracks(
     ID SERIAL primary key,
     AlbumID INTEGER references Albums,
     Title VARCHAR(80) not null,
     CONTINUITY INTEGER not null check (CONTINUITY >0),
     constraint PK_Tracks UNIQUE(Title,AlbumID));
    
 create table if not exists Collections (
     ID SERIAL primary key,
     Title VARCHAR (80) not null ,
     year INTEGER check (year>1950 and year< 2050));
    
 create table if not exists CollectionsTracks(
     CollectionID INTEGER references Collections,
     TrackID INTEGER references Tracks,
     constraint PK_CollectionsTracks primary key (CollectionsID,TrackID));
    
    
 
     
 
 