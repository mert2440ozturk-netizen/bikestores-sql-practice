USE BikeStores;
/*
If a product's stock quantity is 0 in one store and at least 10 in another store, match these stores.

The result should include:
- Product name
- Name of the store that can send stock
- Stock quantity in this store
- Name of the store that will receive stock

Sort by the sending store's stock quantity in descending order. 
*/

SELECT
    pp.product_name AS [Ürün Adı],
    ss1.store_name AS [Gönderen Mağaza],
    ps1.quantity AS [Gönderen Stok Adedi],
    ss2.store_name AS [Alıcı Mağaza]
FROM production.stocks AS ps1
INNER JOIN production.stocks AS ps2
    ON ps1.product_id = ps2.product_id
    AND ps1.store_id != ps2.store_id
INNER JOIN production.products AS pp
    ON ps1.product_id = pp.product_id
INNER JOIN sales.stores AS ss1
    ON ps1.store_id = ss1.store_id
INNER JOIN sales.stores AS ss2
    ON ps2.store_id = ss2.store_id
WHERE ps1.quantity >= 10
    AND ps2.quantity = 0
ORDER BY ps1.quantity DESC;
