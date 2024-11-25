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