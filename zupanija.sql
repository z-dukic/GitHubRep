DROP database IF EXISTS zupanija;
CREATE database zupanija;
use zupanija;

CREATE TABLE zupanija(
sifra int NOt NULL PRIMARY key auto_increment,
naziv varchar(50),
zupan varchar(50)
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