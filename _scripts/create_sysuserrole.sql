CREATE TABLE SYSUSERROLE
(
    ROLE_CODE CHAR(3),
    USERNAME VARCHAR(25),
    CONSTRAINT PK_SYSUSERROLE_01 PRIMARY KEY (ROLE_CODE,USERNAME)
);
