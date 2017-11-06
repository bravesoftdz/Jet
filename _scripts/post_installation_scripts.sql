UPDATE ITEM SET ACTIVE = TRUE;

UPDATE EXPENSE SET CANCELLED = FALSE;

INSERT INTO SYSRIGHT VALUES ('ADD_USER','Add system users',null,true);
INSERT INTO SYSRIGHT VALUES ('VIEW_USER','View system user',null,true);
INSERT INTO SYSRIGHT VALUES ('MODIFY_USER','Modify system user credentials',null,true);
INSERT INTO SYSRIGHT VALUES ('ADD_ROLE','Add system roles',null,true);
INSERT INTO SYSRIGHT VALUES ('VIEW_ROLE','View system roles',null,true);
INSERT INTO SYSRIGHT VALUES ('MODIFY_ROLE','Modify system role including assigned rights',null,true);
INSERT INTO SYSRIGHT VALUES ('ADD_ITEM','Add items',null,true);
INSERT INTO SYSRIGHT VALUES ('MODIFY_ITEM','Modify item details including setting its active field.',null,true);
INSERT INTO SYSRIGHT VALUES ('ADD_PROJECT','Add projects',null,true);
INSERT INTO SYSRIGHT VALUES ('MODIFY_PROJECT','Modify project details including setting its active field',null,true);
INSERT INTO SYSRIGHT VALUES ('ADD_SUPPLIER','Add suppliers',null,true);
INSERT INTO SYSRIGHT VALUES ('MODIFY_SUPPLIER','Modify supplier details',null,true);
INSERT INTO SYSRIGHT VALUES ('ADD_UNITS','Add units',null,true);
INSERT INTO SYSRIGHT VALUES ('MODIFY_UNITS','Modify unit details',null,true);
INSERT INTO SYSRIGHT VALUES ('ADD_EXPENSE','Add project expenses',null,true);
INSERT INTO SYSRIGHT VALUES ('MODIFY_EXPENSE','Modify project expense details including cancellation',null,true);

INSERT INTO SYSROLE VALUES ('ADM','Administrator',null);

INSERT INTO SYSROLERIGHT VALUES ('ADM','ADD_USER');

INSERT INTO SYSUSER (USERNAME, PASSKEY, ROLE_CODE) VALUES ('ADMIN','admin123','ADM');



