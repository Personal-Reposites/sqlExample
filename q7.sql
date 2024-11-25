SELECT PayRun, Year, Period, DateBeg, DateEnd, PayDate
FROM PY_PayRun
WHERE Employee = ?  -- Código del colaborador
  AND (
    (Year = 2022 AND Period = '05')  -- Mayo 2022
    OR 
    (Year = 2022 AND Period = '04' AND DateEnd >= '2022-05-01')  -- Abril 2022 que cubre mayo
    OR 
    (Year = 2022 AND Period = '06' AND DateBeg <= '2022-05-31')  -- Junio 2022 que cubre mayo
  );
