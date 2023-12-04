# lab 07

## 1.1
```sql
select avg(waga) from kreatura where rodzaj='wiking';
```

## 1.2
```sql
select rodzaj, count(rodzaj) as liczba, avg(waga) from kreatura group by rodzaj;
```

## 1.3
```sql
select rodzaj, avg(year(NOW()) - year(dataUr)) as wiek from kreatura group by rodzaj;
```

## 2.1
```sql
select * from zasob;
select rodzaj, sum(waga*ilosc) from zasob group by rodzaj;
```

## 2.2
```sql
select nazwa, avg(waga) from zasob where ilosc >= 4 group by nazwa having sum(waga) > 10;
```

## 2.3
```sql
select rodzaj, count(distinct nazwa) from zasob group by rodzaj having min(ilosc) = 1;
```

## 3.1
```sql
# złączaenie wewnętrzne (część wspólna zbiorów)
select * from kreatura, ekwipunek where kreatura.idKreatury = ekwipunek.idKreatury;

select k.nazwa, e.ilosc, e.idZasobu from kreatura k inner join ekwipunek e on k.idkreatury = e.idKreatury;
```

## 3.2
```sql
select k.nazwa, z.nazwa from kreatura k inner join ekwipunek e on k.idkreatury = e.idKreatury
inner join zasob z on z.idZasobu = e.idZasobu;
```

## 3.3
```sql
select * from kreatura k left join ekwipunek e on k.idKreatury = e.idKreatury where e.idKreatury is null;
```
