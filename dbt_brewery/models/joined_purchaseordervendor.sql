select *
from 
    raw_purchaseorderdetail pod, 
    raw_purchaseorderheader poh, 
    raw_vendor v
where 
    pod.purchaseorderid = poh.purchaseorderid 
    and poh.vendorid = v.businessentityid
