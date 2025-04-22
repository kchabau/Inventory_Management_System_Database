
-- alter codecolumn for unique and non null entries 
alter table parts 
add unique (code);

alter table parts
alter column code set not null;

-- handle missing values inside of description 
update parts set description = 'None Available' where description is null;

-- ensure description is not null 
alter table parts 
alter column description set not null;

-- test constraint 
-- insert into parts(id, code, manufacturer_id) values (54, 'V1-009', 9);
-- postgresql rejects the insert query because the `description column` is set to NOT NULL

-- IMPROVING REORDERING OPTIONS 
-- implement check that ensures values are not null
ALTER TABLE reorder_options
ALTER COLUMN price_usd SET NOT NULL;

ALTER TABLE reorder_options
ALTER COLUMN quantity SET NOT NULL;

-- implement check that ensures valus are above 0
alter table reorder_options 
add check (price_usd > 0 AND quantity > 0);

-- add constraint to reorder_options that limits price (by calculating price per unit as price_usd/quantity)
alter table reorder_options
add check (price_usd / quantity > 0.02 and price_usd / quantity < 25.00);

-- create relationship that links reorder_options to the parent parts table
alter table parts
add primary key (id);
alter table reorder_options
add foreign key (part_id) 
references parts(id);

-- IMPROVING LOCATION TRACKING 
-- add constraint to ensure qty is greater than 0 
 alter table locations 
 add check (qty > 0);

 -- ensures records only one row for each combination and part
 ALTER TABLE locations 
 ADD UNIQUE (part_id, location);

 -- ensure that parts in locations (child) must be already in parts table (parent)
 alter table locations 
 add foreign key (part_id)
 references parts(id);

 -- ensure that all parts(child) have valid manufacturer (parent)
 alter table parts 
 add foreign key (manufacturer_id)
 references manufacturers(id);

 -- new joint manufacturer 
 insert into manufacturers(id, name) values (11, 'Pip-NNC Industrial');

 -- update olf man. parts to reference new company 
update parts 
set manufacturer_id = 11
where manufacturer_id in (1, 2);