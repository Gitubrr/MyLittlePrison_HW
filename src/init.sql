CREATE DATABASE IF NOT EXISTS prison_db;
USE prison_db;
SOURCE src/scripts/schema.sql;
SOURCE src/scripts/indexes.sql;
SOURCE src/scripts/data.sql;