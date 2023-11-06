# h1
###### h6

Lista
* 1
* 2
  * 2.1 dwie spacje

1. 1
2. 2  
  2.1 dwie spacje
   
**pogrubienie**

_kursywa_

**_pogrubiona kursywa_**

`wyróżnienie`

```sql
SELECT * FROM ososba;
```
mysql> create table postac(
    -> id_postaci ints NOT NULL AUTO INCREMENT,
    -> nazwa varchar(40) DEFAULT NULL,
    -> rodzaj enum("wiking","ptak","kobieta"),
    -> data_ur date,
    -> wiek int unsigned);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that                                    corresponds to your MySQL server version for the right syntax to use near 'ints                                    NOT NULL AUTO INCREMENT,
nazwa varchar(40) DEFAULT NULL,
rodzaj enum("wikin' at line 2
mysql> create table postac( id_postaci ints NOT NULL AUTO_INCREMENT, nazwa varch                                   ar(40) DEFAULT NULL, rodzaj enum("wiking","ptak","kobieta"), data_ur date, wiek
int unsigned);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that                                    corresponds to your MySQL server version for the right syntax to use near 'ints                                    NOT NULL AUTO_INCREMENT, nazwa varchar(40) DEFAULT NULL, rodzaj enum("wikin' at                                    line 1
mysql> create table postac( id_postaci int NOT NULL AUTO_INCREMENT, nazwa varcha                                   r(40) DEFAULT NULL, rodzaj enum("wiking","ptak","kobieta"), data_ur date, wiek i                                   nt unsigned);
ERROR 1075 (42000): Incorrect table definition; there can be only one auto colum                                   n and it must be defined as a key
mysql>
mysql>
mysql>
mysql>
mysql>
mysql>
mysql>
mysql>
mysql>
mysql>
mysql>
mysql>
mysql> create table postac (
    -> id_postaci primary key auto_increment,
    -> nazwa varchar(40),
    -> rodzaj enum("wiking","ptak","kobieta"),
    -> data_ur date,
    -> wiek int unsigned);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that                                    corresponds to your MySQL server version for the right syntax to use near 'prima                                   ry key auto_increment,
nazwa varchar(40),
rodzaj enum("wiking","ptak","kobi' at line 2
mysql> create table postac ( id_postaci int primary key auto_increment, nazwa va                                   rchar(40), rodzaj enum("wiking","ptak","kobieta"), data_ur date, wiek int unsign                                   ed);
Query OK, 0 rows affected (0.16 sec)

mysql> desc postac
    -> ;
+------------+---------------------------------+------+-----+---------+---------                                   -------+
| Field      | Type                            | Null | Key | Default | Extra                                             |
+------------+---------------------------------+------+-----+---------+---------                                   -------+
| id_postaci | int                             | NO   | PRI | NULL    | auto_inc                                   rement |
| nazwa      | varchar(40)                     | YES  |     | NULL    |                                                   |
| rodzaj     | enum('wiking','ptak','kobieta') | YES  |     | NULL    |                                                   |
| data_ur    | date                            | YES  |     | NULL    |                                                   |
| wiek       | int unsigned                    | YES  |     | NULL    |                                                   |
+------------+---------------------------------+------+-----+---------+---------                                   -------+
5 rows in set (0.00 sec)

mysql> drop postac
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL se       rver version for the right syntax to use near 'postac' at line 1
mysql> drop table postac;
Query OK, 0 rows affected (0.01 sec)

mysql> create table postac ( id_postaci int NOT NULL primary key auto_increment, nazwa varchar(40) DEFAULT N       ULL, rodzaj enum("wiking","ptak","kobieta") DEFAULT NULL, data_ur date DEFAULT NULL, wiek int unsigned DEFAU       LT NULL);
Query OK, 0 rows affected (0.22 sec)

mysql> insert into postac values(default, "Bjorn","wiking","1700-10-23",323);
Query OK, 1 row affected (0.00 sec)

mysql> insert into postac values(default, "Dawid","wiking","1993-04-01",30);
Query OK, 1 row affected (0.00 sec)

mysql> select * from postac
    -> ;
+------------+-------+--------+------------+------+
| id_postaci | nazwa | rodzaj | data_ur    | wiek |
+------------+-------+--------+------------+------+
|          1 | Bjorn | wiking | 1700-10-23 |  323 |
|          2 | Dawid | wiking | 1993-04-01 |   30 |
+------------+-------+--------+------------+------+
2 rows in set (0.00 sec)

mysql> delete from postac where id_postaci=2;
Query OK, 1 row affected (0.00 sec)

mysql> insert into postac values(default, "Drozd","ptak","2022-03-19",1);
Query OK, 1 row affected (0.00 sec)

mysql> select * from postac;
+------------+-------+--------+------------+------+
| id_postaci | nazwa | rodzaj | data_ur    | wiek |
+------------+-------+--------+------------+------+
|          1 | Bjorn | wiking | 1700-10-23 |  323 |
|          3 | Drozd | ptak   | 2022-03-19 |    1 |
+------------+-------+--------+------------+------+
2 rows in set (0.00 sec)

mysql> insert into postac values(default, "Tesciowa","kobieta","1960-05-11",63);
Query OK, 1 row affected (0.01 sec)

mysql> select * from postac;
+------------+----------+---------+------------+------+
| id_postaci | nazwa    | rodzaj  | data_ur    | wiek |
+------------+----------+---------+------------+------+
|          1 | Bjorn    | wiking  | 1700-10-23 |  323 |
|          3 | Drozd    | ptak    | 2022-03-19 |    1 |
|          4 | Tesciowa | kobieta | 1960-05-11 |   63 |
+------------+----------+---------+------------+------+
3 rows in set (0.01 sec)

mysql> update postac set wiek=88 where id_postaci=4;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from postac;
+------------+----------+---------+------------+------+
| id_postaci | nazwa    | rodzaj  | data_ur    | wiek |
+------------+----------+---------+------------+------+
|          1 | Bjorn    | wiking  | 1700-10-23 |  323 |
|          3 | Drozd    | ptak    | 2022-03-19 |    1 |
|          4 | Tesciowa | kobieta | 1960-05-11 |   88 |
+------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

mysql> update postac set id_postaci=2 where nazwa="Drozd";
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update postac set id_postaci=3 where nazwa="Tesciowa";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from postac;
+------------+----------+---------+------------+------+
| id_postaci | nazwa    | rodzaj  | data_ur    | wiek |
+------------+----------+---------+------------+------+
|          1 | Bjorn    | wiking  | 1700-10-23 |  323 |
|          2 | Drozd    | ptak    | 2022-03-19 |    1 |
|          3 | Tesciowa | kobieta | 1960-05-11 |   88 |
+------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

mysql> create table walizka (
    -> id_walizki int NOT NULL primary key auto_increment,
    -> pojemnosc int unsigned,
    -> kolor enum("rozowy","czerwony","teczowy","zolty"),
    -> id_wlasciciela int,
    -> foreign key(id_wlasciciela) references postac(id_postaci) on delete cascade);
Query OK, 0 rows affected (0.50 sec)

mysql> show create table walizka;
+---------+-------------------------------------------------------------------------------------------------       ------------------------------------------------------------------------------------------------------------       ------------------------------------------------------------------------------------------------------------       ------------------------------------------------------------------------------------------------------------       -------------------------------------------------+
| Table   | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
+---------+-------------------------------------------------------------------------------------------------       ------------------------------------------------------------------------------------------------------------       ------------------------------------------------------------------------------------------------------------       ------------------------------------------------------------------------------------------------------------       -------------------------------------------------+
| walizka | CREATE TABLE `walizka` (
  `id_walizki` int NOT NULL AUTO_INCREMENT,
  `pojemnosc` int unsigned DEFAULT NULL,
  `kolor` enum('rozowy','czerwony','teczowy','zolty') DEFAULT NULL,
  `id_wlasciciela` int DEFAULT NULL,
  PRIMARY KEY (`id_walizki`),
  KEY `id_wlasciciela` (`id_wlasciciela`),
  CONSTRAINT `walizka_ibfk_1` FOREIGN KEY (`id_wlasciciela`) REFERENCES `postac` (`id_postaci`) ON DELETE CA       SCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+-------------------------------------------------------------------------------------------------       ------------------------------------------------------------------------------------------------------------       ------------------------------------------------------------------------------------------------------------       ------------------------------------------------------------------------------------------------------------       -------------------------------------------------+
1 row in set (0.00 sec)

mysql> desc walizka;
+----------------+---------------------------------------------+------+-----+---------+----------------+
| Field          | Type                                        | Null | Key | Default | Extra          |
+----------------+---------------------------------------------+------+-----+---------+----------------+
| id_walizki     | int                                         | NO   | PRI | NULL    | auto_increment |
| pojemnosc      | int unsigned                                | YES  |     | NULL    |                |
| kolor          | enum('rozowy','czerwony','teczowy','zolty') | YES  |     | NULL    |                |
| id_wlasciciela | int                                         | YES  | MUL | NULL    |                |
+----------------+---------------------------------------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> mysql> alter table walizka alter kolor set default "rozowy";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'walizka alter kolor set default "rozowy"' at line 1
mysql> alter table walizka alter kolor set default "rozowy";
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc walizka
    -> ;
+----------------+---------------------------------------------+------+-----+---------+----------------+
| Field          | Type                                        | Null | Key | Default | Extra          |
+----------------+---------------------------------------------+------+-----+---------+----------------+
| id_walizki     | int                                         | NO   | PRI | NULL    | auto_increment |
| pojemnosc      | int unsigned                                | YES  |     | NULL    |                |
| kolor          | enum('rozowy','czerwony','teczowy','zolty') | YES  |     | rozowy  |                |
| id_wlasciciela | int                                         | YES  | MUL | NULL    |                |
+----------------+---------------------------------------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> insert into walizka values(
    -> default,
    -> 3,
    -> 'zolty',
    -> 3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 5
mysql> insert into walizka values( default, 3, 'zolty', 3);
Query OK, 1 row affected (0.01 sec)

mysql> insert into postac values(default, "Bjorn","wiking","1990-06-23",33);
Query OK, 1 row affected (0.00 sec)

mysql> select * from postac;
+------------+----------+---------+------------+------+
| id_postaci | nazwa    | rodzaj  | data_ur    | wiek |
+------------+----------+---------+------------+------+
|          1 | Bjorn    | wiking  | 1700-10-23 |  323 |
|          2 | Drozd    | ptak    | 2022-03-19 |    1 |
|          3 | Tesciowa | kobieta | 1960-05-11 |   88 |
|          5 | Bjorn    | wiking  | 1990-06-23 |   33 |
+------------+----------+---------+------------+------+
4 rows in set (0.00 sec)

mysql> insert into walizka values( default, 4, 'teczowy', 5);
Query OK, 1 row affected (0.00 sec)

mysql> select * from walizka;
+------------+-----------+---------+----------------+
| id_walizki | pojemnosc | kolor   | id_wlasciciela |
+------------+-----------+---------+----------------+
|          1 |         3 | zolty   |              3 |
|          2 |         4 | teczowy |              5 |
+------------+-----------+---------+----------------+
2 rows in set (0.00 sec)

mysql> create table izba (
    -> adres_budynku int auto_increment,
    -> nazwa_izby int auto_increment not null,
    -> g
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 4
mysql> create table izba (
    -> adres_budynku int not null auto_increment,
    -> nazwa_izby int not null auto_increment,
    -> primary key(adres_budynku, nazwa_izby),
    -> metraz int unsigned,
    -> wlasciciel int null,
    -> ^C
mysql>
[1]+  Stopped                 mysql -u infs_piotrowskio -p
infs_piotrowskio@bad2:~$ mysql -u infs_piotrowskio -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1557
Server version: 8.0.22 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use infs_piotrowskio
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> create table izba(
    -> adres_budynku int not null auto_increment,
    -> nazwa_izby int not null auto_increment,
    -> primary key(adres_budynku, nazwa_izby),
    -> metraz int unsigned,
    -> wlasciciel int null,
    -> foreign key(id_wlasciciela) references postac(id_postaci) on delete cascade);
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> create table izba( adres_budynku int not null, nazwa_izby int not null, primary key(adres_budynku, nazwa_izby), metraz int unsigned, wlasciciel int null, foreign key(id_wlasciciela) references postac(id_postaci) on delete cascade);
ERROR 1072 (42000): Key column 'id_wlasciciela' doesn't exist in table
mysql> create table izba( adres_budynku int not null, nazwa_izby int not null, primary key(adres_budynku, nazwa_izby), metraz int unsigned, wlasciciel int null, foreign key(id_wlasciciela) references postac(id_postaci) on delete cascade);
ERROR 1072 (42000): Key column 'id_wlasciciela' doesn't exist in table
mysql> create table izba( adres_budynku int not null, nazwa_izby int not null, primary key(adres_budynku, nazwa_izby), metraz int unsigned, wlasciciel int null, foreign key(wlasciciel) references postac(id_postaci) on delete cascade);
Query OK, 0 rows affected (0.14 sec)

mysql> desc izba;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| adres_budynku | int          | NO   | PRI | NULL    |       |
| nazwa_izby    | int          | NO   | PRI | NULL    |       |
| metraz        | int unsigned | YES  |     | NULL    |       |
| wlasciciel    | int          | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

mysql> drop table izba;
Query OK, 0 rows affected (0.02 sec)

mysql> create table izba( adres_budynku int not null, nazwa_izby varchar(40) not null, primary key(adres_budynku, nazwa_izby), metraz int unsigned, wlasciciel int null, foreign key(wlasciciel) references postac(id_postaci) on dele
te cascade);
Query OK, 0 rows affected (0.06 sec)

mysql> insert into values(1,"spizarnia",25,5);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'values(1,"spizarnia",25,5)' at line 1
mysql> insert into izba values(1,"spizarnia",25,5);
Query OK, 1 row affected (0.01 sec)

mysql> select * from izba;
+---------------+------------+--------+------------+
| adres_budynku | nazwa_izby | metraz | wlasciciel |
+---------------+------------+--------+------------+
|             1 | spizarnia  |     25 |          5 |
+---------------+------------+--------+------------+
1 row in set (0.00 sec)

mysql> create table przetwory (
    -> id_przetworu int primary key auto_increment not null,
    -> rok_produkcji date,
    -> id_wykonawcy int,
    -> foreign key(id_wykonawcy) references postac(id_postaci) on delete cascade,
    -> dodatek varchar(40),
    -> id_konsumenta int,
    -> foreign key(id_konsumenta) references postac(id_postaci) on delete cascade);
Query OK, 0 rows affected (0.11 sec)

mysql> alter table przetwory alter rok_produkcji set default '1654';
ERROR 1067 (42000): Invalid default value for 'rok_produkcji'
mysql> alter table przetwory alter 'rok_produkcji' set default '1654';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''rok_produkcji' set default '1654'' at line 1
mysql> alter table przetwory alter rok_produkcji set default "1654";
ERROR 1067 (42000): Invalid default value for 'rok_produkcji'
mysql> alter table przetwory alter rok_produkcji set default "1654-01-01";
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> delete from przetwory where id_przetworu=1;
Query OK, 0 rows affected (0.00 sec)

mysql> alter table przetwory alter column rok_produkcji year();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'year()' at line 1
mysql> alter table przetwory alter column rok_produkcji year;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'year' at line 1
mysql> alter table przetwory alter column rok_produkcji year(4);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'year(4)' at line 1
mysql> alter table przetwory alter column rok_produkcji int;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'int' at line 1
mysql> alter table przetwory modify column rok_produkcji year(4);
Query OK, 0 rows affected, 1 warning (0.20 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> desc przetwory;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| id_przetworu  | int         | NO   | PRI | NULL    | auto_increment |
| rok_produkcji | year        | YES  |     | NULL    |                |
| id_wykonawcy  | int         | YES  | MUL | NULL    |                |
| dodatek       | varchar(40) | YES  |     | NULL    |                |
| id_konsumenta | int         | YES  | MUL | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> alter table przetwory alter rok_produkcji set default '1654';
ERROR 1067 (42000): Invalid default value for 'rok_produkcji'
mysql> alter table przetwory alter rok_produkcji set default 1654;
ERROR 1067 (42000): Invalid default value for 'rok_produkcji'
mysql> alter table przetwory modify column rok_produkcji int;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table przetwory alter rok_produkcji set default 1654;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table przetwory alter dodatek set default 'papryczka chilli';
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table izba add kolor varchar(40) after metraz;
Query OK, 0 rows affected (0.21 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table izba alter kolor set default 'czarny';
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc izba;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| adres_budynku | int          | NO   | PRI | NULL    |       |
| nazwa_izby    | varchar(40)  | NO   | PRI | NULL    |       |
| metraz        | int unsigned | YES  |     | NULL    |       |
| kolor         | varchar(40)  | YES  |     | czarny  |       |
| wlasciciel    | int          | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
5 rows in set (0.04 sec)

mysql> alter table izba rename column kolor to kolor_izby;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc izba
    -> ;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| adres_budynku | int          | NO   | PRI | NULL    |       |
| nazwa_izby    | varchar(40)  | NO   | PRI | NULL    |       |
| metraz        | int unsigned | YES  |     | NULL    |       |
| kolor_izby    | varchar(40)  | YES  |     | czarny  |       |
| wlasciciel    | int          | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> insert into przetwory
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> desc przetwory;
+---------------+-------------+------+-----+------------------+----------------+
| Field         | Type        | Null | Key | Default          | Extra          |
+---------------+-------------+------+-----+------------------+----------------+
| id_przetworu  | int         | NO   | PRI | NULL             | auto_increment |
| rok_produkcji | int         | YES  |     | 1654             |                |
| id_wykonawcy  | int         | YES  | MUL | NULL             |                |
| dodatek       | varchar(40) | YES  |     | papryczka chilli |                |
| id_konsumenta | int         | YES  | MUL | NULL             |                |
+---------------+-------------+------+-----+------------------+----------------+
5 rows in set (0.01 sec)

mysql> select * from postac;
+------------+----------+---------+------------+------+
| id_postaci | nazwa    | rodzaj  | data_ur    | wiek |
+------------+----------+---------+------------+------+
|          1 | Bjorn    | wiking  | 1700-10-23 |  323 |
|          2 | Drozd    | ptak    | 2022-03-19 |    1 |
|          3 | Tesciowa | kobieta | 1960-05-11 |   88 |
|          5 | Bjorn    | wiking  | 1990-06-23 |   33 |
+------------+----------+---------+------------+------+
4 rows in set (0.00 sec)

mysql> insert into przetwory values(1, 2019, 3, 'bigos',,5);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',5)' at line 1
mysql> insert into przetwory values(1, 2019, 3, 'bigos',default,5);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into przetwory values(1, 2019, 3, 'bigos','papryczka chilli',5);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> alter table przetwory add column zawartosc varchar(40) after id_wykonawcy;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc przetwory;
+---------------+-------------+------+-----+------------------+----------------+
| Field         | Type        | Null | Key | Default          | Extra          |
+---------------+-------------+------+-----+------------------+----------------+
| id_przetworu  | int         | NO   | PRI | NULL             | auto_increment |
| rok_produkcji | int         | YES  |     | 1654             |                |
| id_wykonawcy  | int         | YES  | MUL | NULL             |                |
| zawartosc     | varchar(40) | YES  |     | NULL             |                |
| dodatek       | varchar(40) | YES  |     | papryczka chilli |                |
| id_konsumenta | int         | YES  | MUL | NULL             |                |
+---------------+-------------+------+-----+------------------+----------------+
6 rows in set (0.03 sec)

mysql> insert into przetwory values(1, 2019, 3, 'bigos',,5);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',5)' at line 1
mysql> insert into przetwory values(1, 2019, 3, 'bigos','papryczka chilli',5);
Query OK, 1 row affected (0.00 sec)

mysql> select * from przetwory;
+--------------+---------------+--------------+-----------+------------------+---------------+
| id_przetworu | rok_produkcji | id_wykonawcy | zawartosc | dodatek          | id_konsumenta |
+--------------+---------------+--------------+-----------+------------------+---------------+
|            1 |          2019 |            3 | bigos     | papryczka chilli |             5 |
+--------------+---------------+--------------+-----------+------------------+---------------+
1 row in set (0.00 sec)
