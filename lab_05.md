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

## 2c
```sql
alter table postac modify rodzaj enum('wiking','ptak','kobieta','syrena');
```


