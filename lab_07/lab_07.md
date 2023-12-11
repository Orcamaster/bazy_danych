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

## 4.1
```sql
# ?
select * from kreatura natural join ekwipunek;
```

## 4.2
```sql
select k.nazwa, e.ilosc, z.nazwa from kreatura k
inner join ekwipunek e on k.idKreatury = e.idKreatury 
inner join zasob z on z.idZasobu = e.idZasobu 
where z.rodzaj = 'jedzenie'
order by k.dataUr desc limit 5;
```

## 4.3
```sql
select concat(k1.nazwa, ' - ', k2.nazwa) from kreatura k1, kreatura k2
where k1.idKreatury - k2.idKreatury = 5;
```

## 5.1
```sql
select k.rodzaj, avg(e.ilosc * z.waga) from kreatura k
inner join ekwipunek e on k.idKreatury = e.idKreatury 
inner join zasob z on z.idZasobu = e.idZasobu
where k.rodzaj not in ('malpa','waz')
and e.ilosc < 30 group by k.rodzaj;
```

## 5.2
```sql
# z użyciem UNION
select 'najmlodsza', a.maxData, b.nazwa, a.rodzaj
from (select max(dataUr) maxData, rodzaj from kreatura
group by rodzaj) a,
(select nazwa, dataUr from kreatura) b
where a.maxData = b.dataUr
union
select 'najstarsza', a.minData, b.nazwa, a.rodzaj
from (select min(dataUr) minData, rodzaj from kreatura
group by rodzaj) a,
(select nazwa, dataUr from kreatura) b
where a.minData = b.dataUr;

# bez użycia UNION
select a.nazwa, a.rodzaj, a.dataUr from kreatura a,
(select min(dataUr) min, max(dataUr) max
from kreatura group by rodzaj) b
where b.min = a.dataUr or b.max=a.dataUr;
```
