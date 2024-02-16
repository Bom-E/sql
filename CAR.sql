CREATE TABLE CAR_INFO(
	CAR_NUMBER INT AUTO_INCREMENT PRIMARY KEY
	, CAR_NAME VARCHAR(10)
	, CAR_PRICE INT NOT NULL
	, CAR_MAKER_NUMBER INT NOT NULL
);

DROP TABLE car_info;

DROP TABLE SALES_INFO;

SELECT *
FROM car_info;

SELECT * 
FROM sales_info;

CREATE TABLE SALES_INFO (
	SALES_NUMBER INT AUTO_INCREMENT PRIMARY KEY
	, CUSTOMER_NAME VARCHAR(20) NOT NULL
	, CUSTOMER_TEL VARCHAR(30)
	, SALES_COLOR VARCHAR(3) NOT NULL
	, SALES_DATE DATETIME DEFAULT CURRENT_TIMESTAMP
	, CAR_NUMBER INT NOT NULL REFERENCES CAR_INFO(CAR_NUMBER)
);