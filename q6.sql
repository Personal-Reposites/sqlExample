DELETE FROM PY_PayRun
WHERE Company = ?  -- Código de la compañía
  AND Employee = ?  -- Código del colaborador
  ORDER BY PayRun DESC
  LIMIT 1;
