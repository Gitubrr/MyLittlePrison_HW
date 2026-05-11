CREATE TABLE IF NOT EXISTS Prisoner 
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
);

CREATE TABLE IF NOT EXISTS Criminal_Code_Article 
(
    Article_ID   INTEGER     NOT NULL,
    Article_Code VARCHAR(10) NOT NULL,
    Description  TEXT        NOT NULL,
    CONSTRAINT Criminal_Code_Article_PK PRIMARY KEY (Article_ID)
);

CREATE TABLE IF NOT EXISTS Prisoner_Article 
(
    Prisoner_ID     INTEGER NOT NULL,
    Article_ID      INTEGER NOT NULL,
    Conviction_Date DATE    NOT NULL,
    Sentence_Years  INTEGER,
    CONSTRAINT Prisoner_Article_PK PRIMARY KEY (Prisoner_ID, Article_ID)
);

CREATE TABLE IF NOT EXISTS Conscription 
(
    Conscription_ID INTEGER     NOT NULL,
    Prisoner_ID     INTEGER     NOT NULL,
    Date            DATE        NOT NULL,
    Description     VARCHAR(50),
    CONSTRAINT Conscription_PK PRIMARY KEY (Conscription_ID)
);

CREATE TABLE IF NOT EXISTS Punishment 
(
    Punishment_ID    INTEGER     NOT NULL,
    Conscription_ID  INTEGER     NOT NULL UNIQUE,
    Start_Date       DATE        NOT NULL,
    End_Date         DATE        NOT NULL,
    Description      VARCHAR(50),
    CONSTRAINT Punishment_PK PRIMARY KEY (Punishment_ID)
);

CREATE TABLE IF NOT EXISTS Employee 
(
    Employee_ID      INTEGER     NOT NULL,
    Last_Name        VARCHAR(20) NOT NULL,
    First_Name       VARCHAR(20) NOT NULL,
    Job_Title        VARCHAR(20) NOT NULL,
    Date_Of_Admission DATE       NOT NULL,
    CONSTRAINT Employee_PK PRIMARY KEY (Employee_ID)
);

CREATE TABLE IF NOT EXISTS Duty_Schedule 
(
    Duty_Schedule_ID INTEGER NOT NULL,
    Employee_ID      INTEGER NOT NULL,
    Date             DATE    NOT NULL,
    Start_Time       TIME    NOT NULL,
    End_Time         TIME    NOT NULL,
    CONSTRAINT Duty_Schedule_PK PRIMARY KEY (Duty_Schedule_ID)
);

CREATE TABLE IF NOT EXISTS Visit 
(
    Visit_ID           INTEGER     NOT NULL,
    Prisoner_ID        INTEGER     NOT NULL,
    Employee_ID        INTEGER     NOT NULL,
    Visitor_Last_Name  VARCHAR(20) NOT NULL,
    Visitor_First_Name VARCHAR(20) NOT NULL,
    Document           VARCHAR(50) NOT NULL,
    Visit_Date         DATE        NOT NULL,
    Description        VARCHAR(50),
    CONSTRAINT Visit_PK PRIMARY KEY (Visit_ID)
);
