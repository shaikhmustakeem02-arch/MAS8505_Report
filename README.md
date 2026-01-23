# MAS8505 Coursework - Learner Disengagement Analysis Using MOOC Data
This repository contains the coursework submission for the MAS8505 module.
The project analyses learner engagement and disengagement patterns in a FutureLearn MOOC, focusing on how disengagement varies across countries and how these insights can support targeted educational interventions.

## Project Overview 
The analysis examines learner progression through course steps by combining enrolment information with step-level activity data. A two-cycle CRISP-DM framework is used to move from descriptive analysis to decision-oriented recommendations.
The project prioritises interpretability, reproducibility, and stakeholder rellevance rather than predictive modelling.

## Research Questions

## Cycle 1 - Descriptive Analysis
At what point in the course do learners most frequently disengage, and does this vary by country?

## Cycle 2 - Decision-Oriented Analysis
Which countries exhibit early or sustained disengagement patterns, and where should targeted offline or blended learning interventions be prioritised? 

# Data Description
The analysis uses anonymised data from a FutureLearn MOOC:

-Enrolment data (7 CSV files)
-Step-level activity data (7 CSV files)

All datasets are automatically loaded using ProjectTemplate.
There is no manual separation into raw or cleaned data folders; all transformations are handled through scripted munging steps and cached objects.

# Analytical Framework
The project follows the CRISP-DM methodology implemented across two iterative cycles:

Cycle 1:
Identification of learner disengagement points and comparison of disengagement behabior across countries.

Cycle 2:
Translation of Cycle 1 outputs into actionable insights, including country segmentation and identification of critical disengagement stages to support intervention planning.
Each cycle includes Business Understanding, Data Understanding, Data Preparation, Analysis, and Evaluation stages.

# Project Structure

├── data/            # Auto-loaded FutureLearn CSV files
├── munge/           # Data preparation and transformation scripts
├── cache/           # Cached intermediate objects (ProjectTemplate)
├── reports/         # R Markdown analysis report
├── MAS8505_Report.Rproj
└── README.md

# Software and Dependencies
-R
-ProjectTemplate
-renv

All package dependencies are managed using renv to ensure consistent and reproducible execution.

# How to Run the Project
Open the project using the MAS8505_Report.Rproj file.
In the R console, run:
library(ProjetcTemplate)
load.project()
Open the R markdown file located in the reports/ directory.
Click Knit to generate the final report.

# Reproducibility and Best Practices
All data preparation steps are scripted in the munge/ directory.
Intermediate results are cached using ProjectTemplate to improve efficiency.
Analysis code and narrative are integrated using R Markdown.
Version control supports traceability of analytical changes.
These pracctices ensure the analysis is transparent, reproducible, and auditable.

#Coursework Context
This project is submitted as part of the MAS8505 module coursework.
The analysis emphasises structured reasoning, methodological clarity, and business-oriented interpretation aligned with academic assessment requirements.

# Limitations
Learner engagement is inferred from steo completion and may not capture all forms of learning behavior.
Country-level aggregation may obscure variation within individual countries.
The analysis is decriptive and does not establish casual relationships.

# Future Work
Potential extensions include:
Incorporating temporal engagement pattterns
Analysing learner characteristics where available
Evaluating engagement changes following targeted interventions
