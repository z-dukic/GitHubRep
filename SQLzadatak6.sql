drop database if exists sqlzadatak6;
create database sqlzadatak6;
use sqlzadatak6;

create table decko(
sifra int not null primary key auto_increment,
prviputa datetime,
modelnaocala varchar(41),
nausnica int,
zena int not null
);

create table zena(
sifra int not null primary key auto_increment,
novcica decimal(14,8) not null,
narukvica int not null,
dukserica varchar(40) not null,
haljina varchar(30),
hlace varchar(32),
brat int not null
);

create table brat(
sifra int not null primary key auto_increment,
nausnica int not null,
treciputa datetime not null,
narukvica int not null,
hlace varchar(31),
prijatelj int
);

create table prijatelj(
sifra int not null primary key auto_increment,
haljina varchar(35),
prstena int not null,
introvertno bit,
stilfrizura varchar(36) not null
);

create table prijateljostavljena(
  sifra int not null primary key auto_increment,
  prijatelj int not null,
  ostavljena int not null
);

create table ostavljena(
 sifra int not null primary key auto_increment,
prviputa datetime not null,
kratkamajica varchar(39) not null,
drugiputa datetime,
marka decimal(14,10)
);

create table svekrva(
sifra int not null primary key auto_increment,
hlace varchar(48) not null,
suknja varchar(42) not null,
ogrlica int not null,
treciputa datetime not null,
dukserica varchar(32) not null,
narukvica int not null,
punac int 
);

create table punac(
sifra int not null primary key auto_increment,
ekstrovertno bit not null,
suknja varchar(30) not null,
majica varchar(44) not null,
prviputa datetime not null
);

alter table svekrva add foreign key(punac) references punac(sifra);
alter table decko add foreign key(zena) references zena(sifra);
alter table prijateljostavljena add foreign key(prijatelj) references prijatelj(sifra);
alter table prijateljostavljena add foreign key(ostavljena) references ostavljena(sifra);
alter table zena add foreign key(brat) references brat(sifra);
alter table brat add foreign key(prijatelj) references prijatelj(sifra);



















































