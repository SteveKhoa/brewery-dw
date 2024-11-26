with purchase_order as (
    select
        pod.orderqty as orderqty,
        pod.productid as productid,
        pod.unitprice as unitprice,
        pod.receivedqty as receivedqty,
        pod.rejectedqty as rejectedqty,
        poh.vendorid as vendorid,
        poh.shipmethodid as shipmethodid,
        poh.taxamt as taxamt,
        poh.freight as freight
    from raw_purchaseorderdetail pod full outer join raw_purchaseorderheader poh
    on pod.purchaseorderid = poh.purchaseorderid
),
purchase_order_with_shipment as (
    select
        po.orderqty as orderqty,
        po.productid as productid,
        po.unitprice as unitprice,
        po.receivedqty as receivedqty,
        po.rejectedqty as rejectedqty,
        po.vendorid as vendorid,
        po.taxamt as taxamt,
        po.freight as freight,
        sm.name as name,
        sm.shipbase as shipbase,
        sm.shiprate as shiprate
    from purchase_order po full outer join raw_shipmethod as sm
    on po.shipmethodid = sm.shipmethodid
),
product_vendor as (
    select
        v.businessentityid as vendorid,
        pv.productid as productid,
        pv.averageleadtime as averageleadtime,
        pv.standardprice as standardprice,
        v.name as name,
        v.creditrating as creditrating
    from raw_productvendor pv full outer join raw_vendor v
    on pv.businessentityid = v.businessentityid
),
product_vendor_with_names as (
    select
        pv.*,
        p.name as p_name
    from product_vendor pv left join raw_products p
    on pv.productid = p.productid
)

select
    pos.orderqty as order_orderqty,
    pos.productid as order_productid,
    pos.unitprice as order_unitprice,
    pos.receivedqty as order_receivedqty,
    pos.rejectedqty as order_rejectedqty,
    pos.taxamt as order_taxamt,
    pos.freight as order_freight,
    pos.name as ship_name,
    pos.shipbase as ship_shipbase,
    pos.shiprate as ship_shiprate,
    pv.vendorid as vendor_vendorid,
    pv.productid as vendor_productid,
    pv.p_name as vendor_product_name,
    pv.averageleadtime as vendor_averageleadtime,
    pv.standardprice as vendor_standardprice,
    pv.name as vendor_name,
    pv.creditrating as vendor_creditrating
from purchase_order_with_shipment pos full outer join product_vendor_with_names pv
on pos.vendorid = pv.vendorid
