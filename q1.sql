SELECT 
    Company,
    Employee,
    PayRun,
    Year,
    Period,
    DateBeg,
    DateEnd,
    PayDate,
    NetPayment
FROM 
    PY_PayRun
WHERE 
    Employee = ? -- Código del colaborador
    AND Period != '00'  -- Aseguramos que es una nómina regular
ORDER BY 
    PayRun DESC
LIMIT 1;
