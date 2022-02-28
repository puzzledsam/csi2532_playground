CREATE TABLE schema_migrations ( 
  migration varchar(255), 
  migrated_at time, 
  PRIMARY KEY (migration) 
);

INSERT INTO schema_migrations (migration, migrated_at) VALUES 
('20220226130000-create-athletes.sql', '2022-02-27 13:30:00');

INSERT INTO schema_migrations (migration, migrated_at) VALUES 
('20220227143500-create-migrations.sql', '2020-02-27 14:35:00');