# MultivariateAnalysis

### Project Description
This project aims to analyze the consumption of different protein sources across 25 European countries around 1970, using the "Protein" dataset from the `MultBiplotR` package. Various multivariate analysis techniques are applied to explore regional differences in protein food consumption and to conduct hypothesis tests on population means.

### Contents

- **Data Loading**: The data is loaded from the `MultBiplotR` package and contains 11 variables (region, red meat consumption, white meat consumption, eggs, milk, fish, cereals, starches, nuts, and fruits/vegetables).
  
- **Descriptive Statistics**:
  - The mean vector and covariance matrix for the numeric variables are calculated.
  - Differences in protein consumption by region (North, Center, and South of Europe) are analyzed.
  
- **Visualizations**:
  - **Star Plot**: A visual representation of protein consumption using a star plot.
  - **Chernoff Faces**: Used to represent differences in food consumption through facial expressions.
  
- **Hypothesis Testing**:
  - **Univariate**: t-tests are performed to compare the sample means of food consumption with hypothetical means.
  - **Multivariate**: Hotelling's T² statistic is used to evaluate whether the sample means are significantly different from the hypothetical means.
  
- **Multivariate Normality**: Mardia's tests and Q-Q plots are used to check the normality of the data.
  
- **Outlier Detection**: Multivariate outliers are detected using Mahalanobis distances.


### Results

Significant differences in protein consumption were found between European regions. The North stands out for its high consumption of milk and fish, while the Center consumes more meat. Multivariate tests indicated significant differences in the sample means compared to the hypothetical means.
