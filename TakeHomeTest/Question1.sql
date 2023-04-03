USE Pubsmalikjp38
GO

if object_id('improved_titleview','v') is not null
drop view improved_titleview;
go

if object_id('cheap_books','v') is not null
drop view cheap_books;
go

CREATE VIEW improved_titleview 
AS select t.title, a.au_lname, a.au_fname, 
	ta.au_ord, 
	t.price, t.ytd_sales,  
	t.pub_id, 
	ta.au_id, ta.title_id 
FROM authors a, titles t, titleauthor ta 
WHERE a.au_id = ta.au_id  AND t.title_id = ta.title_id
go



CREATE VIEW cheap_books AS
select DISTINCT 
	p.pub_name AS 'publisher', it.title AS 'title', it.au_lname AS 'author-last', it.au_fname AS 'author-first', it.price AS 'price',
	(it.ytd_sales*it.price) AS 'YTD SALES $'
FROM improved_titleview it, publishers p
WHERE p.pub_id = it.pub_id AND it.price <  15.00
GROUP BY it.au_lname, it.au_fname, p.pub_name, it.title,  it.price, (it.ytd_sales*it.price)