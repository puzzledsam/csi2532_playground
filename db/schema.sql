CREATE TABLE athletes (
  id int,
  identifier varchar(50),
  created timestamp,
  modified timestamp,
  name varchar(50),
  dob date,
  identified_gender varchar(6),
  PRIMARY KEY (id)
);

CREATE TABLE schema_migrations ( 
  migration varchar(255), 
  migrated_at time, 
  PRIMARY KEY (migration) 
);

ALTER TABLE athletes 
RENAME COLUMN identified_gender TO gender;