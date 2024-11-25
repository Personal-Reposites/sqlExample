SELECT 
    PayRun,
    Year,
    Period,
    CASE 
        WHEN Period = '00' THEN 'Especial'
        ELSE 'Regular'
    END AS PayType
FROM 
    PY_PayRun
WHERE 
    Employee = ?  -- Código del colaborador
    AND ((Year = 2023 AND Period = '11') OR (Year = 2022 AND Period = '12'))  -- Filtramos noviembre 2023 o diciembre 2022
ORDER BY 
    Year DESC, Period DESC
LIMIT 1;
