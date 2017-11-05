SET TERM ^ ;

CREATE PROCEDURE P_GET_EXPENSES 
 ( P_PROJECT_ID INTEGER ) 
RETURNS 
 ( R_EXPENSE_ID integer,
   R_EXPENSE_DATE TIMESTAMP,
   R_RECEIPT VARCHAR(12),
   R_ITEM_ID INTEGER,
   R_ITEM_NAME VARCHAR(50),
   R_QUANTITY DECIMAL(8,2),
   R_EXPENSE_AMOUNT DECIMAL(10,2),
   R_SUPPLIER_ID INTEGER,
   R_SUPPLIER_NAME VARCHAR(50),
   R_UNIT_ID INTEGER,
   R_UNIT_NAME VARCHAR(50),
   R_REMARKS VARCHAR(250),
   R_CANCELLED BOOLEAN,
   R_PROJECT_ID INTEGER )
AS 
BEGIN
  FOR
        SELECT EXPENSE_ID,
               EXPENSE_DATE,
               RECEIPT,
               E.ITEM_ID,
               I.ITEM_NAME,
               QUANTITY,
               EXPENSE_AMOUNT,
               E.SUPPLIER_ID,
               S.SUPPLIER_NAME,
               I.UNIT_ID,
               U.UNIT_NAME,
               REMARKS,
               CANCELLED,
               PROJECT_ID
          FROM EXPENSE E
          JOIN ITEM I
            ON I.ITEM_ID = E.ITEM_ID
          JOIN SUPPLIER S
            ON S.SUPPLIER_ID = E.SUPPLIER_ID
     LEFT JOIN T_UNIT U 
            ON U.UNIT_ID = I.UNIT_ID
         WHERE E.PROJECT_ID = :P_PROJECT_ID
      ORDER BY E.EXPENSE_DATE
          INTO :R_EXPENSE_ID,
               :R_EXPENSE_DATE,
               :R_RECEIPT,
               :R_ITEM_ID,
               :R_ITEM_NAME,
               :R_QUANTITY,
               :R_EXPENSE_AMOUNT,
               :R_SUPPLIER_ID,
               :R_SUPPLIER_NAME,
               :R_UNIT_ID,
               :R_UNIT_NAME,
               :R_REMARKS,
               :R_CANCELLED,
               :R_PROJECT_ID
        
  DO
  SUSPEND;
END^

SET TERM ; ^
