# Lab 04

## 1
```sql
create table postac (id_postaci int NOT NULL primary key auto_increment, nazwa varchar(40), rodzaj enum("wiking","ptak","kobieta"), data_ur date, wiek int unsigned);

insert into postac values(default, "Bjorn", "wiking", "1700-10-23", 323);

insert into postac values(default, "Drozd", "ptak", "2022-03-19", 1);

insert into postac values(default, "Tesciowa", "kobieta", "1960-05-11", 63);

update postac set wiek=88 where nazwa="Tesciowa";
```

## 2
```sql
create table walizka (id_walizki int NOT NULL primary key auto_increment, pojemnosc int unsigned, kolor enum("rozowy", "czerwony", "teczowy", "zolty"), id_wlasciciela int, foreign key(id_wlasciciela) references postac(id_postaci) on delete cascade);

alter table walizka alter kolor set default "rozowy";

insert into walizka values (default, 3, "zolty", 3);

insert into walizka values (default, 4, "teczowy", 1);
```

## 3
```sql
create table izba (adres_budynku int NOT NULL, nazwa_izby varchar(40) not null, primary key(adres_budynku, nazwa_izby), metraz int unsigned, wlasciciel int null, foreign key(wlasciciel) references postac(id_postaci) on delete cascade);

alter table izba add kolor_izby varchar(40) after metraz;

alter table izba alter kolor_izby set default 'czarny';

insert into izba values (1, "spizarnia", 25, default, 1);
```

## 4
```sql
create table przetwory (id_przetworu int primary key auto_increment not null, rok_produkcji int, id_wykonawcy int, foreign key(id_wykonawcy) references postac(id_postaci) on delete cascade, zawartosc varchar(40), dodatek varchar(40), id_konsumenta int, foreign key(id_konsumenta) references postac(id_postaci) on delete cascade);

alter table przetwory alter rok_produkcji set default 1654;

alter table przetwory alter dodatek set default 'papryczka chilli';

insert into przetwory values(1, 2019, 3, 'bigos', default, 1);
```

## 5.1
```sql
insert into postac values (default,'Asgard','wiking','1600-01-02',423);
insert into postac values (default,'Zygfryd','wiking','1723-03-01',300);
insert into postac values (default,'Marcel','wiking','1750-01-02',293);
insert into postac values (default,'Bogdan','wiking','1900-01-02',123);
insert into postac values (default,'Witold','wiking','1800-01-02',223);
```

## 5.2
```sql
create table statek (
nazwa_statku varchar(40) primary key not null,
rodzaj_statku enum('wioslowy', 'zaglowy'),
data_wodowania date,
max_ladownosc int unsigned);
```

## 5.3
```sql
insert into statek values('Magdalena','wioslowy','1544-07-12',450);
insert into statek values('Bernadetta','zaglowy','1598-03-11',400);
```

## 5.4
```sql
alter table postac add column funkcja varchar(40);
```

## 5.5
```sql
update postac set funkcja='kapitan' where nazwa='Bjorn';
```

## 5.6
```sql
alter table postac add column statek varchar(40) default null;
alter table postac add foreign key (statek) references statek(nazwa_statku) on delete set null;
```

## 5.7
```sql
update postac set statek='Magdalena' where nazwa='Bjorn';
update postac set statek='Magdalena' where nazwa='Drozd';
update postac set statek='Magdalena' where nazwa='Asgard';
update postac set statek='Magdalena' where nazwa='Zygfryd';
update postac set statek='Bernadetta' where nazwa='Marcel';
update postac set statek='Bernadetta' where nazwa='Bogdan';
update postac set statek='Bernadetta' where nazwa='Witold';
```

## 5.8
```sql
delete from izba where nazwa_izby='spizarnia';
```

## 5.9
```sql
drop table izba;
```
