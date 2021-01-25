# Predicting Patient Wait Time

The goal of this project is to develop machine learning models to predict the wait time that patients at a medical facility will experience before starting their appointments. It is based on a challenge from the Medical Analytics Group, which can be found here along with the full dataset used: https://medicalanalytics.group/operational-data-challenge/. (Note that the full dataset contains records from four facilities, but only the one labeled F3 was used in this project.) The use of such models can help hospital staff prepare for increases in traffic and patient waits ahead of time, and also help identify what factors are contributing to long wait times so that the hospital can review ways to improve those factors.

Each group member's code resides in the branch of this repository with their name on it, and the final pieces agreed upon by the whole group can be found in the main branch. The main branch also contains our final presentation. The contents of each folder in the main branch are as follows:

Group_Resources: This contains the instructions we were given for this project, link to notes taken at group meetings, and data files.

Data_Exploration: This contains code from data exploration and feature selection. This includes the making of histograms and a heatmap to visualize data distributions and relationships, and the removal of variables that we decided were unnecessary for modelling.

Machine_Learning_Models: This contains the code for each of our machine learning models, including calculations of the Mean Standard Error for each model and various visualizations. The three models used are Multiple Linear Regression, Random Forest, and Support Vector Regression.

Conclusion_Visualization: This contains the code for plotting the MSEs for each model on a barplot for a visual comparison of the effectiveness of the different models at predicting wait time.
