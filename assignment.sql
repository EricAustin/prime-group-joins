1. Get all customers and their addresses.
SELECT * FROM customers JOIN addresses on addresses.customer_id=customers.id;


2. Get all orders and their line items.
SELECT * FROM orders JOIN line_items on orders.id=line_items.order_id;


3. Which warehouses have cheetos?
SELECT products.description , warehouse.warehouse FROM products 
JOIN warehouse_product ON products.id=warehouse_product.product_id
JOIN warehouse ON warehouse.id= warehouse_product.warehouse_id
where description='cheetos' GROUP BY warehouse.warehouse, products.description;


4. Which warehouses have diet pepsi?
SELECT products.description , warehouse.warehouse FROM products 
JOIN warehouse_product ON products.id=warehouse_product.product_id
JOIN warehouse ON warehouse.id= warehouse_product.warehouse_id
where description='diet pepsi' GROUP BY warehouse.warehouse, products.description;


5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, count(customers.first_name) FROM orders 
JOIN addresses ON orders.address_id=addresses.id 
JOIN customers ON customers.id=addresses.customer_id
GROUP BY customers.first_name;


6. How many customers do we have?
SELECT count(customers.id) from customers; 
Technically 4, but only 3 have ever bothered to actually PAY us...


7. How many products do we carry?
SELECT count(products.id) from products; 


8. What is the total available on-hand quantity of diet pepsi?
SELECT products.description, sum(warehouse_product.on_hand) FROM warehouse_product 
JOIN products ON products.id=warehouse_product.product_id 
WHERE description='diet pepsi'  GROUP BY products.description;

