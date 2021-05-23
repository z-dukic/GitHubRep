DROP database IF EXISTS sqlzadatak4;
CREATE database sqlzadatak4;
use sqlzadatak4;

create table punac(
sifra int not null primary key auto_increment,
treciputa datetime,
majica varchar(46),
jmbag char(11) not null,
novcica decimal(18,7) not null,
marka decimal(12,6) not null,
ostavljen int not null
);

create table ostavljen(
sifra int not null primary key auto_increment,
modelnaocala varchar(43),
introvertno bit,
kuna decimal(14,10)
);

create table zena(
sifra int not null primary key auto_increment,
suknja varchar(39) not null,
lipa decimal(18,7),
prstena int not null
);

create table snasa(
sifra int not null primary key auto_increment,
introvertno bit,
treciputa datetime,
haljina varchar(44) not null,
zena int not null
);

create table becar(
sifra int not null primary key auto_increment,
novcica decimal(14,8),
kratkamajica varchar(48) not null,
bojaociju varchar(36) not null,
snasa int not null
);

create table prijatelj(
sifra int not null primary key auto_increment,
eura decimal(16,9),
prstena int not null,
gustoca decimal(16,5),
jmbag char(11) not null,
suknja varchar(47) not null,
becar int not null
);

create table zenamladic(
sifra int not null primary key auto_increment,
zena int not null,
mladic int not null
);

create table mladic(
sifra int not null primary key auto_increment,
kuna decimal(15,9),
lipa decimal(18,5),
nausnica int,
stilfrizura varchar(49),
vesta varchar(34) not null
);

alter table punac add foreign key(ostavljen) references ostavljen(sifra);
alter table prijatelj add foreign key(becar) references becar(sifra);
alter table becar add foreign key(snasa) references snasa(sifra);
alter table snasa add foreign key(zena) references zena(sifra);
alter table zenamladic add foreign key(zena) references zena(sifra);
alter table zenamladic add foreign key(mladic) references mladic(sifra);

insert into zena(suknja, prstena) values ('Plava',1);
insert into zena(suknja, prstena) values ('Crvena',1);
insert into zena(suknja, prstena) values ('Roza',1);

insert into snasa(haljina, zena) values ('Plava',1);
insert into snasa(haljina, zena) values ('Plava',2);
insert into snasa(haljina, zena) values ('Plava',2);

insert into becar (kratkamajica, bojaociju,snasa) values ('Nike','Plava',1);
insert into becar (kratkamajica, bojaociju,snasa) values ('Adidas','Zelena',2);
insert into becar (kratkamajica, bojaociju,snasa) values ('Puma','Ljubičasta',3);

insert into mladic (vesta) values ('Plava');
insert into mladic (vesta) values ('Crvena');
insert into mladic (vesta) values ('Crna');

insert into zenamladic(zena,mladic) values (1,1);
insert into zenamladic(zena,mladic) values (2,1);
insert into zenamladic(zena,mladic) values (1,2);

delete from prijatelj where prstena>17;

select haljina from snasa where treciputa is null;


