	## Fungsi Skalar Matematika - ABS()
	SELECT StudentID, FirstName, LastName, Semester1, Semester2, ABS(MarkGrowth) AS MarkGrowth
	FROM Students;
	
	## Fungsi Skalar Matematika - CEILING()
	SELECT StudentID, FirstName, LastName, CEILING(Semester1) AS Semester1, CEILING(Semester2) AS Semester2, MarkGrowth
	FROM Students;
	
	## Fungsi Skalar Matematika - FLOOR()
	SELECT StudentID, FirstName, LastName, FLOOR(Semester1) AS Semester1, FLOOR(Semester2) AS Semester2, MarkGrowth
	FROM Students;
	
	## Fungsi Skalar Matematika - ROUND()
	SELECT StudentID, FirstName, LastName,ROUND(Semester1,1) AS Semester1, ROUND(Semester2, 0) AS Semester2, MarkGrowth
	FROM students;
	
	## Fungsi Skalar Matematika - SQRT()
	SELECT StudentID, FirstName, LastName, SQRT(Semester1) AS Semester1, Semester2, MarkGrowth
	FROM Students;
	
	## Tugas Praktek - Fungsi Skalar Matematika
	SELECT StudentID, FirstName, LastName, MOD(Semester1, 2) AS Semester1, Semester2, EXP(MarkGrowth)
	FROM students;
	
	## Fungsi Text - CONCAT()
	SELECT StudentID, CONCAT(FirstName, LastName) AS Name, Semester1, Semester2, MarkGrowth
	FROM Students;
	
	## Fungsi Text - SUBSTRING_INDEX()
	SELECT StudentID, SUBSTRING_INDEX(Email,'@', 1) AS Name
	FROM Students;
	
	## Fungsi Text - SUBSTR()
	SELECT StudentID, SUBSTR(FirstName, 2, 3) AS Initial
	FROM Students;
	
	## Fungsi Text - LENGTH()
	SELECT StudentID, FirstName, LENGTH(FirstName) AS Total_Char
	FROM Students;
	
	## Fungsi Text - REPLACE()
	SELECT StudentID, Email, REPLACE(Email, 'yahoo', 'gmail') AS New_Email
	FROM Students;
	
	## Tugas Praktek - Fungsi Text
	SELECT StudentID, UPPER(FirstName) AS FirstName, LOWER(LastName) AS LastName
	FROM Students;
	
	## Fungsi Aggregate - SUM()
	SELECT SUM(Semester1) AS Total_1, SUM(Semester2) AS Total_2
	FROM Students;
	
	## Fungsi Aggregate - COUNT()
	SELECT COUNT(FirstName) AS Total_Student
	FROM Students;
	
	## Fungsi Aggregate - AVG()
	SELECT AVG(Semester1) AS AVG_1, AVG(Semester2) AS AVG_2
	FROM Students;
	
	## Tugas Praktek - Fungsi Aggregate
	SELECT MIN(Semester1) AS Min1, MAX(Semester1) AS Max1, MIN(Semester2) AS Min2, MAX(Semester2) AS Max2
	FROM Students;
	
	## Group by Single Column
	SELECT province, COUNT(DISTINCT order_id) as total_order, SUM(item_price) as total_price
	FROM sales_retail_2019
	GROUP BY province;
	
	## Group by Multiple Column
	SELECT province, brand, COUNT(DISTINCT order_id) AS total_order, SUM(item_price) AS total_price
	FROM sales_retail_2019
	GROUP BY province, brand;
	
	## Fungsi Aggregate dengan Grouping
	SELECT province, COUNT(DISTINCT order_id) AS total_unique_order, SUM(item_price) AS revenue 
	FROM sales_retail_2019
	GROUP BY province;
	
	## Tugas Praktek - Group By
	SELECT MONTH(order_date) AS order_month, SUM(item_price) AS total_price, 
	CASE  
		WHEN SUM(item_price) >= 30000000000 THEN 'Target Achieved'
		WHEN SUM(item_price) <= 25000000000 THEN 'Less performed'
			ELSE 'Follow UP'
		END as remark
	FROM sales_retail_2019
	GROUP BY MONTH(order_date);
	
	## Proyek Pekerjaan - Analisis Penjualan Part 1
	-- 1. Total jumlah seluruh penjualan (total/revenue).
	SELECT SUM(total) as total 
	FROM tr_penjualan;
	-- 2. Total quantity seluruh produk yang terjual.
	SELECT SUM(qty) as qty 
	FROM tr_penjualan;
	-- 3. Total quantity dan total revenue untuk setiap kode produk.
	SELECT kode_produk, SUM(qty) as qty, SUM(total) as total 
	FROM tr_penjualan
	GROUP BY kode_produk;
	
	## Proyek Pekerjaan - Analisis Penjualan Part 2
	-- 4. Rata - Rata total belanja per kode pelanggan.
	SELECT kode_pelanggan, AVG(total) as avg_total 
	FROM tr_penjualan	
	GROUP BY kode_pelanggan;
	-- 5. Selain itu,  jangan lupa untuk menambahkan kolom baru dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K.
	SELECT kode_transaksi,kode_pelanggan,no_urut,kode_produk, nama_produk, qty, total,
	CASE  
		WHEN total > 300000 THEN 'High'
		WHEN total < 100000 THEN 'Low'
			ELSE 'Medium'  
		END as 'Kategori'
	FROM tr_penjualan;