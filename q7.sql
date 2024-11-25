-- 7- Obtener la lista de corridas de nómina del colaborador cuyos períodos incluyen (todo o en parte) al mes de mayo 2022.

SELECT * FROM PY_PayRun
WHERE Employee = 383
  AND (
    (Year = 2022 AND Period = '05')     OR     (Year = 2022 AND Period = '04' AND DateEnd >= '2022-05-01') 
        OR 
    (Year = 2022 AND Period = '06' AND DateBeg <= '2022-05-31')   
);