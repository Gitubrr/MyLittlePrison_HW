ALTER TABLE Punishment 
    ADD CONSTRAINT Punishment_Check_Dates CHECK (End_Date >= Start_Date);