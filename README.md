# ANOVA, Regression and Logistic Regression

- [ANOVA, Regression and Logistic Regression](#ANOVA-Regression-and-Logistic-Regression)
  - [Hypothesis Testing](#Hypothesis-Testing)
  - [Failing to Reject vs. Accept](#Failing-to-Reject-vs-Accept)
  - [P value](#P-value)
  - [One Sample T-test](#One-Sample-T-test)
    - [Verify if a population mean estimate is same as a **hypothesized value**, using a sample.](#Verify-if-a-population-mean-estimate-is-same-as-a-hypothesized-value-using-a-sample)
  - [Two Sample T-test](#Two-Sample-T-test)
    - [Verify if two population have the same mean using samples from either.](#Verify-if-two-population-have-the-same-mean-using-samples-from-either)
    - [Assumptions](#Assumptions)
  - [PROC SGPLOT](#PROC-SGPLOT)
    - [Visualize relationships b/w cat.Predictors vs. cont.Response](#Visualize-relationships-bw-catPredictors-vs-contResponse)
  - [PROC SGSCATTER](#PROC-SGSCATTER)
    - [Visualize the relationships b/w cont.Predictors vs. cont.Responses](#Visualize-the-relationships-bw-contPredictors-vs-contResponses)
  - [One Way ANOVA & PROC GLM](#One-Way-ANOVA--PROC-GLM)
    - [Detect effect on a cont.Reponse from the levels in a single cat.Predictor](#Detect-effect-on-a-contReponse-from-the-levels-in-a-single-catPredictor)
    - [Assumptions](#Assumptions-1)
  - [POST HOC PairWise Comparison](#POST-HOC-PairWise-Comparison)
    - [Detect which level in a cat.Predictor level is causing effect in ANOVA](#Detect-which-level-in-a-catPredictor-level-is-causing-effect-in-ANOVA)
  - [Pearson Correlation](#Pearson-Correlation)
    - [Detect degree of linear relationship between variables](#Detect-degree-of-linear-relationship-between-variables)
  - [Linear Regression](#Linear-Regression)
    - [Analyze the effect of a cont.Predictor on a cont.Response, also use the model to predict response.](#Analyze-the-effect-of-a-contPredictor-on-a-contResponse-also-use-the-model-to-predict-response)
  - [N-Way ANOVA](#N-Way-ANOVA)
    - [Analyze the effect of more than one cat.Predictors on a cont.Response](#Analyze-the-effect-of-more-than-one-catPredictors-on-a-contResponse)
  - [Multiple Linear Regression](#Multiple-Linear-Regression)
    - [Analyze the effect of multiple cont.Predictors on a cont.Response](#Analyze-the-effect-of-multiple-contPredictors-on-a-contResponse)
  - [Model Selection](#Model-Selection)
    - [Selecting the best models from all possible ones](#Selecting-the-best-models-from-all-possible-ones)
  - [Information Criterion](#Information-Criterion)
    - [comparative model evaluation (not absolute).](#comparative-model-evaluation-not-absolute)
  - [Model Post Fitting](#Model-Post-Fitting)
    - [Ensuring the model assumptions are met before trusting the model](#Ensuring-the-model-assumptions-are-met-before-trusting-the-model)
  - [Outliers vs. Influential Observations](#Outliers-vs-Influential-Observations)
  - [Detecting Collinearity](#Detecting-Collinearity)
    - [Leads to biases in the model](#Leads-to-biases-in-the-model)
  - [Predictive modelling](#Predictive-modelling)
    - [Applying a selected model to a new dataset](#Applying-a-selected-model-to-a-new-dataset)
  - [Data Scoring with your model](#Data-Scoring-with-your-model)
    - [Apply a model to predict response variables in a new dataset](#Apply-a-model-to-predict-response-variables-in-a-new-dataset)

## Hypothesis Testing

|                    | H<sub>0</sub> is __true__     | H<sub>0</sub> is __false__                 |
| ------------------ | ----------------------------- | ------------------------------- |
| __Fail to Reject__ | correct inference             | Type 2 Error  P= β              |
| __Reject__         | Type 1 error   P=α            | Correct inference / Power= P= 1-β |

## Failing to Reject vs. Accept

If the results of a test supports the alternative hypothesis, then the null hypothesis can be rejected as false. However, if the data does not support the alternative hypothesis, this does not mean that the null hypothesis is true/accepted. All it means is that the null hypothesis has not been disproven—hence the term "failure to reject." A "failure to reject" a hypothesis should not be confused with acceptance.

## P value

It measures the probability of observing a value as extreme as the one observed or more extreme, assuming that the H0 is true (H0 is usually that the means are same, so any difference is by chance). When the P value is low(significant), that means that the probability of observing the *effect size* (difference between the observed value and expected value) due to pure chance is low, ergo, the effect is not by chance.

## One Sample T-test

### Verify if a population mean estimate is same as a **hypothesized value**, using a sample.

Example: The mean price of a home in an area is $300,000. The hypothesized value is $300,000 and we use analysis on a sample to estimate the population mean.

It's used to check if our estimate of the population mean from a sample mean and standard error is accurate. A sample is taken and the sample mean is calculated. The null hypothesis is that the population mean is the statistically same as the sample mean, and the Ha is that they are different. Since the population std.dev is not known, its estimated using the *student's t distribution* which is similar to the normal distribution, but with a wider spread, and approaches the normal distribution when the sample size is large.
The *T statistic* estimates how far the sample mean is from the hypothesized mean. The hypothesized mean is our assumption, like we assume the mean price of homes in the bat area is 900k, and this is what we are testing with our sample.
If the H0 of pop.mean = sample.mean is true, then the T value will be small.
Given a T value, we need to see the probability of observing such a T-statistic. If that probability is high ( P > α ), then we fail to reject the H0, i.e. the probability of observing such a T-statistic is high. If the P-value low, that means the probability of observing such a T-statistic is low, so our assumption of H0 is wrong, and we reject the H0.  

```SAS
PROC TTEST data=stat1.normtemp 
		   plots(shownull)=interval
           H0=98.6;
    VAR bodytemp;
RUN;
```

- Here the data points to the dataset/sas table.
- H0 is the hypothesized mean
- Plots will plot an interval plot that shows the sample mean and the 95% confidence range for it, and `shownull` draws the hypothesized mean.

If the hypothesized mean lies outside the 95% confidence range, then the sample mean is very different from the hypo.mean. The T-stat is then expected to be large, and if the P-value for seeing such a large T-stat is low, then we know that H0 can be rejected, ergo the hypothesized mean is not the actual population mean. We should also ensure that the sample has a normal distribution and check this from the histogram and the normal QQ plot.

## Two Sample T-test

### Verify if two population have the same mean using samples from either.

Ex : Check if houses with heated garages have the same mean price as houses without heating in the garage. The two populations are demarcated from the same dataset using a categorical variable that denotes the availability of heating in the garage.

A two sample T test tries to see if two populations have the same mean, given a sample from each. This is unlike a one sample T-test where we are trying to see if the sample mean can accurately estimate the population mean.

### Assumptions

The assumptions for 2-sample T-Tests are:

- The obs are independent (eg: no repeat measurements)
- Normally distributed population means (check the samples if they follow a normal distribution)
- The two populations should have equal variances.

To test for equality in variances, use the folded F test and compute the *F-statistic*. F statistic is the ratio of the max(sample variance) to the min(sample variance), and its always >= 1. The closer it is to 1, the lesser the variance. The P value for this F-Statistic will also be >= significance level showing that the variances of the two populations (H0) is true.

```SAS
 PROC TTEST data=stat1.german 
            plots(shownull)=interval;
 	CLASS group;
    VAR change;
 RUN;
```

- The 2-Sample t test does not use the H0 parameter in the `PROC TTEST`. 
- Instead, it has the `class` which should be a categorical variable with exactly two levels.
- The `VAR` as usual indicates the measurement we are interested in.

SAS will give two T-statistic values for the 2 sample t-test - *Pooled* and *Satterthwaite*. 
Evaluate the equal variances assumption using the F-statistic and the P value for the Fstatistic.
*Pooled* T-statistic and its P value can be used if the F-statistic indicates equal variances in the populations.
If it does not, the  *Satterthwaite* T-Statistic compensates for the unequal variances and can be used instead.

## PROC SGPLOT

### Visualize relationships b/w cat.Predictors vs. cont.Response

`PROC SGPLOT` is used to create box plots to visualize the relationships between categorical predictor variables and continuous response variables.

``` SAS
 PROC SGPLOT data=stat1.garlic;
    VBOX bulbwt / category= fertilizer connect=mean;
 RUN;
```

 Here the `VBOX` option is used so a vertical box-plot is created using the response variable `bulbwt`. The categorical variables used for each box in the boxplot is the *fertilizer*. If *fertilizer* has 3 values, then there will be 3 Boxes in the blox-plot and they will be connected by their means because `connect=mean` option has been specified.

## PROC SGSCATTER

### Visualize the relationships b/w cont.Predictors vs. cont.Responses

Creates scatter plots. Can be used to create a whole panel of scatter plots that explore the relationship of the predictor variables to the response variables.

```SAS
PROC SGSCATTER data=STAT1.ameshousing3;
    PLOT SalePrice*(Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
         Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom) / reg;
    TITLE "Associations of Interval Variables with Sale Price";
RUN;
```

The format for the `plot` directive is *response_variable* __*__ (predictor1 predictor2 predictor3...)

## One Way ANOVA & PROC GLM

### Detect effect on a cont.Reponse from the levels in a single cat.Predictor

One way ANOVA is silimar to the 2-sample __T test__, in that we are trying to see if the population means of different populations are same or not, but unlike the 2-sample __T-Test__, the **One Way ANOVA can compare the means of more than 2 populations**.
ANOVA compares the within-group variation to the between-group variation to evaluate if the populations have the same mean.

R<sup>2</sup> called the co-efficient of determination, is a measure of how much the predictor variables explain the variability in the data and is between 0 and 1. The closer it is to 1, the predictor variables explain a larger portion of the variability and the closer it is to 0 the lesser the predictor variables are at explaining the variability. So this can be seen as a measure of how well we have chosen our predictor variables, and how well they explain the effect.

In the ANOVA table the __F-value__ indicates the amount of variability explained by the model and the larger the value, the more variability is explained by the model. The P-Value is the probability of getting an F-Value at least as extreme as thats computed by chance, and if its less than the significance level then we can reject the H0 of the population means being equal.

### Assumptions

- The obs are independent (eg: no repeat measurements)
- Normally distributed error terms (check using Normal QQ plots)
- The error terms should have equal variances.

```SAS
PROC GLM data=stat1.garlic plots=diagnostics;
 CLASS fertilizer;
 MODEL bulbwt = fertilizer;
 MEANS fertilizer / hovtest=levene;
RUN;
```

In `PROC GLM`, the `plots=diagnostics` option generates a panel of plots that lets us validate the normality of error terms assumptions. The `class` is the categorical variable. `model` specifies the response and predictor variables in the model. The `means` includes the option to run the `hovtest` (using levene's method in this case).

The `PROC GLM` displays the ANOVA table with the F-Value as well as the P value. If the P value is lesser than the significance level then we can say that the probability of seeing an F-value as extreme as the one computed, purely by chance is very small, and we can reject the H0 that the population means are equal (in other words, we reject the idea that the predictor valuable values do not affect the response variable). But before we can trust the P-value, we need to check the assumptions. The Normal QQ plots and the histograms give us an idea if the error terms are following a normal distribution. 

The HOV test will produce a test statistic and a P-value which we can use to evaluate the H0 of equal variances in the error terms. This simply tells us that at least one of levels in the categorical predictor variable has a significant effect on the response variable. To know which level has this effect, we need the post-hoc tests to compare every category level in the predictor with each other or against a chosen reference level.

## POST HOC PairWise Comparison

### Detect which level in a cat.Predictor level is causing effect in ANOVA

If we reject the H0 in AVONA, and determine that at-least one of the predictor variable levels is significantly different from the others, we  use the Post Hoc pairwise comparisons to see which one (or more) is different.
Here we can use 

- __Tukey's adjustment__ to compare between every pair
or
- __Dunnett's Adjustment__ to compare each category against a single "control" group

The results of the post hoc analysis are graphed using a diffogram. The diffogram's diagonal line represents the case when there is no difference between the means. Each pairwise comparison is plotted and the confidence intervals are represented as lines. If the condifence interval line touches the diagonal, then the means are not significantly different.
Control plots are another mechanism used for Dunnets's method where there is a control group. The Control plot has a shaded area and lines that represent the mean. if the line falls inside the shaded area, then the difference means for that variable compared to the control group is not significant.

```SAS
LSMEANS fertilizer / pdiff=all adjust=tukey;
LSMEANS fertilizer / pdiff=control('4') adjust=dunnett;
```

## Pearson Correlation

### Detect degree of linear relationship between variables  

The pearson correlation coefficient determines the strength of the linear association between two continuous variables - usually a predictor and a response. It can also be used to detect collinearity, or correlation between predictors. It is denoted by __r__ ranges from -1 to +1. The closer the value is to -1, the stronger the negative linear association between the variables. The closer it is to +1, the stronger the positive association. 0 indicates that the variables are not associated.

Gotchas :

- Corelation does not imply causation.
- Pearson correlation can only measure __linear__ associations. Associations can be non-linear as well.
- Outliners affect the correlation coefficients.

`PROC CORR` produces the pearson correlation coefficients and the p-values. You can use the `with` keyword to compare the variables in `var` to the variables in the `with`. Omitting the `with` statement will generate comparisons between all pairs of variables in the `var` statement. The `plots` can specify scatter plots with `nvars=all` to show all the variables. The proc produces the scatter-plots as well as the Pearson correlation coefficient to evaluate if there is a linear association between the variables.

```SAS
PROC CORR data=STAT1.BodyFat2
          plots(only)=scatter(nvar=all ellipse=none);
   VAR &interval;
   WITH PctBodyFat2;
   ID Case;
   TITLE "Correlations and Scatter Plots";
RUN;
```

## Linear Regression

### Analyze the effect of a cont.Predictor on a cont.Response, also use the model to predict response.

The basis of linear regression should be familiar. The `PROC REG` is the SAS proc for linear regression. The proc will create an ANOVA table and compute the F-statistic and the P-value for it , with the H0 being that the response variable and the predictor do not have any association. So if the p-value is significant(< alpha), the we can reject this H0 (no association) and infer that there is a significant association between the predictor and the response variable.

The only thing that `proc reg` requires apart from the data set is the `model`. The `plots` produce the graphs that we can use to validate the test.

```SAS
PROC REG data=stat1.bodyfat2
		 plots=all;
 model PctBodyFat2=Weight;
 run;
```

## N-Way ANOVA

### Analyze the effect of more than one cat.Predictors on a cont.Response

The reason to do an N-way (N = # of cat.Predictors) ANOVA rather than N * One-Way ANOVAs is that N-Way ANOVA also analyses the __interactions__ between the N predictors. Also note that a One-Way ANOVA has one cat.Predictor with N levels, while an N-way ANOVA has N cat.Predictors, each with thier own levels.

The first step is to visualize the interactions to make sure there are some. To do this you can use an `PROC sgplot` with a `vline` option.

```SAS
proc SGPLOT data=stat1.drug;
	vline DrugDose / group=Disease response=BloodP stat=mean markers;
	format DrugDose dosefmt.; 
RUN;
```

Here the VLine splits the data by a cat.Predictor (DrugDose) on the X-Axis. Then its grouped by disease, so for each dose the observation for each group is plotted. The `response` or the value to be plotted is the blood pressure, and the `stat` specifies what statistic to plot. If the plot has as similar pattern, then there may not be any interactions, however if atleast one group has a different plot then we can say that the response variable changes differently for atleast one pair of the cat.Predictor and group - there is an interaction.

Now we can do an N-way ANOVA :

```SAS
PROC GLM data=stat1.drug plots=all;
Class drugdose disease;
model BloodP = drugdose disease drugdose*disease;
lsmeans DrugDose*Disease / slice=Disease;
format Drugdose dosefmt.;
store out=modelitems;
run;
quit;
```

Here the cat.Predictors we are using are drugdose and disease, in the `CLASS`. The `MODEL` includes the reponse variable and the predictors and the interaction term. `LSMEANS` will produce the lsmeans table, and here we are slicing it by the disease. This includes the F value for each ans corresponding P-value, which will tell us if the particular `slice` has a ststistically significant effect for each slice.  

## Multiple Linear Regression

### Analyze the effect of multiple cont.Predictors on a cont.Response

A best practice in a two-way ANOVA is to plot the data to identify possible interactions between the variables. An interaction occurs when the difference between group means of one variable changes at different levels of another variable. This causes non-parallel lines in the interaction plot.

```SAS
%LET var = Age Weight Height Neck  Abdomen Hip Thigh  Ankle Biceps Forearm Wrist;

PROC REG data=stat1.bodyfat2;
MODEL PctBodyfat2 = &var;
RUN;
QUIT;
```

In the example, the `PROC REG` is used like in the case of Linear Regression, but there are more terms in the model. This generates the standard ANOVA table for the overall model  performance, and the P-value will indicate if there is a significant effect on the response by the predictors. If we have a lot of predictors, we should use the adjusted R<sup>2</sup> to account for the effect of additional terms.
The table also gives the parameter estimates for all the terms and we can try to eliminate the terms with the highest P-value (least significant) to simplify the model without sacrificing accuracy. Every term removed will reduce the overall P-value, but the magnitude of the reduction will be small the more insignificant the term is (removing an highly effective term will increase the overall model P-value considerably)

## Model Selection

### Selecting the best models from all possible ones

With _k_ predictors, there will be _2<sup>k</sup>_ models. So we need tools that can evaluate models and select effective models.
Common Model selection approaches :
- All possible regressions
  - Computes all possible regression models and evaluates them
  - Practical only for a reasonable number of perdictors
  - SAS can return the best _n_ models using the `BEST=` option. All _2<sup>k</sup>_ models are still evaluated before the best _n_ is selected.
- Step-wise selection
  - does not compute all possible models, and is faster and more reasonable for very large number of predictors.
    - **Forward** - model starts with 0 predictors
      - the F-statistic for ever variable not in the model is calculated, and the highest one if above a threshold is added to the model.
      - once added the predictor stays, even if subsequent predictors make it redundant.
    - **Backward** - model starts with all predictors
      - The F-statistic of every variable in the model is computed and the least significant is removed.
      - once removed the predictor stays out, even if adding it could have yeilded a better model.
    - **Step-wise** - starts with no predictors like the forward selection.
      - New predictors are added at every step by checking their F-statistic of the vars not in the model.
      - The existing predictors' F-statistic are also evaluated and the insignificant ones are dropped  (like in backward selection)
      - Stepwise techniques don't take any collinearity in your model into account. Collinearity means that predictor variables in the same model are highly correlated.

Automatic model selection has issues and biases. Some are due to using the p-values and some are due to using the same sample to build the model and evaluate the model.

- __Overfitting the data__ when the same sample is used to build the model and evaluate it, the model fits too well for the sample and becomes less significant for the population.
- divide the data set in to two and use one to build the model and the other to validate the model.
- This is impractical if the available sample size is low.
- Techniques like `k-fold cross validation` and `bootstrap method` can avoid overfitting with small sample sizes.  

```SAS
%LET interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
         Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom ;

PROC GLMSELECT data=STAT1.ameshousing3 plots=all;
	STEPWISE: model SalePrice = &interval / showpvalues selection=stepwise details=steps select=SL slstay=0.05 slentry=0.05;
	TITLE "Stepwise Model Selection for SalePrice - SL 0.05";
run;
```

## Information Criterion

### comparative model evaluation (not absolute).

Information criterion are used to comparatively assess the fit of a model between many. They all try to point to the model that explains the most variability in the data with the least predictors. They all have a penalty to using more variables in the model and this penalty is what is different between them. Smaller values for information criteria is considered better.
- AIC
- AICC (Corrected AIC) - Used for small sample sizes
- BIC
- SBC

Adjusted _R<sup>2</sup>_ is similar to the Information Criteria in that, it penalizes the addition of terms. Since adding a term will never reduce _R<sup>2</sup>_ value since the worst that could happen is that the term added has no effect on the response variable and hence the _R<sup>2</sup>_ stays the same. The model becomes unnecessarily complex however, and this is why adjuisted _R<sup>2</sup>_ will give a better estimate and balance the complexity of the model vs the variability explained by it.

## Model Post Fitting

### Ensuring the model assumptions are met before trusting the model

A model might have an impressive _R<sup>2</sup>_ value, but that does not mean that the model is accurate, if we violated our model assumptions when we created it. The assumptions are :

1. The predictors and the response have a linear realtionship
    - Can be checked visually usig a scatterplot.
2. The errors (residuals - diff between the prediction by model and actual) are normally distributed.
    - Use residual plots. Generated by default by `PROC REG`.
    - Random scatter indicates that the residuals are normally distributed.
    - With multiple terms, the residual plot that does not appear random idicats the term that is violating the assumption.
3. The errors have equal variances at each value of the predictor
4. The errors are independent.

The pattern in the residual plots indicate the assumption that is being violated.
    - Curve / Quadratic shape  -> indicates that the `linearity` assumption is violated.
    - Funnel  shape -> `assumption of equal variances` of the error terms are violatied
    - Cycle/Sine Wave shape -> assumption of independent measurements is violated.

## Outliers vs. Influential Observations

An Outlier is an unusual datapoint, whereas an Influential Observation is an Outlier that has a significant effect on the model. If removing an observation produces a significant change to the parameter estimates, then that is an influenatial observation.

Detection :

Both `PROC GLMSELECT` as well as `PROC REG` produces the effect plots that include the following plots.

- __Outliers - Students residuals__
  - convert the residuals in to the same unit as the standard deviation.
  - Based on the distribution, 65% of values will be within 1 SD, 95% within 2 SD, and 99 %within 3 SDs.
  - If the student residual is 0-2 no issue(95% data falls in this range), 2-3 is unlikely and > 3 is definitely an outlier.
- __Influential Observations - CooksD, Rstudent, DFFits.__
  - **Rsudent** 
    - calcualted as the diff in rtesiduals between the standard model and the model with that observation removed.
    - if the Student and Rstudent values are different or its > 3 that indicates the value is influential.
  - **CooksD**
      - used for explanatory analysis, for parameter estimates
      - It estimates the parameters with each obs eliminated and compares this with the parameters when all obs are included.
          - if there is a significant change in the parameters, thats an influential obs
  - **DFFits**
      - used for predictive models.
      - It generates the predicted value with two data models, the first with all obs, and the second with that obs removed
      - If there is a big difference betweent the predicted values, then the obs is influential.
  - **DFBETAS** 
    - while Rstudent residuals/ Cook'sD/DFFits analyze the influence of an observarion, the DF betas lets you see which atttibure of feature in the observation is casuing this influence.
    - This is similar to the cooksd method and is calculated by estimating the coefficient for the variable with all the data and then substracting the the coefficient for the variable with the observation removed. This difference is divided by the standard err.
    - A large (>2) value for the dfbetas indicate that the variable has a large impact.

In SAS, you can use the `PROC GLMSELECT` to do step-wise selection of a model and then use `PROC REG` to evaluate the influential observations. `PROC GLMSELECT` produces a macro variable `_GLSIND` that stores the predictors selected for the final model in `PROC GLMSELECT`.

```
proc glmselect data=STAT1.ameshousing3 plots=all;
	STEPWISE: model SalePrice = &interval / selection=stepwise details=steps select=SL slentry=0.05 slstay=0.05;
	title "Stepwise Model Selection for SalePrice - SL 0.05";
run;
quit;

proc reg data=STAT1.ameshousing3 
         plots(only label)=
              (RSTUDENTBYPREDICTED 
               COOKSD 
               DFFITS 
               DFBETAS);
    SigLimit: model SalePrice = &_GLSIND; 
    title 'SigLimit Model - Plots of Diagnostic Statistics';
run;
quit;

```

## Detecting Collinearity

### Leads to biases in the model

Collinearity or AutoCollinearity is when the predictors are closely related. This does not violate any test assumptions, however it leads to biases and incorrect P-values.

- Collinearity should be checked before model selection.
- Both `PROC CORR`, and `PROC REG` with `VIF` option can be used.
- `PROC CORR` will give the pearson correlation and the p-value. The closer it is to +/-1 the higher the correlation or collinearity.
  - Typically you would want to do something like
      ```SAS
      PROC CORR data=housingdata;
        VAR predictor1 predictor2;
        WITH suspect_predictor;
      RUN;
      ```
  - this compares the predictors in the `VAR` with the one specified by `WITH` and generates the Pearson Correlation for each comparison. This tells us if any of the predictors in the `VAR` are correlated with the one in `WITH` 
- Alternatively, `PROC REG` with the VIF option will report the variance inflation or `VIF` along with the parameter estimates. __If the VIF for any term is greater than 10, then the term is likely involved in collinearity.__

## Predictive modelling

### Applying a selected model to a new dataset

Predcitive modelling start with **data partitioning**. The model is trained and the validation set is used to evaluate the model. Then the best model is chosen and applied to new data to predict the outcome.

Predictive modelling can be __Parametric__ based on formulas like regression analysis or __Non-Parametric__ which are based on rules like decision trees and random forests. Predictive modelling is always a balance between Overfitting and Underfitting - there is no perfect model.

- __Overfitting__ - These are generally complex models that are too flexible and fits the random noise in the sample as well. This _leads to higher variance_ when applied to a population. This generally happens when the modeller tries to maximize the _R<sup>2</sup>_ value, since adding new variables and overfitting will never reduce the _R<sup>2</sup>_
- __Underfitting__ - The are models that are too simplistic and systematically fail to see the pattern in data. This leads to a model that _generates a biased prediction_.

- __Data Partitioning__ - splits the data sample into two sets - training and validation. This is to honestly assess a model and its fit on data that was not present when the model was built, but from the same population. Partitioning can be done only when there is a sufficiently large sample size. If the sample size is small or moderate, other methods like cross validation can be used, which enables us to use the same data set for model building as well as validation without biases. `PROC GLMSELECT` can use honest assesment to select models and can work with a single input dataset and partition it or work with data that is already paritioned in to training and validation datasets.

```SAS
PROC GLMSELECT data = <training_data> seed = <int>;
MODEL response = predictor_terms / showpvalues selection=stepwise(select=AIC choose=validate) details=steps;
PARTITION FRACTION (TEST= .1 VALIDATE = .15);
RUN;
```

In this example, the data set is randomly partitioned in to 3 - Training(75%), validation(15%) and test(10%) sets. The `SEED` is an interger that will reproduce the same obs in the parititions if we need to recreate the exact partitions again. The Model statement options use the **stepwise** model selection. The AIC is used as the selection criteria (default selection criteria is AIC) and the model is chosen based on the best ASE (average squared err) value for the *validation* dataset.

## Data Scoring with your model

### Apply a model to predict response variables in a new dataset

During model building, we applied an algorithm to get a model. If this is a parametric model, then we have a formula. Scoring is the process of applying this formula on new data to predict a target variable.

Data may need to be transformed before it can be scored. Basically the same changes done to the traning and validation datasets need to be done here as well.

Scoring can be done 3 ways :

1. Use `PROC GLMSELECT` to generate the model and score data in one go
    - Inefficient - the model is ephemeral and if another data set needs to be scored, it needs to be generated again.
    - This is also slow if the training dataset is large, becasue the model is generated each time.
2. Use `STORE` in `PROC GLMSELECT` and then a `SCORE` in `PROC PLM`
    - Model generated by `PROC GLMSELECT` is stored in an item store, so its persistent.
       ```SAS
        PROC GLMSELECT data= <data> ;
         MODEL SalePrice = LotArea Home_Age / selection=stepwise details=summary;
         PARTITION FRACTION (validate=0.1 test=0.05);
         STORE out=housingdata;
        RUN; 
       ```
       
    - Then the `SCORE` statement is used in the subsequent `PROC PLM` to act on the Model in the *item store*
      ``` SAS
      PROC PLM restore= <item_store>
        SCORE data= <new data that needs to be predicted> out= <dataset to save input with predictions/scores>
      RUN;
      ```
    - Can use very large training dataset. No need to rebuild the model. 
    - Not compatible with older versions of SAS
3. Use `STORE` in `PROC GLMSELECT` and then `CODE` in `PROC PLM` to generate scoring code, and finally `DATA` to run the code generated by `PROC PLM`.
    - same as above, but 3 steps .
      ``` SAS
      PROC PLM restore= <item_store>
        CODE file= <path to create new .sas file> 
      RUN;

      DATA <name of result dataset>
         set <Libref to input data to be predicted/scored>
         %include <path to .sas file created by CODE step>
      RUN;
      ```
    - No need to share the item store the generated code will contain everything needed to do scoring.
    - compatible with older versions of SAS.
