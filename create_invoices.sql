CREATE TABLE INVOICE (
supplier_id TINYINT,
invoice_ammount DECIMAL(8, 2),
due_date DATE
);

CREATE TABLE SUPPLIER (	
supplier_id TINYINT NOT NULL,
name VARCHAR
);

INSERT INTO SUPPLIER VALUES
(1, 'Catering Plus'),
(2, 'Dave''s Discos'),
(3, 'Entertainment tonight'),
(4, 'Ice Ice Baby'),
(5, 'Party Animals');
	
	
INSERT INTO INVOICE (supplier_id, invoice_ammount, due_date)
SELECT supplier.supplier_id, 6000, last_day_of_month(date_add('month', 3, current_timestamp)) 
FROM SUPPLIER WHERE  supplier.name = 'Party Animals';

INSERT INTO INVOICE (supplier_id, invoice_ammount, due_date)
SELECT supplier.supplier_id, 2000, last_day_of_month(date_add('month', 2, current_timestamp)) 
FROM SUPPLIER WHERE  supplier.name = 'Catering Plus';

INSERT INTO INVOICE (supplier_id, invoice_ammount, due_date)
SELECT supplier.supplier_id, 1500, last_day_of_month(date_add('month', 3, current_timestamp)) 
FROM SUPPLIER WHERE  supplier.name = 'Catering Plus';

INSERT INTO INVOICE (supplier_id, invoice_ammount, due_date)
SELECT supplier.supplier_id, 500, last_day_of_month(date_add('month', 1, current_timestamp)) 
FROM SUPPLIER WHERE  supplier.name = 'Dave''s Discos';

INSERT INTO INVOICE (supplier_id, invoice_ammount, due_date)
SELECT supplier.supplier_id, 6000, last_day_of_month(date_add('month', 3, current_timestamp)) 
FROM SUPPLIER WHERE  supplier.name = 'Entertainment tonight';

INSERT INTO INVOICE (supplier_id, invoice_ammount, due_date)
SELECT supplier.supplier_id, 4000, last_day_of_month(date_add('month', 6, current_timestamp)) 
FROM SUPPLIER WHERE  supplier.name = 'Ice Ice Baby';

-- SELECT for testing inserted data

SELECT * from invoice join supplier on invoice.supplier_id = supplier.supplier_id;
