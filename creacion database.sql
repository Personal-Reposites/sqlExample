creacion database

CREATE DATABASE IF NOT EXISTS company_db; //COLT
USE company_db;



///////////////////////////////


CREATE TABLE IF NOT EXISTS PY_PayRun (
    Company CHAR(5) NOT NULL,
    Employee INT UNSIGNED NOT NULL,
    PayRun INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Year INT UNSIGNED NOT NULL,
    Period CHAR(2) NOT NULL,
    DateBeg DATE NOT NULL,
    DateEnd DATE NOT NULL,
    PayDate DATE NOT NULL,
    PayReason CHAR(4) NOT NULL,
    NetPayment DECIMAL(14, 2) NOT NULL,
    User CHAR(10) NOT NULL,
    TimeStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Company, Employee, PayRun)
);

CREATE TABLE IF NOT EXISTS PY_PayRunDetail (
    Company CHAR(5) NOT NULL,
    Employee INT UNSIGNED NOT NULL,
    PayRun INT UNSIGNED NOT NULL,
    WageType CHAR(4) NOT NULL,
    Amount DECIMAL(14, 2) NOT NULL,
    PRIMARY KEY (Company, Employee, PayRun, WageType),
    FOREIGN KEY (Company, Employee, PayRun) REFERENCES PY_PayRun (Company, Employee, PayRun)
);

CREATE TABLE IF NOT EXISTS HR_Employees (
    Company CHAR(5) NOT NULL,
    Employee INT UNSIGNED NOT NULL,
    FirstName CHAR(20) NOT NULL,
    LastName CHAR(20) NOT NULL,
    LastPayRun INT UNSIGNED NOT NULL,
    PRIMARY KEY (Company, Employee)
);

CREATE TABLE IF NOT EXISTS PY_WageTypesByCompaniesTexts (
    Company CHAR(5) NOT NULL,
    WageType CHAR(4) NOT NULL,
    Language CHAR(2) NOT NULL,
    Text CHAR(50) NOT NULL,
    PRIMARY KEY (Company, WageType, Language)
);

CREATE TABLE IF NOT EXISTS PY_WageTypesTexts (
    Country CHAR(2) NOT NULL,
    WageType CHAR(4) NOT NULL,
    Language CHAR(2) NOT NULL,
    Text CHAR(50) NOT NULL,
    PRIMARY KEY (Country, WageType, Language)
);



////////////////////////////////////

-- Insertando datos en PY_PayRun (cabeceras de nómina)
INSERT INTO PY_PayRun (Company, Employee, Year, Period, DateBeg, DateEnd, PayDate, PayReason, NetPayment, User)
VALUES
    ('COLT', 383, 2022, '01', '2022-01-01', '2022-01-31', '2022-01-31', 'REGU', 1500.00, 'system'),
    ('COLT', 383, 2022, '02', '2022-02-01', '2022-02-28', '2022-02-28', 'REGU', 1500.00, 'system'),
    ('COLT', 383, 2022, '03', '2022-03-01', '2022-03-31', '2022-03-31', 'REGU', 1500.00, 'system'),
    ('COLT', 383, 2022, '04', '2022-04-01', '2022-04-30', '2022-04-30', 'REGU', 1500.00, 'system'),
    ('COLT', 383, 2022, '05', '2022-05-01', '2022-05-31', '2022-05-31', 'REGU', 1500.00, 'system'),
    ('COLT', 383, 2022, '06', '2022-06-01', '2022-06-30', '2022-06-30', 'REGU', 1500.00, 'system'),
    ('COLT', 383, 2022, '07', '2022-07-01', '2022-07-31', '2022-07-31', 'REGU', 1500.00, 'system'),
    ('COLT', 383, 2022, '08', '2022-08-01', '2022-08-31', '2022-08-31', 'REGU', 1500.00, 'system'),
    ('COLT', 383, 2022, '09', '2022-09-01', '2022-09-30', '2022-09-30', 'REGU', 1500.00, 'system'),
    ('COLT', 383, 2022, '10', '2022-10-01', '2022-10-31', '2022-10-31', 'REGU', 1500.00, 'system'),
    ('COLT', 383, 2022, '11', '2022-11-01', '2022-11-30', '2022-11-30', 'REGU', 1500.00, 'system'),
    ('COLT', 383, 2022, '12', '2022-12-01', '2022-12-31', '2022-12-31', 'REGU', 1500.00, 'system');

-- Insertando datos en PY_PayRunDetail (detalles de nómina)
INSERT INTO PY_PayRunDetail (Company, Employee, PayRun, WageType, Amount)
VALUES
    ('COLT', 383, 1, '1000', 1500.00),
    ('COLT', 383, 2, '1000', 1500.00),
    ('COLT', 383, 3, '1000', 1500.00),
    ('COLT', 383, 4, '1000', 1500.00),
    ('COLT', 383, 5, '1000', 1500.00),
    ('COLT', 383, 6, '1000', 1500.00),
    ('COLT', 383, 7, '1000', 1500.00),
    ('COLT', 383, 8, '1000', 1500.00),
    ('COLT', 383, 9, '1000', 1500.00),
    ('COLT', 383, 10, '1000', 1500.00),
    ('COLT', 383, 11, '1000', 1500.00),
    ('COLT', 383, 12, '1000', 1500.00);

-- Insertando datos en HR_Employees (empleados)
INSERT INTO HR_Employees (Company, Employee, FirstName, LastName, LastPayRun)
VALUES
    ('COLT', 383, 'Juan', 'Pérez', 12);

-- Insertando datos en PY_WageTypesByCompaniesTexts (conceptos de la compañía)
INSERT INTO PY_WageTypesByCompaniesTexts (Company, WageType, Language, Text)
VALUES
    ('COLT', '1000', 'ES', 'Salario mensual');

-- Insertando datos en PY_WageTypesTexts (conceptos del país)
INSERT INTO PY_WageTypesTexts (Country, WageType, Language, Text)
VALUES
    ('DO', '1000', 'ES', 'Salario mensual');
