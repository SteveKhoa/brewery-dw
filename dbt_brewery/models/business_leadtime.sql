SELECT *
FROM raw_productvendor pv
RIGHT JOIN raw_purchaseorderheader poh
ON pv.businessentityid = poh.vendorid
