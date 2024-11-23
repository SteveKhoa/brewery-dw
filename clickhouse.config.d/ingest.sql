SET default_table_engine = 'Log';

CREATE TABLE IF NOT EXISTS raw_combined_brew AS
SELECT *
FROM file('brew.csv');

CREATE TABLE IF NOT EXISTS raw_productvendor AS
select * 
from file('productvendor.csv');

create table IF NOT EXISTS raw_purchaseorderdetail AS
select * 
from file('purchaseorderdetail.csv');

create table IF NOT EXISTS raw_purchaseorderheader AS
select *
from file('purchaseorderheader.csv');

create table IF NOT EXISTS raw_shipmethod AS
select *
from file('shipmethod.csv');

create table IF NOT EXISTS raw_vendor AS
select *
from file('vendor.csv');