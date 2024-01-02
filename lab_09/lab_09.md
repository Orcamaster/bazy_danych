# lab 09

## 1.1
```sql
DELIMITER //
CREATE TRIGGER kreatura_before_insert
BEFORE INSERT ON kreatura
FOR EACH ROW
BEGIN
	IF NEW.waga <= 0
	THEN
	SET NEW.waga = 1;
	END IF;
END
//

insert into kreatura values(101, 'ryba', 'ryba', '2020-03-03', 0, 0);
delete from kreatura where idKreatury = 101;
```
