-- 1- Obtener la última nómina regular del colaborador.

SELECT *
FROM 
    PY_PayRun
WHERE 
    Employee = 383
ORDER BY 
    PayRun DESC
LIMIT 1;


