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

