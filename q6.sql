-- 6- Eliminar la cabecera de la última nómina del colaborador.

DELETE FROM PY_PayRun
WHERE Employee = 383 

ORDER BY PayRun DESC
LIMIT 1;

