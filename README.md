## Playground CSI2532

Ce playground est utilisé lors des laboratoires du cours CSI2532

## Lab 4

1. Les professeurs peuvent enseigner le même cours sur plusieurs semestres et seule la plus récente doit être enregistrée.
![Diagramme 1](https://github.com/puzzledsam/csi2532_playground/raw/lab4/q1.png)
```sql
CREATE TABLE professor (
    ssn int,
    PRIMARY KEY (ssn)
);

CREATE TABLE course (
    courseid int,
    PRIMARY KEY (courseid)
);

CREATE TABLE teaches (
    semester int,
    ssn int,
    courseid int,
    PRIMARY KEY (ssn, courseid),
    FOREIGN KEY (ssn) REFERENCES professor,
    FOREIGN KEY (courseid) REFERENCES course
);
```
---
3. Chaque professeur enseigne exactement un cours (ni plus, ni moins).
![Diagramme 3](https://github.com/puzzledsam/csi2532_playground/raw/lab4/q3.png)
```sql
CREATE TABLE professor (
    ssn int,
    PRIMARY KEY (ssn)
);

CREATE TABLE course (
    courseid int,
    PRIMARY KEY (courseid)
);

CREATE TABLE teaches (
    semester int,
    ssn int NOT NULL,
    courseid int NOT NULL,
    PRIMARY KEY (ssn, courseid),
    FOREIGN KEY (ssn) REFERENCES professor,
    FOREIGN KEY (courseid) REFERENCES course
);
```
---
5. Les professeurs peuvent enseigner le même cours sur plusieurs semestres et chaque doit être enregistrée.
![Diagramme 5](https://github.com/puzzledsam/csi2532_playground/raw/lab4/q5.png)
```sql
CREATE TABLE professor (
    ssn int,
    PRIMARY KEY (ssn)
);

CREATE TABLE course (
    courseid int,
    PRIMARY KEY (courseid)
);

CREATE TABLE teaches (
    semesterid int,
    ssn int NOT NULL,
    courseid int NOT NULL,
    PRIMARY KEY (semesterid),
    FOREIGN KEY (ssn) REFERENCES professor,
    FOREIGN KEY (courseid) REFERENCES course
);
```
---
6. Supposons maintenant que certains cours puissent être enseignés conjointement par une équipe de professeurs, mais il est possible qu'aucun professeur dans une équipe ne puisse enseigner le cours. Modélisez cette situation en introduisant des ensembles d'entités et des ensembles de relations supplémentaires si nécessaire.
![Diagramme 6](https://github.com/puzzledsam/csi2532_playground/raw/lab4/q6.png)
```sql
CREATE TABLE professor (
    ssn int,
    PRIMARY KEY (ssn)
);

CREATE TABLE groups (
    groupid int,
    PRIMARY KEY (groupid)
);

CREATE TABLE member_of (
    ssn int,
    groupid int,
    FOREIGN KEY (ssn) REFERENCES professor,
    FOREIGN KEY (groupid) REFERENCES groups
);

CREATE TABLE course (
    courseid int,
    PRIMARY KEY (courseid)
);

CREATE TABLE teaches (
    semester int,
    groupid int,
    courseid int,
    PRIMARY KEY (groupid, courseid),
    FOREIGN KEY (groupid) REFERENCES groups,
    FOREIGN KEY (courseid) REFERENCES course
);
```
