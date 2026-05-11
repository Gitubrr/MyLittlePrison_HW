ALTER TABLE Prisoner_Article 
    ADD CONSTRAINT Prisoner_Article_FK_Prisoner 
        FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID) ON DELETE CASCADE,
    ADD CONSTRAINT Prisoner_Article_FK_Article 
        FOREIGN KEY (Article_ID) REFERENCES Criminal_Code_Article(Article_ID) ON DELETE CASCADE;

ALTER TABLE Conscription 
    ADD CONSTRAINT Conscription_FK_Prisoner 
        FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID) ON DELETE CASCADE;

ALTER TABLE Punishment 
    ADD CONSTRAINT Punishment_FK_Conscription 
        FOREIGN KEY (Conscription_ID) REFERENCES Conscription(Conscription_ID) ON DELETE CASCADE;

ALTER TABLE Duty_Schedule 
    ADD CONSTRAINT Duty_Schedule_FK_Employee 
        FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID) ON DELETE CASCADE;

ALTER TABLE Visit 
    ADD CONSTRAINT Visit_FK_Prisoner 
        FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID) ON DELETE CASCADE,
    ADD CONSTRAINT Visit_FK_Employee 
        FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID) ON DELETE CASCADE;