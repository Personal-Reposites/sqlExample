
-- 5- Insertar la cabecera de una nómina especial con PayDate=2023-01-01, PayReason="BONI", User="system" y TimeStamp="fecha/hora actual" 
-- para el colaborador considerando que si ya existe el registro se debe reemplazar por el nuevo.

insert INTO PY_PayRun (
    Company, Employee, PayRun, Year, Period, DateBeg, DateEnd, PayDate, PayReason, NetPayment, User, TimeStamp
) VALUES (
    'COLT',         -- Company
    383,          -- Employee
    13,              -- PayRun 
    0,              -- Year
    '00',           -- Period
    '2022-12-31',   -- DateBeg (inicio periodo)
    '2022-12-31',   -- DateEnd (fin período) 
    '2023-01-01',   -- (PayDate) Fecha de pago
    'BONI',         -- PayReason
    0.00,           -- (NetPayment) Monto total
    'system',       -- User
    CURRENT_TIMESTAMP 
);
