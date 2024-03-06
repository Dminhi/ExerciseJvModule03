USE QuanLyBanHang;
SELECT o.oID, o.oDate, o.oTotalPrice
FROM orders o;
SELECT c.cID,c.Name,o.oID,o.oDate,p.pName,od.odqty
FROM customer c JOIN orders o ON c.cID=o.cID
JOIN orderdetail od ON o.oID = od.oID
JOIN product p ON p.pID=od.pID;
SELECT cID,name
FROM customer
WHERE cid NOT IN (SELECT cid FROM orders);
SELECT o.oid,o.odate,SUM(od.odqty*p.pprice)
FROM orders o JOIN orderdetail od ON o.oid=od.oid
JOIN product p ON p.pid=od.pid
GROUP BY o.oid;