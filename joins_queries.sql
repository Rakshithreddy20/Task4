CREATE DATABASE chinook;
USE chinook;
show tables;

SELECT
    i.InvoiceId,
    i.InvoiceDate,
    c.FirstName,
    c.LastName,
    c.Country,
    i.Total
FROM Invoice i
INNER JOIN Customer c
ON i.CustomerId = c.CustomerId;

SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country
FROM Customer c
LEFT JOIN Invoice i
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

SELECT
    t.Name AS TrackName,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
GROUP BY t.TrackId, t.Name
ORDER BY Revenue DESC;

SELECT
    g.Name AS Genre,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Revenue DESC;

SELECT
    g.Name AS Genre,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Revenue DESC;

SELECT
    ar.Name AS Artist,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY Revenue DESC;

SELECT
    i.InvoiceId,
    i.InvoiceDate,
    c.FirstName,
    c.LastName,
    c.Country,
    i.Total
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
WHERE c.Country = 'USA';

SELECT
    i.InvoiceId,
    i.InvoiceDate,
    c.FirstName,
    c.LastName,
    ar.Name AS Artist,
    t.Name AS Track,
    g.Name AS Genre,
    il.UnitPrice,
    il.Quantity,
    (il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId;


