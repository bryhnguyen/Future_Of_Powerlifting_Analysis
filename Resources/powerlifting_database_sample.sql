-- Creating tables for Powerlifting_Future_ML

CREATE TABLE Totalkg (
	competitor_id VARCHAR(40),
	BodyWeightKg INT,
	Best3DeadliftKg INT,
	Best3BenchKg INT,
	Best3DeadliftKg INT,
	Totalkg INT,
	wilks_score INT,
	PRIMARY KEY (competitor_id)
);
CREATE TABLE competitor (
	competitor_id VARCHAR(40) NOT NULL,
	competitor_name VARCHAR(40) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	country VARCHAR(40), 
	PRIMARY KEY (competitor_id)
);

CREATE TABLE demographic (
	competitor_id VARCHAR(40) NOT NULL,
	Age VARCHAR(5) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	Place VARCHAR(1)  NOT NULL,
	meet_date VARCHAR(40) NOT NULL,
	PRIMARY KEY (competitor_id)
);


-- Joining totalkg and demographics tables
CREATE TABLE project_df AS SELECT demographic.competitor_id,
     demographic.sex,
	 demographic.Age,
	 totalkg.BodyweightKg,
	 totalkg.Best3SquatKg,
	 totalkg.Best3BenchKg,
	 totalkg.Best3DeadliftKg,
	 totalkg.TotalKg,
	 demographic.Place,
	 demographic.meet_date,
	 totalkg.wilks_score
FROM demographic
LEFT JOIN totalkg
ON demographic.competitor_id = totalkg.competitor_id;

CREATE TABLE meet (
	meet_id VARCHAR(6) NOT NULL,
	meet_name VARCHAR(40) NOT NULL,
	meet_date VARCHAR(10) NOT NULL,
	meet_country VARCHAR(40), 
	PRIMARY KEY (meet_id)
);

CREATE TABLE performance (
	performance_id VARCHAR(40) NOT NULL,
	competitor_id VARCHAR(40) NOT NULL,
	meet_id VARCHAR(40) NOT NULL,
	wilks_score VARCHAR,
	PRIMARY KEY (performance_id),
	FOREIGN KEY (competitor_id) REFERENCES competitor (competitor_id),
	FOREIGN KEY (meet_id) REFERENCES meet (meet_id)
);




------------------------------------------------------------------------------------------------------------
-- Use the following table to get the data that will be used to calculate yearly 
-- averages for the top placing competitors in excel
SELECT performance_id,
	c.meet_id,
	wilks_score,
	meet_date
FROM performance A 
	LEFT JOIN competitor B 
	ON A.competitor_id = B.competitor_id
	LEFT JOIN meet C
	ON A.meet_id = C.meet_id;

-----------------------------------------------------------------------------------------------------------------
-- Use yearly data to calculate the yearly averages for the first place performances per year
-- load the data to a new table
CREATE TABLE yearly_winning_avg (
	year INT,
	avg_winning_wilks_score VARCHAR,
	PRIMARY KEY (year)
);
