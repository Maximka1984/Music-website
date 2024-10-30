 create database MUSICs with owner = POSTGRES;

 create table if not exists Performers (
     performerid SERIAL primary key ,
     name VARCHAR (80) not null unique);
    
 create table if not exists TypesofMusic(
     genreid SERIAL primary key,
     title VARCHAR(80) not null unique);
    
 create table if not exists PerformersTypesofMusic(
     performerid INTEGER references Performers,
     genreid INTEGER references TypesofMusic,
     constraint PK_PerformersTypesofMusic primary key (performerid,genreid));
    
 create table if not exists Albums(
     albumid SERIAL primary key,
     title VARCHAR(80) not null unique,
     year INTEGER check (year > 1950 and year < 2050));
    
 create table if not exists AlbumsPerformers (
     performerid INTEGER references Performers,
     albumID INTEGER references Albums,
     constraint PK_AlbumsPerformers primary key (performerid,albumid));
    
 create table if not exists Tracks(
     trackid SERIAL primary key,
     albumid INTEGER references Albums,
     title VARCHAR(80) not null,
     continuity INTEGER not null check (continuity >0),
     constraint PK_Tracks UNIQUE(title,albumid));
    
 create table if not exists Collections (
     collectionid SERIAL primary key,
     title VARCHAR (80) not null ,
     year INTEGER check (year>1950 and year< 2050));
    
 create table if not exists CollectionsTracks(
     collectionid INTEGER references Collections,
     trackid INTEGER references Tracks,
     constraint PK_CollectionsTracks primary key (collectionid,trackid));
    
    
 
     
 
 