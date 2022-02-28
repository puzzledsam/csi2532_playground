ALTER TABLE athletes 
RENAME COLUMN identified_gender TO gender;

INSERT INTO schema_migrations (migration, migrated_at) VALUES 
('20220227144500-update-athletes.sql', '2022-02-27 14:45:00');