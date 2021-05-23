drop database if exists sqlzadatak5;
create database sqlzadatak5;
use sqlzadatak5;

create table mladic(
sifra int not null primary key auto_increment,
kratkamajica varchar(48) not null,
haljina varchar(30) not null,
asocijalno bit,
zarucnik int
);

create table zarucnik(
sifra int not null primary key auto_increment,
jmbag char(11),
lipa decimal(12,8),
indiferentno bit not null
);

create table svekar(
sifra int not null primary key auto_increment,
bojakose varchar(33),
majica varchar(31),
carape varchar(31) not null,
haljina varchar(43),
narukvica int,
eura decimal(14,5) not null
);

create table svekarcura(
sifra int not null primary key auto_increment,
svekar int not null,
cura int not null
);

create table cura(
sifra int not null primary key auto_increment,
carape varchar(41) not null,
marka decimal(17,10) not null,
asocijalno bit,
vesta varchar(47) not null
);

create table punac(
sifra int not null primary key auto_increment,
dukserica varchar(33),
prviputa datetime not null,
majica varchar(36),
svekar int not null
);

create table punica(
sifra int not null primary key auto_increment,
hlace varchar(43) not null,
nausnica int not null,
ogrlica int,
vesta varchar(49) not null,
modelnaocala varchar(31) not null,
treciputa datetime not null,
punac int not null
); 

create table ostavljena(
sifra int not null primary key auto_increment,
majica varchar(33),
ogrlica int not null,
carape varchar(44),
stilfrizura varchar(42),
punica int not null
);

alter table svekarcura add foreign key(svekar) references svekar(sifra);
alter table svekarcura add foreign key(cura) references cura(sifra);
alter table mladic add foreign key(zarucnik) references zarucnik(sifra);
alter table punac add foreign key(svekar) references svekar(sifra);
alter table ostavljena add foreign key(punica) references punica(sifra);
alter table punica add foreign key(punac) references punac(sifra);

insert into svekar(carape,eura) values ('bijele', 10.10); 

insert into cura (carape,marka,vesta) values ('adidas',15.10,'plava');
insert into cura (carape,marka,vesta) values ('nike',177.10,'crna');
insert into cura (carape,marka,vesta) values ('S.Oliver',25.10,'bijela');

insert into punac (prviputa, svekar) values ('2010-09-11',1);
insert into punac (prviputa, svekar) values ('1978-12-01',1);
insert into punac (prviputa, svekar) values ('1990-12-25',1);

insert into punica(hlace, nausnica,vesta,modelnaocala,treciputa,punac) values ('plave', 1, 'crvena','Police','2020-12-09',1);
insert into punica(hlace, nausnica,vesta,modelnaocala,treciputa, punac) values ('crne', 2, 'roza','Aviatorice','2015-11-09',2);
insert into punica(hlace, nausnica,vesta,modelnaocala,treciputa,punac) values ('bijele', 3, 'ljubicasta','Kineske','2000-12-30',1);

insert into svekarcura (svekar,cura) values (1,1);
insert into svekarcura (svekar,cura) values (1,2);
insert into svekarcura (svekar,cura) values (1,3);

delete from ostavljena where ogrlica like 17;

select majica from punac where sifra is not null;

select a.asocijalno, f.stilfrizura, e.nausnica 
from cura a
inner join svekarcura b on a.sifra=b.cura 
inner join svekar c on c.sifra=b.svekar
inner join punac d on c.sifra=d.svekar
inner join punica e on d.sifra=e.punac 
inner join ostavljena f on e.sifra=f.punica
where d.prviputa is not null and c.majica like '%ba%';

select majica, carape from svekar where sifra is not null;



