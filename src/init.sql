CREATE DATABASE IF NOT EXISTS prison_db;
USE prison_db;

SET FOREIGN_KEY_CHECKS = 0;

SOURCE src/maintenance/drop_all.sql;
SOURCE src/schema/tables.sql;
SOURCE src/schema/foreign_keys.sql;
SOURCE src/schema/constraints.sql;
SOURCE src/schema/comments.sql;

SOURCE src/indexes/indexes.sql;
SOURCE src/data/data.sql;

SOURCE src/business_logic/functions.sql;
SOURCE src/business_logic/procedures.sql;
SOURCE src/business_logic/triggers.sql;
SOURCE src/business_logic/views.sql;

SET FOREIGN_KEY_CHECKS = 1;

SOURCE src/queries/queries.sql