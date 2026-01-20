
-- =========================================
-- Query 1: Show all invoices with customer details (INNER JOIN)
-- Business Purpose: See who bought what and when
-- =========================================

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


-- =========================================
-- Query 2: Find customers who never purchased (LEFT JOIN)
-- Business Purpose: Find inactive customers for marketing
-- =========================================

SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country
FROM Customer c
LEFT JOIN Invoice i
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;


-- =========================================
-- Query 3: Revenue per Track (Product-wise sales)
-- Business Purpose: Find top selling tracks
-- =========================================

SELECT
    t.Name AS TrackName,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
GROUP BY t.TrackId, t.Name
ORDER BY Revenue DESC;


-- =========================================
-- Query 4: Genre-wise Revenue (Category performance)
-- Business Purpose: See which genre earns the most
-- =========================================

SELECT
    g.Name AS Genre,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Revenue DESC;


-- =========================================
-- Query 5: Artist-wise Revenue
-- Business Purpose: Identify top performing artists
-- =========================================

SELECT
    ar.Name AS Artist,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY Revenue DESC;


-- =========================================
-- Query 6: Sales in USA (Business filter using WHERE)
-- Business Purpose: Country-wise sales analysis
-- =========================================

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


-- =========================================
-- Query 7: Full Sales Table (Complete Business View)
-- Business Purpose: Master table for dashboard / export
-- =========================================

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



In this project, we worked with the Chinook music store database in MySQL to understand and analyze real business data using SQL. First, we set up the database and understood how different tables like customers, invoices, tracks, artists, albums, and genres are connected. Then, we used SQL JOIN operations to combine these tables and create meaningful views of the data, such as linking customers with their purchases and linking sales with tracks, artists, and genres. Using these joined tables, we analyzed sales and calculated revenue at different levels like per track, per artist, and per genre, and also checked customer activity. We created a final combined result that looks like a real business reporting table and exported it to a CSV file. Finally, based on the query results, we wrote business insights about sales performance and customer behavior. Overall, the project shows how SQL joins can be used to turn raw database tables into useful business analysis and reports.
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId;
