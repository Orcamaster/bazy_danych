# Lab 05

## 1a
```sql
select * from postac where rodzaj='wiking' order by wiek DESC;
delete from postac where id_postaci=6;
delete from postac where id_postaci=7;
```

## 1b
```sql
# krok 1
# usunięcie kluczy obcych, które łączą się z kolumną id_postaci
# tabela: walizka, przetwory
alter table walizka drop foreign key walizka_ibfk_1;
alter table przetwory drop foreign key przetwory_ibfk_1;
alter table przetwory drop foreign key przetwory_ibfk_2;

# krok 2
# pozbycie się auto_increment
alter table postac change id_postaci id_postaci int;
#lub
alter table postac modify id_postaci int;

# krok 3
alter table postac drop primary key;
desc postac;
```

## 2a
```sql
# dodanie kolumny jako pierwszej na liście kolumn w tabeli
# dodanie kolumny z nowym kluczem głównym w tabeli z danymi
# prawdopodobnie sie nie powiedzie - wartości null dla całej
# kolumny nie są przecież unikalne, a to warunek klucza gł.
alter table postac add pesel char(11) first;

update postac set pesel=92839405112 + id_postaci;
# dodanie primary key do tabeli postac
alter table postac add primary key(pesel);
desc postac;
```

## 2b
```sql
alter table postac modify rodzaj enum('wiking','ptak','kobieta','syrena');
```

## 2c
```sql
insert into postac values(92839405101,11,'Gertruda Nieszczera','syrena','1800-03-06',223,null,null);
```

## 3a
```sql
select * from postac where nazwa='Bjorn';
update postac set statek='Magdalena' where nazwa LIKE '%a%';
```

## 3b
```sql
# przyklad 1
select * from statek where data_wodowania >= '1901-01-01' and data_wodowania <= '2000-12-31';
# przyklad 2
select * from statek where data_wodowania between '1901-01-01' and '2000-12-31';
# przyklad 3
select * from statek where year(data_wodowania) between 1901 and 2000;

update statek set max_ladownosc= 0.7 * max_ladownosc where year(data_wodowania) between 1901 and 2000;
```

## 3c
```sql
# sposob 1
alter table postac modify wiek int unsigned check(wiek < 1000);

# sposob 2
alter table postac add check (wiek < 1000);

# test dzialania check na kolumnie wiek
update postac set wiek=1000 where nazwa='Drozd'
```

## 4a
```sql
alter table postac modify rodzaj enum('wiking','ptak','kobieta','syrena','waz');
insert into postac values(92456405102,12,'Waz Loko','waz','1100-04-16',823,null,null);
```

## 4b
```sql
create table marynarz like postac;
insert into marynarz select * from postac where statek is not null;
```

## 4c
```sql
alter table marynarz add foreign key marynarz(statek) references statek(nazwa_statku) on delete set null;
```

## 5a
```sql
update postac set statek=null;
```

## 5b
```sql
delete from postac where nazwa='Marcel';
```

## 5c
```sql
delete from statek;
```

## 5d
```sql
alter table postac drop foreign key postac_ibfk_1;
alter table marynarz drop foreign key marynarz_ibfk_1;
drop table statek;
```

## 5e
```sql
create table zwierz(
id_zwierza int primary key auto_increment,
nazwa varchar(40),
wiek int);
desc zwierz;
```

## 5f
```sql
insert into zwierz values(default,'Waz Loko',823);
insert into zwierz values(default,'Drozd',1);
```
