## Playground CSI2532

Ce playground est utilisé lors des laboratoires du cours CSI2532

# Lab 6

**1. Lister les name et birthplace de tous les artists**

```sql
SELECT name, birthplace
FROM artists;
```

Résultat:

```
     name     |  birthplace
--------------+---------------
 Caravaggio   | Milan
 Smith        | Ottawa
 Picasso      | Malaga
 Leonardo     | Florence
 Michelangelo | Arezzo
 Josefa       | Seville
 Hans Hofmann | Weisenburg
 John         | San Francisco
(8 rows)
```
---
**2. Lister le title et le price de toutes les artworks après 1600.**

```sql
SELECT title, price
FROM artworks
WHERE year > 1600;
```

Résultat:

```
      title      |  price
-----------------+----------
 Blue            | 10000.00
 Waves           |  4000.00
 Three Musicians | 11000.00
(3 rows)
```
---
**3. Lister le title et le type de toutes les artworks qui ont été peintes en 2000 ou peintes par Picasso.**
   
```sql
SELECT title, type
FROM artworks
WHERE year = 2000 or artist_name = 'Picasso';
```

Résultat:

```
    title      |  type
----------------+--------
Blue            | Modern
Waves           |
Three Musicians | Modern
(3 rows)
```
---
**4. Lister les name et birthplace de tous les artists nés entre 1880 et 1930. (ASTUCE: EXTRACT(YEAR FROM dateofbirth) vous donne l'année à partir d'un attribut DATE)**

```sql
SELECT name, birthplace
FROM artists, EXTRACT (YEAR from dateofbirth) as year
WHERE year < 1930 AND year > 1880;
```

Résultat:

```
  name   |  birthplace
---------+---------------
 Picasso | Malaga
 John    | San Francisco
(2 rows)
```
---
**5. Lister les name et le country de naissance de tous les artists dont le style de peinture est Modern, Baroque or Renaissance. (ASTUCE: utilisez le mot-clé IN).**

```sql
SELECT name, country 
FROM artists
WHERE name IN (SELECT artist_name FROM artworks WHERE type = 'Modern' OR type = 'Baroque' OR type = 'Renaissance');
```

Résultat:

```
    name    | country
------------+---------
 Caravaggio |
 Smith      |
 Picasso    |
(3 rows)
```
---
**6. Lister tous les détails des artworks dans la base de données, triés par title.**

```sql
SELECT * FROM artworks
ORDER BY title;
```

Résultat:

```
      title      | year |  type   |  price   | artist_name
-----------------+------+---------+----------+-------------
 Blue            | 2000 | Modern  | 10000.00 | Smith
 The Cardsharps  | 1594 | Baroque | 40000.00 | Caravaggio
 Three Musicians | 1921 | Modern  | 11000.00 | Picasso
 Waves           | 2000 |         |  4000.00 | Smith
(4 rows)
```
---
**7. Lister les name et les customer ids de tous les customers qui aiment Picasso.**

```sql
SELECT name, id
FROM customers
WHERE id IN (SELECT customer_id FROM likeartists WHERE artist_name = 'Picasso');
```

Résultat:

```
 name  | id
-------+----
 Emre  |  4
 Saeid |  5
(2 rows)
```
---
**8. Lister les name de tous les customers qui aiment les artistes de style Renaissance et dont le price est supérieur à 30000.**

```sql
SELECT name
FROM customers
WHERE id IN (SELECT customer_id FROM likeartists 
WHERE artist_name IN (SELECT artist_name FROM artworks
WHERE type = 'Renaissance' AND price > 30000));
```

Résultat:

```
 name
------
(0 rows)
```
