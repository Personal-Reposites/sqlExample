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
