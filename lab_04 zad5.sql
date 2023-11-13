# 5.1
insert into postac values (default,'Asgard','wiking','1600-01-02',423);
insert into postac values (default,'Zygfryd','wiking','1723-03-01',300);
insert into postac values (default,'Marcel','wiking','1750-01-02',293);
insert into postac values (default,'Bogdan','wiking','1900-01-02',123);
insert into postac values (default,'Witold','wiking','1800-01-02',223);

# 5.2
create table statek (
nazwa_statku varchar(40) primary key not null,
rodzaj_statku enum('wioslowy', 'zaglowy'),
data_wodowania date,
max_ladownosc int unsigned);

# 5.3
insert into statek values('Magdalena','wioslowy','1544-07-12',450);
insert into statek values('Bernadetta','zaglowy','1598-03-11',400);

# 5.4
alter table postac add column funkcja varchar(40);

# 5.5
update postac set funkcja='kapitan' where nazwa='Bjorn';

# 5.6
alter table postac add column statek varchar(40) default null;
alter table postac add foreign key (statek) references statek(nazwa_statku) on delete set null;

# 5.7
update postac set statek='Magdalena' where nazwa='Bjorn';
update postac set statek='Magdalena' where nazwa='Drozd';
update postac set statek='Magdalena' where nazwa='Asgard';
update postac set statek='Magdalena' where nazwa='Zygfryd';
update postac set statek='Bernadetta' where nazwa='Marcel';
update postac set statek='Bernadetta' where nazwa='Bogdan';
update postac set statek='Bernadetta' where nazwa='Witold';

# 5.8
delete from izba where nazwa_izby='spizarnia';

# 5.9
drop table izba;





# lab_05

# 1/a
select * from postac where rodzaj='wiking' order by wiek DESC;
delete from postac where id_postaci=6;
delete from postac where id_postaci=7;

# 1/b
# krok 1
# usunięcie kluczy obcych, które łączą się z kolumną id_postaci
#tabela: walizka, przetwory
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

# 2/a
# dodanie kolumny jako pierwszej na liście kolumn w tabeli
# dodanie kolumny z nowym kluczem głównym w tabeli z danymi
# prawdopodobnie sie nie powiedzie - wartości null dla całej
# kolumny nie są przecież unikalne, a to warunek klucza gł.
alter table postac add pesel char(11) first;

update postac set pesel=92839405112 + id_postaci;
# dodanie primary key do tabeli postac
alter table postac add primary key(pesel);
desc postac;

# 2/c
alter table postac modify rodzaj enum('wiking','ptak','kobieta','syrena');



