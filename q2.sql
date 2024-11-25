SELECT 
    AVG(pd.Amount) AS AverageAmount
FROM 
    PY_PayRunDetail pd
JOIN 
    PY_PayRun py ON pd.PayRun = py.PayRun AND pd.Company = py.Company
WHERE 
    pd.Employee = ?  -- Código del colaborador
    AND pd.WageType = '1000'  -- Concepto 1000
    AND py.Year = 2022;  -- Año 2022
