SELECT 
    wt.WageType, 
    COALESCE(cwt.Text, pwt.Text) AS ConceptText
FROM 
    PY_WageTypesByCompaniesTexts cwt
LEFT JOIN 
    PY_WageTypesTexts pwt ON cwt.WageType = pwt.WageType AND pwt.Country = ?  -- Código del país
WHERE 
    cwt.Company = ?  -- Código de la compañía
ORDER BY 
    wt.WageType;
