# zti

## 1
```sql
select imie, nazwisko, year(data_urodzenia) as rok_urodzenia from pracownik;
```

## 2
```sql
select imie, nazwisko, (year(now()) - year(data_urodzenia)) as wiek from pracownik;
```

## 3
```sql
select count(p.id_pracownika) as liczba_pracownikow, d.nazwa from pracownik p
inner join dzial d on p.dzial = d.id_dzialu group by d.nazwa;
```

## 4
```sql
select nazwa_kategori, count(id_towaru) from kategoria k
inner j
oin towar t on t.kategoria = k.id_kategori group by nazwa_kategori;
```
## 5
```sql
select nazwa_kategori, group_concat(' ', nazwa_towaru) from kategoria k
inner join towar t on t.kategoria = k.id_kategori group by nazwa_kategori;
```

## 6
```sql
select ROUND(pensja, 2) as srednie_zarobki from pracownik;
```

## 7
```sql
select ROUND(pensja, 2) as srednie_zarobki from pracownik
where year(now()) - year(data_zatrudnienia) >= 5;
```

## 8
```sql
select t.nazwa_towaru, sum(pz.ilosc) from towar t
inner join pozycja_zamowienia pz on t.id_towaru = pz.towar
group by t.nazwa_towaru order by 2 DESC limit 10;

select t.nazwa_towaru, count(pz.id_pozycji) from towar t
inner join pozycja_zamowienia pz on t.id_towaru = pz.towar
group by t.nazwa_towaru order by 2 DESC limit 10;
```

## 9
```sql
select numer_zamowienia, sum(pz.ilosc * pz.cena) as wartosc from zamowienie z
inner join pozycja_zamowienia pz on z.id_zamowienia = pz.zamowienie
where year(z.data_zamowienia) = 2017 and quarter(z.data_zamowienia) = 1
group by numer_zamowienia;
```

## 10
```sql
select p.imie, p.nazwisko, sum(pz.ilosc * pz.cena) as wartosc from zamowienie z
inner join pozycja_zamowienia pz on z.id_zamowienia = pz.zamowienie
inner join pracownik p on p.id_pracownika = z.pracownik_id_pracownika
group by p.id_pracownika order by wartosc desc;
```

# Część 2

## 1
```sql
select d.nazwa, min(p.pensja), max(p.pensja), avg(p.pensja) from pracownik p 
inner join dzial d on p.dzial = d.id_dzialu
group by d.id_dzialu;
```

## 2
```sql
select k.pelna_nazwa, z.numer_zamowienia, sum(pz.ilosc * pz.cena) as wartosc from zamowienie z
inner join pozycja_zamowienia pz on z.id_zamowienia = pz.zamowienie
inner join klient k on k.id_klienta = z.klient
group by k.id_klienta, z.id_zamowienia order by wartosc desc limit 10;

select year(z.data_zamowienia), month(z.data_zamowienia), sum(pz.ilosc * pz.cena) as wartosc from zamowienie z
inner join pozycja_zamowienia pz on z.id_zamowienia = pz.zamowienie
group by year(z.data_zamowienia), month(z.data_zamowienia);
```

## 4
```sql
select sum(pz.ilosc * pz.cena) as suma_anulowanych from zamowienie z
inner join pozycja_zamowienia pz on z.id_zamowienia = pz.zamowienie
where status_zamowienia = 6;
```

## 7
```sql
select year(data_zamowienia), sum(pz.ilosc * pz.cena) from zamowienie z
inner join pozycja_zamowienia pz on z.id_zamowienia = pz.zamowienie
group by year(data_zamowienia);
```
