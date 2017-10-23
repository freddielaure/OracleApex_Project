CREATE TABLE CUSTOMERS_X (
    CUSTOMER_X_ID number,
    CUSTOMER_Name varchar(45),
    CUSTOMER_Vorname varchar(45),
    Address varchar(45),
    Stadt varchar(255),
    Geburtsdatum Date,
    Geschlecht varchar(45),
    Gewicht    float,
    Gehalt Number
);

ALTER TABLE CUSTOMERS_X ADD CONSTRAINT PK_CUSTOMER_X  PRIMARY KEY (CUSTOMER_X_ID);

CREATE SEQUENCE   CUSTOMERS_X_seq 
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 START WITH 1 
CACHE 20 NOORDER  
NOCYCLE  NOPARTITION;



create or replace trigger CUSTOMERS_X_trg
              before insert on CUSTOMERS_X
              for each row
              begin
                  if :new.CUSTOMER_X_ID is null then
                      select CUSTOMERS_X_seq.nextval into :new.CUSTOMER_X_ID from sys.dual;
                 end if;
              end;



INSERT INTO CUSTOMERS_X (CUSTOMER_Name,  CUSTOMER_Vorname, Address, Stadt, Geburtsdatum, Geschlecht,Gewicht, Gehalt)
VALUES ('Yotti', 'Pierre', 'Hoemerichstr.69', 'Gummersbach', TO_DATE('1989/01/18', 'yyyy/mm/dd'), 'Mann', 80, 5000);

INSERT INTO CUSTOMERS_X (CUSTOMER_Name,  CUSTOMER_Vorname, Address, Stadt, Geburtsdatum, Geschlecht,Gewicht, Gehalt)
VALUES ('Tchagam', 'Laure', 'Hoemerichstr.69', 'Gummersbach', TO_DATE('1991/09/20', 'yyyy/mm/dd'), 'Weiblich', 69, 5000);

INSERT INTO CUSTOMERS_X (CUSTOMER_Name,  CUSTOMER_Vorname, Address, Stadt, Geburtsdatum, Geschlecht,Gewicht, Gehalt)
VALUES ('Test', 'Laure', 'Hoemerichstr.69', 'Gummersbach', TO_DATE('1991/09/20', 'yyyy/mm/dd'), 'Weiblich', 69, 5000);



