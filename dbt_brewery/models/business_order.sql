SELECT *
FROM raw_purchaseorderdetail pod
LEFT JOIN raw_purchaseorderdetail poh
ON pod.purchaseorderid = poh.purchaseorderid
