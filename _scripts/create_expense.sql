CREATE TABLE EXPENSE
(
    EXPENSE_ENTRY_ID INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    EXPENSE_DATE TIMESTAMP NOT NULL,
    RECEIPT VARCHAR(12) NOT NULL,
    EXPENSE_ID INTEGER NOT NULL,
    QUANTITY decimal(8,2),
    UNIT_ID INTEGER,
    EXPENSE_AMOUNT decimal(10,2) NOT NULL,
    PROJECT_ID INTEGER NOT NULL,
    SUPPLIER_ID INTEGER NOT NULL,
    REMARKS VARCHAR(250),
    CANCELLED BOOLEAN
    
);
