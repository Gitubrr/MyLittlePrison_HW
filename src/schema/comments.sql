ALTER TABLE Prisoner COMMENT = 'Prisoner info';
ALTER TABLE Criminal_Code_Article COMMENT = 'Criminal code articles';
ALTER TABLE Prisoner_Article COMMENT = 'Prisoner-article links';
ALTER TABLE Conscription COMMENT = 'Prisoner records (penalties/rewards)';
ALTER TABLE Punishment COMMENT = 'Disciplinary punishments';
ALTER TABLE Employee COMMENT = 'Staff info';
ALTER TABLE Duty_Schedule COMMENT = 'Work schedules';
ALTER TABLE Visit COMMENT = 'Visit logs';

ALTER TABLE Prisoner MODIFY COLUMN Block INTEGER COMMENT 'Block number';
ALTER TABLE Prisoner MODIFY COLUMN Room INTEGER COMMENT 'Cell number';
ALTER TABLE Punishment MODIFY COLUMN End_Date DATE COMMENT 'Punishment end date';
ALTER TABLE Visit MODIFY COLUMN Document VARCHAR(50) COMMENT 'Visitor ID document';