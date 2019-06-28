Queries
1. What query would you run to get the total revenue for March of 2012?
SELECT SUM(amount) AS March_Revenue
FROM billing
WHERE charged_datetime like "2012-03%";


2. What query would you run to get total revenue collected from the client with an id of 2?
SELECT SUM(amount)
FROM billing
JOIN clients ON billing.client_id = clients.client_id
WHERE clients.client_id = 2;


3. What query would you run to get all the sites that client=10 owns?
SELECT sites.domain_name
FROM sites
JOIN clients ON sites.client_id = clients.client_id
WHERE clients.client_id = 10;


4. What query would you run to get total # of sites created per month per year for the client with an id of 1? What about for client=20?
SELECT DATE_FORMAT(created_datetime, "%M") AS month, DATE_FORMAT(created_datetime, "%Y") AS year, COUNT(sites.domain_name), clients.client_id
FROM sites
JOIN clients ON sites.client_id = clients.client_id
WHERE clients.client_id = 1
GROUP BY month, year
ORDER BY year;

SELECT DATE_FORMAT(created_datetime, "%M") AS month, DATE_FORMAT(created_datetime, "%Y") AS year, COUNT(sites.domain_name), clients.client_id
FROM sites
JOIN clients ON sites.client_id = clients.client_id
WHERE clients.client_id = 20
GROUP BY month, year
ORDER BY year;


5. What query would you run to get the total # of leads generated for each of the sites between January 1, 2011 to February 15, 2011?
SELECT sites.domain_name, COUNT(leads.leads_id)
FROM sites
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime BETWEEN "2011-01-01%" AND "2011-02-15%"
GROUP BY sites.domain_name;

