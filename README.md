# Mass_Strength_Analysis
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

# Technology Used

## Communication
Slack Group Direct Message, Google Docs for drafting answers/responses to questions from rubric and stated goals, and Google Slides for presentation.

## Data Cleaning and Analysis
Pandas for cleaning data and EDA and Tableau for analysis/visualization. Python will also be used for EDA.

## Database Storage
Postgres/pgAdmin for managing the DB and an AWS S3 Bucket for storage of the dataset. Excel will also be used initially to create a mock database.

## Machine Learning
A combination of Scikit-Learn, SciPy, Keras, and TensorFlow will be used in some capacity. Using supervised ML, we will apply Linear Regression to the dataset for training and testing purposes.

## Dashboard
A Flask template and D3.js. The finalized Dashboard will be deployed on Github Pages.
