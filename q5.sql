INSERT INTO PY_PayRun (Company, Employee, PayRun, Year, Period, DateBeg, DateEnd, PayDate, PayReason, NetPayment, User, TimeStamp)
VALUES
    (?, ?, 0, 2023, '00', '2023-01-01', '2023-01-01', '2023-01-01', 'BONI', 0.00, 'system', CURRENT_TIMESTAMP)
ON DUPLICATE KEY UPDATE
    PayDate = VALUES(PayDate),
    PayReason = VALUES(PayReason),
    NetPayment = VALUES(NetPayment),
    User = VALUES(User),
    TimeStamp = VALUES(TimeStamp);
