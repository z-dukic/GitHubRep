DROP database IF EXISTS SQLzadatak1;
CREATE database SQLzadatak1;
use SQLZadatak1;

CREATE TABLE svekar (
sifra int NOT NULL PRIMARY key auto_increment,
bojaociju varchar(40) NOT NULL,
prstena int,
dukserica varchar(41),
lipa decimal(13,8),
eura decimal(12,7),
majica varchar(35)
);

CREATE TABLE sestrasvekar(
sifra int PRIMARY KEY NOT NULL auto_increment,
sestra int,
svekar int
);

CREATE TABLE sestra(
sifra int PRIMARY KEY NOT NULL auto_increment,
introvertno bit,
haljina varchar(31),
maraka decimal(16,6),
hlace varchar(46),
narukvica int
);

create table zena(
sifra int primary key not null auto_increment,
treciputa datetime,
hlace varchar(46),
kratkamajica varchar(31) not null,
jmbag char(11) not null,
bojaociju varchar(39) not null,
haljina varchar(44),
sestra int not null
);

create table muskarac (
sifra int not null primary key auto_increment,
bojaociju varchar(50) not null,
hlace varchar(30),
modelnaocala varchar(43),
maraka decimal(14,5),
zena int
);

create table mladic(
sifra int not null primary key auto_increment,
suknja varchar(50) not null,
kuna decimal(16,8) not null,
drugiput datetime,
asocijalno bit,
ekstrovetno bit not null,
dukserica varchar(48),
muskarac int not null
);


create table punac(
sifra int not null primary key auto_increment,
ogrlica int,
gustoca decimal(14,9),
hlace varchar(41) not null
);

create table cura(
sifra int not null auto_increment primary key,
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

#insert into (nazivtablice 1, nazivtablice2, nazivtablice,...) values (vrijednost 1, vrijednost 2, vrijednost 3);
insert into svekar (bojaociju) values ('plava');
insert into svekar (bojaociju) values ('crna');
insert into svekar (bojaociju) values ('crvena');
insert into sestra (haljina) values ('crvena');
insert into sestra (haljina) values ('plava');
insert into sestra (haljina) values ('bijela');
insert into sestrasvekar (sestra,svekar) values (1,1);
insert into sestrasvekar (sestra,svekar) values (1,2);
insert into sestrasvekar (sestra,svekar) values (2,1);
insert into zena (kratkamajica,jmbag,bojaociju,sestra) values ('crvena',12312312312,'zelena',1);
insert into zena (kratkamajica,jmbag,bojaociju,sestra) values ('plava',12312312312,'roza',2);
insert into zena (kratkamajica,jmbag,bojaociju,sestra) values ('roza',12312312312,'crna',1);
insert into muskarac (bojaociju) values ('plave');
insert into muskarac (bojaociju) values ('crvene');
insert into muskarac (bojaociju) values ('smeđe');
insert into mladic (suknja,kuna,ekstrovetno,muskarac) values ('zelena',100.20,0,1);
insert into cura(novcica,gustoca,ogrlica) values(10.5,115.2,50);
insert into punac(hlace) values ('roza');
insert into punac(hlace) values ('crno');
insert into punac(hlace) values ('zlatno');

#update nazivtablice set vrijednost='Marko' where vrijednost='Pero'; - ovo staviš 
#update nazivtablice set vrijednost=15.77 where sifra=1; - ovo koristiš kad se referiraš na određeni broj u tablici
update svekar set bojaociju='Crvena' where bojaociju='plava';
update zena set kratkamajica='Roza' where sifra=1;
update cura set ogrlica=100 where ogrlica=50;

#delete from nazivtablice where vrijednost=1; - možete biti veća, manja itd
#delete from nazivtablice where vrijednost='nesto';
delete from muskarac where bojaociju='crvene';
delete from muskarac where sifra>2;
delete from mladic where kuna>15.78;

select * from svekar;
select *, haljina from sestra;
select * from punac where hlace like '%oz%';


select a.dukserica, f.asocijalno, e.hlace 
from svekar a 
inner join sestrasvekar b on a.sifra=b.svekar 
inner join sestra c on c.sifra=b.sestra 
inner join zena d on c.sifra=d.sestra 
inner join muskarac e on d.sifra=e.zena 
inner join mladic f on e.sifra=f.muskarac 
where d.hlace like 'A%' and c.haljina like '%BA%';

 
select a.haljina, a.maraka 
from sestra a inner join sestrasvekar b on a.sifra=b.sestra 
where b.sestra is null;
