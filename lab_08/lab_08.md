# lab 08

## 1.1
```sql
create table uczestnicy select * from wikingowie.uczestnicy;
create table etapy_wyprawy select * from wikingowie.etapy_wyprawy;
create table sektor select * from wikingowie.sektor;
create table wyprawa select * from wikingowie.wyprawa;
```

## 1.2
```sql
select * from kreatura k inner JOIN uczestnicy u
on k.idKreatury = u.id_uczestnika where id_wyprawy = 4;
```

## 1.3
```sql
# uczestnicy -> nazwa wyprawy, id kreatur -> ilość.ekwipunek

select * from uczestnicy;
select * from wyprawa;
select * from ekwipunek;

select w.nazwa, e.ilosc from wyprawa w
inner join uczestnicy u on w.id_wyprawy = u.id_wyprawy
inner join ekwipunek e on e.idkreatury = u.id_uczestnika;
```

## 2.1
```sql
select w.nazwa as nazwa_wyprawy, count(u.id_uczestnika) as liczba_uczestnikow,
group_concat(' ', k.nazwa) as imiona_uczestnikow from uczestnicy u 
inner join wyprawa w on u.id_wyprawy = w.id_wyprawy
inner join kreatura k on u.id_uczestnika = k.idKreatury group by w.nazwa;
```

## 2.2
```sql
# 4 połączenia
# etapy_wyprawy <-> sektor <-> wyprawa <-> kreatura
# ?
select * from etapy_wyprawy e
inner join sektor s on e.sektor = s.id_sektora
inner join wyprawa w on w.id_wyprawy = e.idWyprawy
inner join kreatura k on w.kierownik = k.idKreatury;
```

## 3.1
```sql
select s.id_sektora, count(e.sektor)
from etapy_wyprawy e 
right join sektor s on e.sektor = s.id_sektora 
group by s.id_sektora;
```

## 3.2
```sql
select k.nazwa, 
if(count(u.id_wyprawy) = 0, 'nie bral udzialu w wyprawie', 'bral udzial w wyprawie') 
as czy_wyprawa from kreatura k
left join uczestnicy u on u.id_uczestnika = k.idKreatury group by k.nazwa;
```

## 4.1
```sql
select idWyprawy, sum(length(dziennik)) from etapy_wyprawy
group by idWyprawy having sum(length(dziennik)) < 400;
```

## 4.2
```sql
select * from ekwipunek;
select * from uczestnicy;
select * from etapy_wyprawy;
select * from zasob;

select u.id_wyprawy, (sum(z.waga * z.ilosc)/count(u.id_uczestnika)) as srednia_waga from zasob z
inner join ekwipunek ek on ek.idZasobu = z.idZasobu
inner join uczestnicy u on ek.idKreatury = u.id_uczestnika group by u.id_wyprawy;
```

## 5.1
```sql
select k.nazwa, abs(datediff(w.data_rozpoczecia, k.dataUr)) from kreatura k
inner join uczestnicy u on u.id_uczestnika = k.idKreatury
inner join etapy_wyprawy ew on u.id_wyprawy = ew.idWyprawy
inner join wyprawa w on w.id_wyprawy = u.id_wyprawy
where ew.sektor = 7;
```
