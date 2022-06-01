# Future_Of_Powerlifting_Analysis

Slideshow Presentation: [Link](https://docs.google.com/presentation/d/110ar9MJyL7VZzJPCfjMCoU1sGFIUQ4SeMalfpz2DMkQ/edit?usp=sharing)

Speaker Notes: [Link](https://docs.google.com/document/d/1axPjQrbFPo_KmnWXgIdj64aFNCwE1pa7vckhahPhZZI/edit?usp=sharing)

Dashboard/Story: [Link](https://public.tableau.com/app/profile/juan.de.haro/viz/PowerliftingStory_16538458108750/Story2?publish=yes)

Dashboard Draft: [Link](https://docs.google.com/presentation/d/1ADHR1QWhtA9Bc03uDD5qhBo7okVpN69lQsGGj_NB6TU/edit?usp=sharing)



## Topic  
We wanted to analyze a powerlifting dataset where historical progression of world class powerlifters were tracked, which would allow us to potentially predict future performance, based on a combination of factors, including bodyweight, age, gender, and best lift from each of the three powerlifting categories: squat, bench, and deadlift.

## Reason for selecting topic 
Our goal was to create a snapshot of the future of the powerlifting sport and performance expectations. We felt like this might allow us to gain a better understanding of the limitations, and corresponding limiting factors, in human strength.

## Description of the data source
“This dataset is a snapshot of the OpenPowerlifting database as of April 2019. OpenPowerlifting is creating a public-domain archive of powerlifting history. Powerlifting is a sport in which competitors compete to lift the most weight for their class in three separate barbell lifts: the Squat, Bench, and Deadlift.” (openpowerlifting.org/)

![image](https://user-images.githubusercontent.com/95376544/170395993-2c01f6aa-1c50-4df9-b21a-5164bdc5927a.png)
(Screenshot from https://www.kaggle.com/datasets/open-powerlifting/powerlifting-database)

## Questions we hope to answer with the data
- Is there an increase in performance year-after-year? 
- Will the performance of these athletes plateau at some point?
- What is the importance of the athlete's age and bodyweight in powerlifting in regards to how much they can lift?

## Description of Data Exploration Phase
- The data obtained from Openpowerlifting was stored in an AWS bucket. Using PySpark, we read the file into a dataframe and stored the needed dataframes in Postgres SQL.
- In a Jupyter Notebook, Pandas was used to load the dataset into a DataFrame and the datatypes of the columns were ascertained using “dtypes”.
- Some columns, such as ‘Place’ and ‘Date’ needed to be formatted correctly so that they could be used in the model.
- Since we are only interested in the columns BodyweightKg, Sex, Age, Best3BenchKg, Best3SquatKg, Best3DeadliftKg, and meet_date as features, with TotalKg as the target, the rest of the columns were dropped.
- We filtered the ‘Place’ column for values equal to ‘1’, the ‘Event’ column for values equal to ‘SBD’ (Squat, Bench, Deadlift), and the ‘Age’ column for values greater than or equal to ‘18’. This allowed us to focus on competitors who are over the age of 18, placed 1st, and had entries for squat, bench, and deadlift.
- The ‘Sex’ column was converted to a category to represent ‘0’ for females and ‘1’ for males. It was then converted to an integer dtype.

![image](https://user-images.githubusercontent.com/95376544/170396246-819fb11d-4240-4342-923a-988c3650e399.png)
(Screenshot of datatype conversion within Jupyter Notebook)

## Description of Analysis Phase
- The purpose of our analysis was to gain insight on the future of the sport by predicting how performance by the top competitors, which we measured in TotalKg lifted, is affected by factors such as Age, Gender, and Bodyweight.
- For our analysis, we are using only BodyweightKg, Sex, Age, Best3BenchKg, Best3SquatKg, Best3DeadliftKg, and Date as the features and TotalKg as the target.
- Because our selected dataset is continuous, we are using linear regression as our supervised learning model. If we were looking for categorical and discrete results, we would use logistic regression instead.

## Description of Machine Learning Process
- Preprocessing: The dataset used was found through OpenPowerlifitng and stored in SQL. It had already been somewhat structured and suitable for our needs. However, the “place” column was filtered to only include records for competitors who achieved 1st place, “event” was filtered for “SBD” (squat, bench, & deadlift), and “age” was filtered for 18+. The “meet_date” column was also converted to a unified format using Pandas’ “to_datetime” function, “sex” was converted to a binary category (‘0’ for female, ‘1’ for male), and the “competitor_id” column was renamed “ID”.
- Feature Engineering & Selection: The features we selected were “sex” (gender), “age”, “best3squatkg”, “best3benchkg”, “best3deadliftkg” (highest kg lifted for each competitor in each category), “bodyweightkg” (competitor’s bodyweight), and “meet_date” (date of competition). The target used was “totalkg” (sum total of kilograms lifted by competitor). The overall goal in selecting these features was to be able to predict future increases or decreases in “totalkg” based on historical achievements in ‘SBD’ and to measure the effects of the selected features on said predictions. Ultimately, the goal was to create a snapshot of the future of the powerlifting sport.
- Splitting the Data into Training & Testing: Training and testing data was created using Scikit-learn’s train_test_split function.
- Model Choice: The LinearRegression model from Scikit-learn was chosen because it best fit our dataset, which contained continuous, numerical values. One potential problem will be that our model will not be able to completely account for all realistic limitations on human strength, and thus the predicted values will likely not be truly realistic.
- Changes in Model: No changes were made to the model between the 2nd and 3rd week deliverables.
- Training the Model: The model was trained to use factors such as a competitor’s age, best squat lift, best bench lift, best deadlift, bodyweight, and gender to predict total kg output for future competitions. Test data was compared to alternative “predictions” of past lifting achievements in order to determine the model’s predictive accuracy.
- Accuracy Score: To produce an accuracy score, we used Scikit-learn’s r2_score function, which has concluded an accuracy score of 99.55%. Initially, we had selected the balanced_accuracy_score function for our accuracy score testing, but eventually realized that because the balanced_accuracy_score was meant to be used as a classification metric, it would not be suitable for a regression problem.

![image](https://user-images.githubusercontent.com/95376544/170396344-a0908f67-0fb1-4552-845a-1ec0372b953d.png)
(Screenshot of R2 score calculation once the data was fitted to the model)

## Description of Testing & Quality Assurance
- All code used for ETL, creating the database, and the data modeling process has been tested and confirmed operable.
- The connection string that allows our code to query and extract data from the database has been tested and confirmed operable.
- Datatypes for the relevant columns extracted from our dataset have been confirmed to either already meet our needs and expectations or have been appropriately converted.
- Filters have been correctly applied to the data used in the data modeling process, such that the inputs and target only include relevant data that we preselected (E.g. only records for competitors 18 or older who earned 1st place in squat, bench, or deadlift competitions were examined).
- Predicted data that was produced by the model has been correctly loaded into a dataframe for final analysis.
- Initially, we attempted to use the balanced_accuracy_score package from Scikit-learn to produce an accuracy score for our model. We eventually realized this was a mistake because this is to be used as a classification metric and not for a regression problem. Thus, we decided to use the R-Squared (R2) score instead, which has been confirmed to produce a relevant accuracy score for our model.

# Technology Used

## Data Cleaning and Analysis
Python and Pandas for cleaning data and exploratory data analysis inside of a Jupyter Notebook. Excel was used initially to produce draft visualizations.

## Database Storage
PostgreSQL and PySpark were used to establish and manage the database, which was stored remotely using the AWS Relational Database Service. The data used to populate the database was initially extracted from a CSV file. Psycopg2 was used to connect our model to the database. Excel was also used initially to create a mock database.

## Machine Learning
Scikit-learn packages, including LinearRegression, R2 Score, and train_test_split, were used to create and train the model. Linear Regression (supervised machine learning) was applied to the data to produce predictions. NumPy was used to create IDs for each row in the created dataset. The model was connected to the database using Psycopg 2, a PostgreSQL database adapter for Python. 

## Dashboard
Tableau was used to create the dashboard. A link to the Tableau dashboard will be found at the top of the project's README.

![image](https://user-images.githubusercontent.com/95376544/170396509-e530d7c8-85d3-4f72-b0ea-9074cdcb56b5.png)
(Preview of Tableau Dashboard)
