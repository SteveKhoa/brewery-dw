select *
from raw_purchaseorderheader ph, raw_shipmethod sm
where ph.shipmethodid = sm.shipmethodid