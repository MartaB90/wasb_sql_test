WITH 
PAYMENT as
	(SELECT 
		INVOICE.supplier_id, 
		SUPPLIER.name as SUPPLIER_NAME, 
		SUM(invoice_ammount) as PAYMENT_AMOUNT, --sum of all appropriate uniform monthly payments to fully pay the SUPPLIER for any INVOICE before the INVOICE.due_date
		INVOICE.due_date
	FROM INVOICE
	JOIN SUPPLIER on SUPPLIER.supplier_id = INVOICE.supplier_id
	GROUP BY INVOICE.supplier_id, SUPPLIER.name, INVOICE.due_date), 
 
BALANCE as
	(SELECT 
		INVOICE.supplier_id, 
		SUM(invoice_ammount) as BALANCE_OUTSTANDING  -- is the total balance outstanding across ALL INVOICEs 
	FROM INVOICE
	GROUP BY INVOICE.supplier_id)

SELECT 
	PAYMENT.supplier_id SUPPLIER_ID, 
	PAYMENT.SUPPLIER_NAME, 
	PAYMENT.PAYMENT_AMOUNT, 
	BALANCE.BALANCE_OUTSTANDING, 
	PAYMENT.due_date PAYMENT_DATE
FROM PAYMENT
JOIN BALANCE 
	on PAYMENT.supplier_id = BALANCE.supplier_id
ORDER BY PAYMENT.supplier_id;
