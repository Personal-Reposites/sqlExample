SELECT pd.Amount AS SalaryAmount, pr.DateBeg AS ValidFrom
FROM PY_PayRunDetail pd
JOIN PY_PayRun pr ON pd.Company = pr.Company AND pd.Employee = pr.Employee AND pd.PayRun = pr.PayRun
WHERE pd.WageType = '1000'  -- Concepto 1000 (salario)
  AND pr.Employee = ?  -- Código del colaborador
  AND pr.Year = 2022  -- Año 2022
ORDER BY pr.DateBeg;
