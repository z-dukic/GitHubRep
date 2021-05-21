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
sifra int not null primary key auto_increment,
indiferentno bit,
vesta varchar(34),
asocijalno bit not null
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
sifra int not null primary key auto_increment,
modelnaocala varchar(37),
treciputa datetime not null,
ekstroventno bit not null,
prviputa datetime,
svekar int not null
);

create table svekar (
sifra int primary key not null auto_increment,
stilfrizura varchar(48),
ogrlica int not null,
asocijalno bit not null
);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table cura add foreign key (decko) references decko(sifra);
alter table deckozarucnica add foreign key (decko) references decko(sifra);
alter table deckozarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table prijatelj add foreign key (svekar) references svekar(sifra);

insert into neprijatelj (haljina,modelnaocala,kuna) values ('plave', 'Police', 1500.00);
insert into neprijatelj (haljina,modelnaocala, kuna) values ('crvene', 'Kineske', 50.00);
insert into neprijatelj (haljina,modelnaocala,kuna) values ('crna', 'Nike', 200.00);

insert into cura (haljina,drugiputa,majica) values ('crvena','2020-12-09','adidas');
insert into cura (haljina,drugiputa,majica) values ('plava', '2019-12-12','nike'); 
insert into cura (haljina,drugiputa,majica) values ('crna','2015-12-20','adidas');

insert into decko(asocijalno) values (1);
insert into decko(asocijalno) values (0);

insert into zarucnica(bojakose, lipa,indiferentno) values ('Plava',100.20,1);
insert into zarucnica(bojakose, lipa,indiferentno) values ('Crna',20.20,0);


insert into deckozarucnica(decko,zarucnica) values (1,1);
insert into deckozarucnica(decko,zarucnica) values (1,2);
insert into deckozarucnica(decko,zarucnica) values (2,1);

update prijatelj set treciputa='2020-04-30' where sifra>0;

delete from brat where ogrlica not like 14;
delete from brat where ogrlica=14;

select suknja from cura where drugiputa is null;
















