--Nathaniel Jackson: I did not work with a team
--Project3, data warehouse query

--query #1
SELECT AVG(p.LISTPRICE), AVG(p.SALEPRICE), a.STATE
FROM PURCHASE p 
INNER JOIN STORE s ON s.STOREID = p.STOREID
INNER JOIN ADDRESS a ON a.ADDRESSID = s.ADDRESSID
GROUP BY ROLLUP (a.STATE);

--query #2
SELECT AVG(p.LISTPRICE), AVG(p.SALEPRICE), s.STORENAME, a.STATE
FROM PURCHASE p
INNER JOIN STORE s ON s.STOREID = p.STOREID
INNER JOIN ADDRESS a ON a.ADDRESSID = s.ADDRESSID
GROUP BY ROLLUP (s.STORENAME, a.STATE);

--query #3
--most popular color
SELECT COUNT(p.COLORNAME), p.COLORNAME
FROM COMPONENT c
INNER JOIN BICYCLE b ON b.SERIALNUMBER = c.BICYCLESERIALNUMBER
INNER JOIN PAINT p ON p.PAINTID = b.PAINTID
GROUP BY p.COLORNAME;

--which store sells the most of each color
SELECT COUNT(pa.COLORNAME), s.STORENAME, pa.COLORNAME
FROM PURCHASE p
INNER JOIN STORE s ON s.STOREID = p.STOREID
INNER JOIN BICYCLE b ON b.SERIALNUMBER = p.BICYCLESERIALNUMBER
INNER JOIN PAINT pa ON pa.PAINTID = b.PAINTID
GROUP BY s.STORENAME, pa.COLORNAME;

--query #4
SELECT COUNT(p.MANUFACTURERNAME), s.STORENAME, p.MANUFACTURERNAME
FROM COMPONENT c
INNER JOIN PART p ON p.PARTID = c.PARTID
INNER JOIN BICYCLE b ON b.SERIALNUMBER = c.BICYCLESERIALNUMBER
INNER JOIN PURCHASE pu ON pu.BICYCLESERIALNUMBER = b.SERIALNUMBER
INNER JOIN STORE s ON s.STOREID = pu.STOREID
GROUP BY s.STORENAME, p.MANUFACTURERNAME;