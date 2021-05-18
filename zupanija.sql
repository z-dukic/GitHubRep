DROP database IF EXISTS zadatak1;
CREATE database zadatak1;
use zadatak1;

CREATE TABLE zupanija(
sifra int NOt NULL PRIMARY key auto_increment,
naziv varchar(50),
zupan int
);

CREATE TABLE opcina(
sifra int NOt NULL PRIMARY key auto_increment,
zupanija int,
naziv varchar(50)
);

CREATE TABLE mjesto(
sifra int NOt NULL PRIMARY key auto_increment,
opcina int,
naziv varchar(50)
);

CREATE TABLE zupan(
sifra int NOt NULL PRIMARY key auto_increment,
ime varchar(50),
prezime varchar(50)
);

alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table mjesto add foreign key (opcina) references opcina(sifra);
alter table zupanija add foreign key (zupan) references zupan(sifra);

insert into zupan (ime,prezime) values
('Marko','Mariæ'),
('Pero','Periæ'),
('Miro','Mariæ');

insert into zupanija (naziv,zupan)
values 
('Zagrebacka',1),
('Osjecko-Baranjska',2),
('Vukovarsko-Srijemska',3);

insert into opcina (zupanija, naziv)
values
(1,'Samobor'),
(1,'Zaprešiæ'),
(2,'Osijek'),
(2,'Èepin'),
(3,'Vukovar'),
(3,'Vinkovci');

insert into mjesto (opcina,naziv)
values
(1,'Pešæenica'),
(1,'Zapruðe'),
(2,'Tvrða'),
(2,'Uljara'),
(3,'Sajmište'),
(3,'Mladost'),
(1,'Kvatriæ'),
(1,'Dolac'),
(2,'Zeleno polje'),
(2,'Glavna ulica'),
(3,'Adica'),
(3,'Centar');


update mjesto set naziv='Marko' where sifra=1;
update mjesto set naziv='Marko' where sifra=2;
update mjesto set naziv='Marko' where sifra=3;
update mjesto set naziv='Marko' where sifra=4;
update mjesto set naziv='Marko' where sifra=5;

#ne mogu obrisati zato što je parent
#delete from opcina where sifra=3;
#delete from opcina where sifra=3;


select * from zupan;
select * from zupanija;
select * from mjesto;
select * from opcina;

select naziv as ime from opcina;
select naziv as ime,zupanija from opcina;
select naziv,naziv,naziv,naziv from opcina;
select naziv, 'Osijek' as naziv from opcina
select 1, 'Osijek' from opcina;
select 1,2,'Pero' from osoba;
select now();

select * from opcina where sifra<5;
select * from opcina where sifra>=3 and sifra<=5;
select * from opcina where sifra is not null;
select * from opcina where naziv like 'samo%';
select * from opcina where naziv like '%za%';
select * from osoba where naziv not like '%ra';









