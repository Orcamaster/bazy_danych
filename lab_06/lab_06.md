# lab 06

## 1.1
```sql
create table kreatura select * from wikingowie.kreatura;
create table zasob select * from wikingowie.zasob;
create table ekwipunek select * from wikingowie.ekwipunek;
```

## 1.2
```sql
select * from zasob;
```

## 1.3
```sql
select * from zasob where rodzaj='jedzenie';
```

## 1.4
```sql
select idZasobu, ilosc from ekwipunek where idKreatury=1 or idKreatury=2 or idKreatury=3;
```

## 2.1
```sql
select * from kreatura where rodzaj !='wiedzma' and udzwig >=50;
```

## 2.2
```sql
select * from zasob where waga >2 and waga <5;
```

## 2.3
```sql
select * from kreatura where nazwa LIKE '%or%' and udzwig between 30 and 70;
```

## 3.1
```sql
select * from zasob where month(dataPozyskania) between 7 and 8;
```

## 3.2
```sql
select * from zasob where rodzaj is not null order by waga ASC;
```

## 3.3
```sql
select * from kreatura where dataUr is not null order by dataUr asc limit 5;
```

## 4.1
```sql
select distinct rodzaj from zasob;
```

## 4.2
```sql
select concat(nazwa,' - ', rodzaj) from kreatura where rodzaj LIKE 'wi%';
```

## 4.3
```sql
select *, ilosc * waga as calkowita_waga from zasob where YEAR(dataPozyskania) between 2000 and 2007;
```

## 5.1
```sql
select nazwa, waga, waga * 0.7 as masa_netto, waga * 0.3 as odpady from zasob;
```

## 5.2
```sql
select * from zasob where rodzaj is null;
```
## 5.3
select distinct nazwa from zasob where nazwa LIKE 'ba%' or nazwa LIKE '%os';
