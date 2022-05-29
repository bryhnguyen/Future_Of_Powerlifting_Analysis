--Creating competitor table--
CREATE TABLE competitor (
	competitor_id VARCHAR(40) NOT NULL,
	competitor_name VARCHAR(40) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	country VARCHAR(40), 
	PRIMARY KEY (competitor_id)
);

-- Creating demographic table--
CREATE TABLE demographic (
	competitor_id VARCHAR(40) NOT NULL,
	Age INT NOT NULL,
	sex VARCHAR(1) NOT NULL,
	Place VARCHAR(1) NOT NULL,
	meet_date VARCHAR(10) NOT NULL,
	PRIMARY KEY (competitor_id),
	FOREIGN KEY (competitor_id) REFERENCES competitor (competitor_id)
);
--Creating total kg table--
CREATE TABLE Totalkg (
	competitor_id VARCHAR(40) NOT NULL,
	BodyWeightKg INT NOT NULL,
	Best3BenchKg INT NOT NULL,
	Best3SquatKg INT NOT NULL,
	Best3DeadliftKg INT NOT NULL,
	Totalkg INT NOT NULL,
	wilks_score INT NOT NULL,
	PRIMARY KEY (competitor_id),
    FOREIGN KEY (competitor_id) REFERENCES competitor (competitor_id)
);
--Creating performance table--
CREATE TABLE performance (
	performance_id VARCHAR(40) NOT NULL,
	competitor_id VARCHAR(40) NOT NULL,
	meet_id VARCHAR(40) NOT NULL,
	wilks_score INT NOT NULL,
	PRIMARY KEY (performance_id),
	FOREIGN KEY (competitor_id) REFERENCES competitor (competitor_id)

);

--Creating meet table--
CREATE TABLE meet (
	meet_id VARCHAR(40) NOT NULL,
	meet_name VARCHAR(200) NOT NULL,
	meet_date VARCHAR(10) NOT NULL,
	meet_country VARCHAR(40), 
	PRIMARY KEY (meet_id)

);


-- Joining totalkg and demographics tables to project df-- Left Join in SQL
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