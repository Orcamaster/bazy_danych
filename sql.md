# 1
```sql
create table postac (id_postaci int NOT NULL primary key auto_increment, nazwa varchar(40), rodzaj enum("wiking","ptak","kobieta"), data_ur date, wiek int unsigned);

insert into postac values(default, "Bjorn", "wiking", "1700-10-23", 323);

insert into postac values(default, "Drozd", "ptak", "2022-03-19", 1);

insert into postac values(default, "Tesciowa", "kobieta", "1960-05-11", 63);

update postac set wiek=88 where nazwa="Tesciowa";
```

# 2
```sql
create table walizka (id_walizki int NOT NULL primary key auto_increment, pojemnosc int unsigned, kolor enum("rozowy", "czerwony", "teczowy", "zolty"), id_wlasciciela int, foreign key(id_wlasciciela) references postac(id_postaci) on delete cascade);

alter table walizka alter kolor set default "rozowy";

insert into walizka values (default, 3, "zolty", 3);

insert into walizka values (default, 4, "teczowy", 1);
```

# 3
```sql
create table izba (adres_budynku int NOT NULL, nazwa_izby varchar(40) not null, primary key(adres_budynku, nazwa_izby), metraz int unsigned, wlasciciel int null, foreign key(wlasciciel) references postac(id_postaci) on delete cascade);

alter table izba add kolor_izby varchar(40) after metraz;

alter table izba alter kolor_izby set default 'czarny';

insert into izba values (1, "spizarnia", 25, default, 1);
```

# 4
```sql
create table przetwory (id_przetworu int primary key auto_increment not null, rok_produkcji int, id_wykonawcy int, foreign key(id_wykonawcy) references postac(id_postaci) on delete cascade, zawartosc varchar(40), dodatek varchar(40), id_konsumenta int, foreign key(id_konsumenta) references postac(id_postaci) on delete cascade);

alter table przetwory alter rok_produkcji set default 1654;

alter table przetwory alter dodatek set default 'papryczka chilli';

insert into przetwory values(1, 2019, 3, 'bigos', default, 1);
```
