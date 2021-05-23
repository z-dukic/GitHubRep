DROP database IF EXISTS sqlzadatak3;
CREATE database sqlzadatak3;
use sqlzadatak3;

create table svekar(
sifra int primary key auto_increment not null,
novcica decimal(16,8) not null,
suknja varchar(44) not null,
bojakose varchar(36),
prstena int,
narukvica int not null,
cura int not null
);

create table ostavljena (
sifra int  primary key not null auto_increment,	
kuna decimal(17,5),
lipa decimal(15,6),
majica varchar(36),
modelnaocala varchar(31) not null,
prijatelj int
);

create table cura(
sifra int primary key not null auto_increment,
dukserica varchar(49),
maraka decimal(13,7),
drugiputa datetime,
majica varchar(49),
novcica decimal(15,8),
ogrlica int not null
);

create table prijatelj(
sifra int  primary key not null auto_increment,
kuna decimal(16,10),
haljina varchar(37),
lipa decimal(13,10),
dukserica varchar(31),
indiferentno bit not null	
);

create table snasa(
sifra int primary key not null auto_increment,
introventno bit,
kuna decimal(15,6) not null,
eura decimal(12,9) not null,
treciputa datetime,
ostavljena int not null
);

create table prijateljbrat(
sifra int not null primary key auto_increment,
prijatelj int not null,
brat int not null
);

create table punica(
sifra int not null primary key auto_increment,
asocijalno bit,
kratkamajica varchar(44),
kuna decimal(13,8) not null,
vesta varchar(32) not null,
snasa int
);

create table brat(
sifra int not null primary key auto_increment,
jmbg char(11),
ogrlica int not null,
ekstroventno bit not null
);

alter table svekar add foreign key(cura) references cura(sifra);
alter table snasa add foreign key(ostavljena) references ostavljena(sifra);
alter table ostavljena add foreign key(prijatelj) references prijatelj(sifra);
alter table prijateljbrat add foreign key(prijatelj) references prijatelj(sifra);
alter table punica add foreign key(snasa) references snasa(sifra);
alter table prijateljbrat add foreign key(brat) references brat(sifra);

insert into ostavljena (modelnaocala,lipa) values ('crvena',10.10);
insert into ostavljena (modelnaocala,lipa) values ('plave',20.20);
insert into ostavljena (modelnaocala,lipa) values ('bijele',30.30);

insert into snasa(kuna, eura, ostavljena) values (70.00,10.00,1);
insert into snasa(kuna, eura, ostavljena) values (140.00,20.00,2);
insert into snasa(kuna, eura, ostavljena) values (210.00,30.00,3);

insert into prijatelj (indiferentno) values (1);
insert into prijatelj (indiferentno) values (0);
insert into prijatelj (indiferentno) values (1);

insert into brat (ogrlica,ekstroventno) values (15,1);
insert into brat (ogrlica,ekstroventno) values (20,1);
insert into brat (ogrlica,ekstroventno) values (30,0);

insert into prijateljbrat (prijatelj, brat) values (1,1);
insert into prijateljbrat (prijatelj, brat) values (2,1);
insert into prijateljbrat (prijatelj, brat) values (1,3);

delete from punica where kratkamajica like '%ab%';

select majica from ostavljena where lipa not like '9,10,20,30,35';




