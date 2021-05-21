DROP database IF EXISTS sqlzadatak2;
CREATE database sqlzadatak2;
use sqlzadatak2;

create table brat (
sifra int primary key not null auto_increment,
suknja varchar(47),
ogrlica int not null,
asocijalno bit not null,
neprijatelj int not null
);

create table neprijatelj (
sifra int primary key not null auto_increment,
majica varchar(32),
haljina varchar(43) not null,
lipa decimal(16, 8),
modelnaocala varchar(49) not null,
kuna decimal(12, 6) not null,
jmbag char(11),
cura int
);

create table cura (
sifra int primary key not null auto_increment,
haljina varchar(33) not null,
drugiputa datetime not null,
suknja varchar(38),
narukvica int,
introvertno bit,
majica varchar(40) not null,
decko int
);

create table decko (
sifra int primary key not null auto_increment,
haljina varchar(33) not null,
drugiputa datetime not null,
suknja varchar(38),
narukvica int,
introvertno bit,
majica varchar(40) not null,
decko int
);

create table deckozarucnica (
sifra int primary key not null auto_increment,
decko int not null,
zarucnica int not null
);

create table zarucnica (
sifra int primary key not null auto_increment,
narukvica int,
bojakose varchar(37) not null,
novcica decimal(15, 9),
lipa decimal(15, 8) not null,
indiferentno bit not null
);

create table prijatelj (
sifra int primary key not null auto_increment,
narukvica int,
bojakose varchar(37) not null,
novcica decimal(15, 9),
lipa decimal(15, 8) not null,
indiferentno bit not null
);

create table svekar (
sifra int primary key not null auto_increment,
stilfrizura varchar(48),
ogrlica int not null,
asocijalno bit not null
);








