-- 1- Obtener la última nómina regular del colaborador.

SELECT *
FROM 
    PY_PayRun
WHERE 
    Employee = 383
ORDER BY 
    PayRun DESC
LIMIT 1;



--2 Obtener el monto promedio del concepto 1000 del colaborador del año 2022.

SELECT 
    AVG(pd.Amount) AS Promedio
FROM 
    PY_PayRunDetail pd
JOIN PY_PayRun py 

ON pd.PayRun = py.PayRun
AND pd.Company = py.Company

WHERE 
    pd.Employee = 383
    AND pd.WageType = '1000' 
    AND py.Year = 2022;


-- 3- Obtener la lista de conceptos con sus códigos y textos ordenados por código de concepto. 
-- Considerar que los textos pueden estar definidos a nivel país y/o a nivel de compañía tomando como prioridad los de la compañía.



-- 4- Determinar si la nómina del colaborador inmediatamente anterior a la Year=2023, Period=12 es especial.

SELECT    PayRun,  Year,  Period,
    CASE 
        WHEN Period = '00' THEN 'Especial'
        ELSE 'Regular'
    END AS PayType
    
FROM   PY_PayRun
WHERE Employee = 383
AND Year < 2023 AND Period = '12'

LIMIT 1;


-- 5- Insertar la cabecera de una nómina especial con PayDate=2023-01-01, PayReason="BONI", User="system" y TimeStamp="fecha/hora actual" 
-- para el colaborador considerando que si ya existe el registro se debe reemplazar por el nuevo.

insert INTO PY_PayRun (
    Company, Employee, PayRun, Year, Period, DateBeg, DateEnd, PayDate, PayReason, NetPayment, User, TimeStamp
) VALUES (
    'COLT',         -- Company
    383,          -- Employee
    13,              -- PayRun 
    0,              -- Year
    '00',           -- Period
    '2022-12-31',   -- DateBeg (inicio periodo)
    '2022-12-31',   -- DateEnd (fin período) 
    '2023-01-01',   -- (PayDate) Fecha de pago
    'BONI',         -- PayReason
    0.00,           -- (NetPayment) Monto total
    'system',       -- User
    CURRENT_TIMESTAMP 
);


-- 6- Eliminar la cabecera de la última nómina del colaborador.

DELETE FROM PY_PayRun
WHERE Employee = 383 

ORDER BY PayRun DESC
LIMIT 1;

-- 7- Obtener la lista de corridas de nómina del colaborador cuyos períodos incluyen (todo o en parte) al mes de mayo 2022.

SELECT * FROM PY_PayRun
WHERE Employee = 383
  AND (
    (Year = 2022 AND Period = '05')     OR     (Year = 2022 AND Period = '04' AND DateEnd >= '2022-05-01') 
        OR 
    (Year = 2022 AND Period = '06' AND DateBeg <= '2022-05-31')   
);

-- 8- Obtener los distintos salarios (concepto 1000) del colaborador durante 2022, se debe incluir el monto del salario y desde que fecha fue válido.

SELECT pd.Amount AS SalaryAmount, pr.DateBeg AS Fecha

FROM PY_PayRunDetail pd
JOIN PY_PayRun pr 
ON pd.Company = pr.Company 
AND pd.Employee = pr.Employee AND pd.PayRun = pr.PayRun

WHERE pd.WageType = '1000' 
  AND pr.Employee = 383
  AND pr.Year = 2022
  
ORDER BY pr.DateBeg;