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

CREATE TABLE Prisoner 
    (
        Prisoner_ID   INTEGER     NOT NULL,
        Last_Name     VARCHAR(20) NOT NULL,
        First_Name    VARCHAR(20) NOT NULL,
        Date_Of_Birth DATE        NOT NULL,
        Block         INTEGER     NOT NULL,
        Room          INTEGER     NOT NULL,
        Start_Of_Term DATE        NOT NULL,
        End_Of_Term   DATE        NOT NULL,
        CONSTRAINT Prisoner_PK PRIMARY KEY (Prisoner_ID)
    )
;

CREATE TABLE Criminal_Code_Article 
    (
        Article_ID   INTEGER     NOT NULL,
        Article_Code VARCHAR(10) NOT NULL,
        Description  TEXT        NOT NULL,
        CONSTRAINT Criminal_Code_Article_PK PRIMARY KEY (Article_ID)
    )
;

CREATE TABLE Prisoner_Article 
    (
        Prisoner_ID     INTEGER NOT NULL,
        Article_ID      INTEGER NOT NULL,
        Conviction_Date DATE    NOT NULL,
        Sentence_Years  INTEGER,
        CONSTRAINT Prisoner_Article_PK PRIMARY KEY (Prisoner_ID, Article_ID),
        CONSTRAINT Prisoner_Article_FK_Prisoner 
            FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID) ON DELETE CASCADE,
        CONSTRAINT Prisoner_Article_FK_Article 
            FOREIGN KEY (Article_ID) REFERENCES Criminal_Code_Article(Article_ID) ON DELETE CASCADE
    )
;

CREATE TABLE Conscription 
    (
        Conscription_ID INTEGER     NOT NULL,
        Prisoner_ID     INTEGER     NOT NULL,
        Date            DATE        NOT NULL,
        Description     VARCHAR(50),
        CONSTRAINT Conscription_PK PRIMARY KEY (Conscription_ID),
        CONSTRAINT Conscription_FK_Prisoner 
            FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID) ON DELETE CASCADE
    )
;

CREATE TABLE Punishment 
    (
        Punishment_ID    INTEGER     NOT NULL,
        Conscription_ID  INTEGER     NOT NULL UNIQUE,
        Start_Date       DATE        NOT NULL,
        End_Date         DATE        NOT NULL,
        Description      VARCHAR(50),
        CONSTRAINT Punishment_PK PRIMARY KEY (Punishment_ID),
        CONSTRAINT Punishment_FK_Conscription 
            FOREIGN KEY (Conscription_ID) REFERENCES Conscription(Conscription_ID) ON DELETE CASCADE,
        CONSTRAINT Punishment_Check_Dates CHECK (End_Date >= Start_Date)
    )
;

CREATE TABLE Employee 
    (
        Employee_ID      INTEGER     NOT NULL,
        Last_Name        VARCHAR(20) NOT NULL,
        First_Name       VARCHAR(20) NOT NULL,
        Job_Title        VARCHAR(20) NOT NULL,
        Date_Of_Admission DATE       NOT NULL,
        CONSTRAINT Employee_PK PRIMARY KEY (Employee_ID)
    )
;

CREATE TABLE Duty_Schedule 
    (
        Duty_Schedule_ID INTEGER NOT NULL,
        Employee_ID      INTEGER NOT NULL,
        Date             DATE    NOT NULL,
        Start_Time       TIME    NOT NULL,
        End_Time         TIME    NOT NULL,
        CONSTRAINT Duty_Schedule_PK PRIMARY KEY (Duty_Schedule_ID),
        CONSTRAINT Duty_Schedule_FK_Employee 
            FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID) ON DELETE CASCADE
    )
;

CREATE TABLE Visit 
    (
        Visit_ID           INTEGER     NOT NULL,
        Prisoner_ID        INTEGER     NOT NULL,
        Employee_ID        INTEGER     NOT NULL,
        Visitor_Last_Name  VARCHAR(20) NOT NULL,
        Visitor_First_Name VARCHAR(20) NOT NULL,
        Document           VARCHAR(50) NOT NULL,
        Visit_Date         DATE        NOT NULL,
        Description        VARCHAR(50),
        CONSTRAINT Visit_PK PRIMARY KEY (Visit_ID),
        CONSTRAINT Visit_FK_Prisoner 
            FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID) ON DELETE CASCADE,
        CONSTRAINT Visit_FK_Employee 
            FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID) ON DELETE CASCADE
    )
;