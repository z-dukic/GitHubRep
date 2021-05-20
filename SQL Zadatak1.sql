DROP database IF EXISTS SQLzadatak1;
CREATE database SQLzadatak1;
use SQLZadatak1;

CREATE TABLE svekar (
sifra int NOT NULL PRIMARY key,
bojaociju varchar(40) NOT NULL,
prstena int,
dukserica varchar(41),
lipa decimal(13,8),
eura decimal(12,7),
majica varchar(35)
);

CREATE TABLE sestrasvekar(
sifra int PRIMARY KEY NOT NULL,
sestra int,
svekar int
);

CREATE TABLE sestra(
sifra int PRIMARY KEY NOT NULL,
introvertno bit,
haljina varchar(31),
maraka decimal(16,6),
hlace varchar(46),
narukvica int
);

create table zena(
sifra int primary key not null,
treciputa datetime,
hlace varchar(46),
kratkamajica varchar(31) not null,
jmbag char(11) not null,
bojaociju varchar(39) not null,
haljina varchar(44),
sestra int not null
);

create table muskarac (
sifra int not null primary key,
bojaociju varchar(50) not null,
hlace varchar(30),
modelnaocala varchar(43),
maraka decimal(14,5),
zena int
);

create table mladic(
sifra int not null primary key,
suknja varchar(50) not null,
kuna decimal(16,8) not null,
drugiput datetime,
asocijalno bit,
ekstrovetno bit not null,
dukserica varchar(48),
muskarac int not null
);


create table punac(
sifra int not null primary key,
ogrlica int,
gustoca decimal(14,9),
hlace varchar(41) not null
);

create table cura(
sifra int not null,
novcica decimal(16,5) not null,
gustoca decimal(18,6) not null,
lipa decimal(13,10),
ogrlica int not null,
bojakose varchar(38),
sukna varchar(36),
punac int
);

#alter table dajekey add foreign key (primakey) references primakey(sifra);
alter table sestrasvekar add foreign key (sestra) references sestra(sifra);
alter table sestrasvekar add foreign key (svekar) references svekar(sifra);
alter table zena add foreign key(sestra) references sestra(sifra);
alter table muskarac add foreign key(zena) references zena(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table cura add foreign key(punac) references punac(sifra);








