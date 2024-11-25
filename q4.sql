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
