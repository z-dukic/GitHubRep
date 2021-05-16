DROP database IF EXISTS zupanija;
CREATE database zupanija;
use zupanija;

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
('Zagrebacka',1,1),
('Osjecko-Baranjska',2,2),
('Vukovarsko-Srijemska',3,3);

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








