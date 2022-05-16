# Future_Of_Powerlifting_Analysis

Presentation Draft: [Link](https://docs.google.com/presentation/d/110ar9MJyL7VZzJPCfjMCoU1sGFIUQ4SeMalfpz2DMkQ/edit?usp=sharing)

Dashboard Draft: [Link](https://docs.google.com/presentation/d/1ADHR1QWhtA9Bc03uDD5qhBo7okVpN69lQsGGj_NB6TU/edit?usp=sharing)

## Topic  
Analysis of a powerlifting dataset where historical progression of world class powerlifters will be tracked in order to predict future performance, based on Wilks Scores (an aggregate calculation that combines gender, bodyweight, and best lift from each of the three powerlifting categories: squat, bench, and deadlift).

## Reason for selecting topic 
To create a snapshot of the future of the powerlifting sport and performance expectations. This may allow us to gain a better understanding of the limitations, and corresponding limiting factors, in human strength.

## Description of the data source
“This dataset is a snapshot of the OpenPowerlifting database as of April 2019. OpenPowerlifting is creating a public-domain archive of powerlifting history. Powerlifting is a sport in which competitors compete to lift the most weight for their class in three separate barbell lifts: the Squat, Bench, and Deadlift.” (openpowerlifting.org/)

## Questions we hope to answer with the data
- How much does the average Wilks Score of the top powerlifters increase each year? 
- Will the performance of these athletes plateau at some point?
- Is there bias in the Wilks Score formula, and if so, what other formulas could be used instead?

## Description of Data Exploration Phase
- In a Jupyter Notebook, Pandas was used to load the dataset into a DataFrame and the datatypes of the columns were ascertained using “dtypes”.
- Some columns, such as ‘Place’ and ‘Date’ needed to be formatted correctly so that they could be used in the model.
- Since we are only interested in the columns Sex, Age, Best3BenchKg, Best3SquatKg, Best3DeadliftKg, and Date as features, with TotalKg as the target, the rest of the columns were dropped.
- We filtered the ‘Place’ column for values equal to ‘1’, the ‘Event’ column for values equal to ‘SBD’ (Squat, Bench, Deadlift), and the ‘Age’ column for values greater than or equal to ‘18’. This allowed us to focus on competitors who are over the age of 18, placed 1st, and had entries for squat, bench, and deadlift.
- The ‘Sex’ column was converted to a category to represent ‘0’ for females and ‘1’ for males. It was then converted to an integer dtype.

## Description of Analysis Phase
- We are conducting an analysis on an open-sourced powerlifting dataset to gain insight on the future of the sport by predicting how performance (TotalKg) of competitors will be affected in the future by factors such as Age, Sex, and Bodyweight.
- For our analysis, we are using only Sex, Age, Best3BenchKg, Best3SquatKg, Best3DeadliftKg, and Date as the features and TotalKg as the target.
- Because the dataset we are using is continuous, we are using linear regression as our supervised learning model. If we were looking for categorical and discrete results, we would use logistic regression instead.

# Technology Used

## Communication
Slack Group Direct Message, Google Docs for drafting answers/responses to questions from rubric and stated goals, and Google Slides for presentation.

## Data Cleaning and Analysis
Pandas for cleaning data and EDA and Excel was used this time to produce draft visualizations, but Tableau will be used in the future. Python will also be used for EDA.

## Database Storage
Postgres/pgAdmin for managing the DB and an AWS S3 Bucket for storage of the dataset. Excel will also be used initially to create a mock database.

## Machine Learning
A combination of Scikit-Learn, SciPy, Keras, and TensorFlow will be used in some capacity. Using supervised ML, we will apply Linear Regression to the dataset for training and testing purposes.

## Dashboard
Tableau will be used to create the dashboard. A link to the Tableau dashboard will be found at the top of the README.
