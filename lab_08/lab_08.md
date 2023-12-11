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
