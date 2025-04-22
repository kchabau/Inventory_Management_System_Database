# Background

![Main1](/Assets_Files/main1.jpg)

In this project I build a database schema that could be used to organize an inventory of mechanical parts. The schema will keep track of all the parts, their manaufacturer, category, location in storeroom, available inventory, and other relevant information. 

A database like this might be updated and queried by an inventory management application that accepts input from many users who might not be familiar with the database structure. I will make sure that there are sufficient data quality checks to ensure that only valid data can be entered into the database. 

*This project comes from a list of projects available within the **Data Engineer** Career Path.*

To review the Database Schema please refer to [Database](/Inventory_Management_System_Database/Database/table_schema.sql) folder. To review Database Constraints, please refer to the file inside of the folder, as well.

To review the `CSV` files associated with this project, please refer to the [Asset_Files](/Inventory_Management_System_Database/Assets_Files) folder.


We ensure the following steps of the project is completed:
1. Ensure the `code` column in parts is unique and not empty. 
2. Backfill the `description` column in parts with ‘None Available’.
3. Add a `NOT NULL` constraint to the `description` column.
4. Test the `NOT NULL` constraint by attempting to insert a row with an empty `description`.
5. Ensure `price_usd` and `quantity` in `reorder_options` are `NOT NULL`. 
6. Add a check constraint to ensure `price_usd` and `quantity` are positive.
7. Add a constraint to limit the price per unit to between 0.02 USD and 25.00 USD. 
8. Ensure `reorder_options` has a foreign key relationship with `parts`. 
9. Add a constraint to ensure `qty` in `locations` is greater than 0. 
10. Ensure `locations` records only one row for each combination of `location` and `part`. 
11. Ensure parts in `locations` must already be in `parts`. 
12. Ensure all `parts` in parts have a valid manufacturer. 
13. Insert a new manufacturer with `id=11` and name ‘Pip-NNC Industrial’.
14. Update old manufacturers’ `parts` in parts to reference the new company.

## Tools and Technology
- PostgreSQL: Database creation, querying and manipulation.
- VSCode: IDE

## Lessons Learned 
In specific, the most recent lesson was in regards to **constraints**. The most common:
- Data types — Are your first line of defense.
- `NOT NULL` constraints
- `CHECK` constraints — Give you more control over what rules you’d like to apply to your tables. These constraints will allow you to reject a row if it fails the criteria you’ve defined.
- `UNIQUE` constraints — Help with defining unique values in a table, they also create an index which can improve query and join performance.
- `PRIMARY KEY` constraints — A column or combination of columns that uniquely identify a row and are both `NOT NULL` and `UNIQUE`. `PRIMARY KEY`s are unique to a table, and will often be used in joins between tables.
- `FOREIGN KEY` constraints — Allow you to maintain *referential integrity* between two tables by validating the entry in one also appears in the other. Referential integrity depends on `FOREIGN KEY` constraints.