SET FOREIGN_KEY_CHECKS = 0; 
DROP TABLE IF EXISTS Prisoner;
DROP TABLE IF EXISTS Criminal_Code_Article;
DROP TABLE IF EXISTS Prisoner_Article;
DROP TABLE IF EXISTS Conscription;
DROP TABLE IF EXISTS Punishment;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Duty_Schedule;
DROP TABLE IF EXISTS Visit;
SET FOREIGN_KEY_CHECKS = 1;

DROP FUNCTION IF EXISTS fn_check_prisoner_id;
DROP FUNCTION IF EXISTS fn_get_remaining_days;
DROP FUNCTION IF EXISTS fn_get_violation_count;
DROP FUNCTION IF EXISTS fn_get_prisoner_full_name;

DROP PROCEDURE IF EXISTS pr_transfer_prisoner;
DROP PROCEDURE IF EXISTS pr_add_conscription_with_punishment;
DROP PROCEDURE IF EXISTS pr_release_prisoner;

DROP TRIGGER IF EXISTS trg_update_prisoner_term;
DROP TRIGGER IF EXISTS trg_check_prisoner_age;
DROP TRIGGER IF EXISTS trg_log_employee_job_change;

DROP VIEW IF EXISTS v_prisoner_details;
DROP VIEW IF EXISTS v_block_statistics;
DROP VIEW IF EXISTS v_today_visits;