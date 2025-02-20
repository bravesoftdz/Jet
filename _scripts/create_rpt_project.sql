SET TERM ^ ;

CREATE PROCEDURE P_RPT_PROJECT
 ( P_PROJECT_ID INTEGER ) 
RETURNS 
 ( R_ITEM_NAME VARCHAR(50),
   R_QUANTITY DECIMAL(8,2),
   R_EXPENSE_AMOUNT DECIMAL(10,2),
   R_UNIT_NAME VARCHAR(50))
AS 
BEGIN
  FOR
        SELECT ITEM_NAME,
               SUM(CASE WHEN QUANTITY = 0 THEN 1 ELSE QUANTITY END),
               SUM(EXPENSE_AMOUNT),
               UNIT_NAME
          FROM EXPENSE E
          JOIN ITEM I
            ON I.ITEM_ID = E.ITEM_ID
     LEFT JOIN T_UNIT U 
            ON U.UNIT_ID = I.UNIT_ID
         WHERE E.PROJECT_ID = :P_PROJECT_ID
           AND COALESCE(E.CANCELLED,FALSE) = FALSE
      GROUP BY ITEM_NAME,
               UNIT_NAME
      ORDER BY I.ITEM_NAME
          INTO :R_ITEM_NAME,
               :R_QUANTITY,
               :R_EXPENSE_AMOUNT,
               :R_UNIT_NAME
        
  DO
  SUSPEND;
END^

SET TERM ; ^
