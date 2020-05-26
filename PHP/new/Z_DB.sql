create database tests;
use tests;

create table users (
	name varchar(10) not null,
	password varchar(20) not null,
	email varchar(40) not null
);

create table board (
	no int(10) not null AUTO_INCREMENT,
	user varchar(10) not null,
	title varchar(30) not null,
	texts varchar(300) not null,
	category varchar(15) not null,
	PRIMARY KEY (no)
);


