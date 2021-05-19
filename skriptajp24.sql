drop database if exists edunovajp24;
create database edunovajp24;
use edunovajp24;

# not null je obaveza poznavanja vrijednosti
create table smjer(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    trajanje int not null,
    cijena decimal(18,2) null, # ako ne postoji not null onda se smatra da je null
    certifikat boolean
);

create table grupa(
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null,
    smjer int not null,
    predavac int,
    datumpocetka datetime
);

create table clan(
    grupa int not null,
    polaznik int not null
);

create table predavac(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(32)
);

create table polaznik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    brojugovora varchar(20)
);


create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(100)
);

alter table grupa add foreign key (smjer) references smjer(sifra);
alter table grupa add foreign key (predavac) references predavac(sifra);

alter table clan add foreign key (grupa) references grupa(sifra);
alter table clan add foreign key (polaznik) references polaznik(sifra);

alter table polaznik add foreign key (osoba) references osoba(sifra);

alter table predavac add foreign key (osoba) references osoba(sifra);



#1
insert into smjer (naziv,trajanje)
values ('Java programiranje',130);


#2
insert into smjer(sifra,naziv,trajanje,cijena,certifikat)
values (null,'PHP programiranje',130,5999.99,false);

#1 - 15
insert into osoba (ime,prezime,email) values
('Tomislav','Jakopec','tjakopec@gmail.com'),
('Shaquille','O''Neal','shaki@gmail.com'),
('Mirjam','Vida Blagojevi�','mirjam.vida@gmail.com'),
('Stjepan','Pupkari�','cipapro@gmail.com'),
('Josip','Cota','josipcota1@gmail.com'),
('Danko','�imi�','dankosimic@gmail.com'),
('Luka','Crnjac','lukacr94@gmail.com'),
('Denis','Uzelac','uzelac133@gmail.com'),
('Marijana','Katalini�','marijanakatalinic82@gmail.com'),
('Josip','Conjar','josip.conjar@gmail.com'),
('Petar','Jagri�','petarjagric@gmail.com'),
('Zoran','�uki�','zorandjukic.os@gmail.com'),
('Igor','Vu�ko','igorhefner@gmail.com'),
('Vedran','Alagi�','vedran.alagic@outlook.com'),
('Jakob','Brki�','jale.pnv@gmail.com');

#1
insert into predavac(osoba)
values (1);

#2
insert into predavac(osoba)
values (2);


# 1 - 13
insert into polaznik (osoba) values
(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);



#1
insert into grupa (naziv,smjer,predavac,datumpocetka)
values ('JP24',1,1,null);

#2
insert into grupa(smjer,datumpocetka,naziv,predavac)
values (2,'2021-04-24','PP 23',2);

insert into clan values
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),
(1,9),(1,10),(1,11),(1,12),(1,13);

insert into clan values
(2,1),(2,2),(2,3),(2,4);

select * from grupa;
select naziv as ime from grupa;
select naziv as ime,smjer,predavac from grupa;
select naziv, 'Pero Ždero' as naziv, smjer, predavac from grupa;
select 1, 'Osijek' from grupa;
select 1,2,'Pero' from grupa;

select * from osoba where ime='zoran';
select * from osoba where sifra>=3 and sifra<=5;
select * from osoba where sifra is not null;
select * from smjer where naziv like 'zo%';
select * from smjer where naziv like '%ra%';
select * from osoba where ime not like '%ma';
