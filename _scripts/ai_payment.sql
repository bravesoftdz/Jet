SET TERM ^ ;

CREATE TRIGGER AI_PAYMENT FOR PAYMENT
 AFTER INSERT
AS 
BEGIN 
    -- update the available credits in the ACCOUNT table
    -- only when payment/card type is account (CARD_TYPE = 3)
    IF (NEW.CARD_TYPE = 3) then
    BEGIN
        UPDATE ACCOUNT 
           SET CREDIT_AVAILABLE = COALESCE(CREDIT_AVAILABLE,0) - COALESCE(NEW.PAYMENT_VALUE,0)
         WHERE ACCOUNT_ID = (SELECT ACCOUNT_ID 
                               FROM CARD 
                              WHERE TAG_NUMBER = NEW.CARD_TAG_NUMBER);
    END
    
END^

SET TERM ; ^
