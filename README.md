## Playground CSI2532

Ce playground est utilisé lors des laboratoires du cours CSI2532

# Lab 9

**Exercice 1**

```sql
CREATE TABLE Book(
	Bookid int,
	Bookname Varchar(20),
	Authorid int,
	Amount Numeric(7, 2),
	Rating int,
	Booktype Varchar(25),
	CONSTRAINT book_pkey PRIMARY KEY (Bookid),
	CONSTRAINT authorid_fkey FOREIGN KEY(Authorid) REFERENCES Author(Authorid) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT rating_between CHECK (Rating > 1 AND Rating < 10),
	CONSTRAINT amount_not_zero CHECK (Rating > 0),
	CONSTRAINT book_types CHECK (
		Booktype IN (
			'Fiction-adulte',
			'Non-fiction-adulte',
			'Fiction-jeunesse',
			'Non-Fiction-jeunesse'
		)
	)
);
```

---

**Exercice 2**

i)
```sql
CREATE TABLE Author(
	Authorid int,
	Authorname varchar(20)
);
```

ii)
```sql
CREATE ASSERTION total_author_and_books AS CHECK ( 
    (SELECT count(*) FROM book) + (SELECT count(*) FROM author) < 10000
);
```

---

**Exercice 3**

```sql
CREATE TRIGGER check_rating BEFORE UPDATE ON Book FOR EACH ROW EXECUTE PROCEDURE check_book_rating();
```

---

**Exercice 4**

i)
```sql
ALTER TABLE Author ADD COLUMN author_sum_rating DEFAULT O;
```

ii)
```sql
CREATE TRIGGER update_author_rating AFTER UPDATE ON Author
FOR EACH ROW WHEN (Author.author_sum_rating != 0) EXECUTE PROCEDURE calculate_author_rating_sum();
```
