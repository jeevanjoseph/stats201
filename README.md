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
    - [Simple Linear Regression](#Simple-Linear-Regression)
      - [Analyze the effect of a cont.Predictor on a cont.Response, also use the model to predict response.](#Analyze-the-effect-of-a-contPredictor-on-a-contResponse-also-use-the-model-to-predict-response)
    - [N-Way ANOVA](#N-Way-ANOVA)
      - [Analyze the effect of more than one cat.Predictors on a cont.Response](#Analyze-the-effect-of-more-than-one-catPredictors-on-a-contResponse)
    - [Multiple Linear Regression](#Multiple-Linear-Regression)
      - [Analyze the effect of multiple cont.Predictors on a cont.Response](#Analyze-the-effect-of-multiple-contPredictors-on-a-contResponse)
    - [Model Selection for Linear Regression Models](#Model-Selection-for-Linear-Regression-Models)
      - [Selecting the best models from all possible ones](#Selecting-the-best-models-from-all-possible-ones)
    - [Information Criterion](#Information-Criterion)
      - [Measures for comparative model evaluation](#Measures-for-comparative-model-evaluation)
    - [Model Post Fitting](#Model-Post-Fitting)
      - [Steps to ensure the model assumptions are met before trusting the model](#Steps-to-ensure-the-model-assumptions-are-met-before-trusting-the-model)
    - [Outliers vs. Influential Observations](#Outliers-vs-Influential-Observations)
    - [Detecting Collinearity](#Detecting-Collinearity)
      - [Collinearity leads to biases in the model](#Collinearity-leads-to-biases-in-the-model)
  - [Predictive modelling](#Predictive-modelling)
    - [Applying a selected model to a new dataset](#Applying-a-selected-model-to-a-new-dataset)
  - [Data Scoring with your model](#Data-Scoring-with-your-model)
    - [Apply a model to predict response variables in a new dataset](#Apply-a-model-to-predict-response-variables-in-a-new-dataset)
  - [Logistic Regression](#Logistic-Regression)
    - [Model the relationship between a **binary response** vs. set of predictors (cont. or cat.)](#Model-the-relationship-between-a-binary-response-vs-set-of-predictors-cont-or-cat)
    - [PROC FREQ](#PROC-FREQ)
      - [Discover associations and evaluate classifier performance](#Discover-associations-and-evaluate-classifier-performance)
    - [Classifier Performance](#Classifier-Performance)
    - [Tests of association](#Tests-of-association)
    - [Detecting Ordinal Associations](#Detecting-Ordinal-Associations)
    - [PROC LOGISTIC](#PROC-LOGISTIC)
      - [Oversampling](#Oversampling)
      - [Result interpretation](#Result-interpretation)
    - [Interaction effects in Logistic regression](#Interaction-effects-in-Logistic-regression)
    - [Predictive analysis/ Scoring using Logistic regression](#Predictive-analysis-Scoring-using-Logistic-regression)
  - [Data preparation](#Data-preparation)

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

### Simple Linear Regression

#### Analyze the effect of a cont.Predictor on a cont.Response, also use the model to predict response.

The basis of linear regression should be familiar. The `PROC REG` is the SAS proc for linear regression. The proc will create an ANOVA table and compute the F-statistic and the P-value for it , with the H0 being that the response variable and the predictor do not have any association. So if the p-value is significant(< alpha), the we can reject this H0 (no association) and infer that there is a significant association between the predictor and the response variable.

The only thing that `proc reg` requires apart from the data set is the `model`. The `plots` produce the graphs that we can use to validate the test.

```SAS
PROC REG data=stat1.bodyfat2
		 plots=all;
 model PctBodyFat2=Weight;
 run;
```

### N-Way ANOVA

#### Analyze the effect of more than one cat.Predictors on a cont.Response

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

### Multiple Linear Regression

#### Analyze the effect of multiple cont.Predictors on a cont.Response

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

### Model Selection for Linear Regression Models

#### Selecting the best models from all possible ones

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

### Information Criterion

#### Measures for comparative model evaluation

Information criterion are used to comparatively assess the fit of a model between many. They all try to point to the **model that explains the most variability in the data with the least predictors**. They all have a penalty to using more variables in the model and this penalty is what is different between them. ***Smaller values for information criteria is considered better.***
- AIC
- AICC (Corrected AIC) - Used for small sample sizes
- BIC
- SBC

Adjusted _R<sup>2</sup>_ is similar to the Information Criteria in that, it penalizes the addition of terms. Since adding a term will never reduce _R<sup>2</sup>_ value since the worst that could happen is that the term added has no effect on the response variable and hence the _R<sup>2</sup>_ stays the same. The model becomes unnecessarily complex however, and this is why adjuisted _R<sup>2</sup>_ will give a better estimate and balance the complexity of the model vs the variability explained by it.

### Model Post Fitting

#### Steps to ensure the model assumptions are met before trusting the model

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

### Outliers vs. Influential Observations

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

```SAS
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

### Detecting Collinearity

#### Collinearity leads to biases in the model

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
  
## Logistic Regression

Logistic regression is used to predict the value of a binary response. Since a binary response is a categorical response with 2 levels, most of the categorical tools can be used.

Compared to Linear Regression, we cannot apply the tools and fitting techniques directly to a binary response variable, since the response values are not normally distributed (they resemble a sigmoidal distribution "S" shaped) and we cannot assume equal variances. In a linear regression the estimate we can predict is continuous and can be any value, but a binary response will always be 0/1. To solve these issues, we can predict the probability that a reponse will be 0/1 - this probabilaity is still bounded, and ranges from 0 to 1, but now its a continuous response variable. Aslo note that since we are estimating the probaility of the response, there is no observed probability - so we cannot use the *least squares method* like in linear regression. We can convert this probability to the logit scale or the log odds scale log( p/(1-p) ), and we will have the logit(p) from -infinity to +infinity. Now we can use the linear regression methods and then convert the result back to probability scale.

Basic review of tools and techniques for categorical response variables follows:

### Model the relationship between a **binary response** vs. set of predictors (cont. or cat.)

It models the probability of an outcome based on the predictor variables. In logistic regression, the dependent/response variable is always a categorical variable with two levels.

- Hypothesis tests are used to verify the realtionship between the the predictors and the response variable.
- A classifier model is built using the discovered realtionships with the predictors.
- The model is used to predict or classify new data in to one of the the two levels of the response variable.

### PROC FREQ

#### Discover associations and evaluate classifier performance

`PROC FREQ` can display frequencies of the input variables or generate cross tabulation tables to discover associations between the categorical variables.

### Classifier Performance

Classifier performance is an indication of how well our model performs with respect to known data. Any logistic model (predicting a binary target) will have some False Positives, False Negatives, True Positives and True Negatives. A model that minimizes the false positives and false negatives is a better model.

Consider the following confusion matrix (table with predicted binary reponses and actual binary responses)

|            |Predicted True| Predicted False| Total|
-------------|--------------|----------------|------|
|Actual True |100   (TP)    |8      (FN)     | 108  |
|Actual False|2     (FP)    |50     (TN)     |52    |
|Total       |102           |58              |160   |

- **True Positive (TP)** - The model predicted a positive result, and the result as infact positive
- **False Positive (FP)** - The model predicted a positive result, but the actual result as negaive. Disease model predits a patient will have a disease but he does not.
- **True Negative (TN)** - The model predicts a negative result and the result is infact negative.
- **False Negative (FN)** - The model predicts a negative result, but the actual result is positive. Disease model predicts no disease, but the person actually is diseased.
- **Accuracy**: Overall, how often is the classifier correct?
  - (TP+TN)/total = (100+50)/160 = 0.94
- **Misclassification Rate**: Overall, how often is it wrong?
  - (FP+FN)/total = (8+2)/160 = 0.06
  - equivalent to 1 minus Accuracy also known as "Error Rate"
- **Sensitivity / True Positive Rate**: When it's actually yes, how often does it predict yes?
  - TP/actual yes = 100/108 = 0.93
  - also known as "Recall"
- **False Positive Rate**: When it's actually no, how often does it predict yes?
  - FP/actual no = 2/52 = 0.04
- **Specificity / True Negative Rate**: When it's actually no, how often does it predict no?
  - TN/actual no = 50/52 = 0.96
  - equivalent to 1 minus False Positive Rate
- **Precision**: When it predicts yes, how often is it correct?
  - TP/predicted yes = 100/102 = 0.98
- **Prevalence**: How often does the yes condition actually occur in our sample?
  - actual yes/total = 102/160 = 0.63
- **ROC curve & AUC** - ROC Curve is plotted between the TPR/Sensitivity (y-axis) vs. False Positive Rate(x-axis). You set a thereshold to minimize False Positives, or maximize true poistives. If the model is very discriminating, then we would have a good TPR for a low threshold of FPR. The AUC is the are under th curve and ranges from .5 to 1, and the larger the area, the more discrininating the model. So better models have a ROC that hugs the top left corner.



### Tests of association

When the frequency analysis of the categorical varibles point to a difference in the distribution of the data, we need to make sure this distribution difference is not by chance, and there is actually an association. 

- > Chi-Squared Test, tests this association between categorical variables to make sure the differences in distribution are not by chance
- > The Cramer's V statistic can be used to measure the strength of an association.

General notes:

- The Chi-Squared statistic measures the difference between the expected and the observed frequences in a cross tabulation. Expected counts assume no association - this is our H0.
- The greater the difference, the more the likely there is an association.
- The test generates a 𝛘<sup>2</sup> statistic and it's p-value.
- The 𝛘<sup>2</sup> statistic depends on the sample size and does not indicate the magnitude of the association. You can duplicate every obs and double the 𝛘<sup>2</sup> statistic. So for very small samples, you may see the 𝛘<sup>2</sup> statistic is small and the P-value is larger, but it can be artificailly changed by duplicating the observations. In other words, the results point only to the existence of the association but not its strength.
- Cramer's V statistic measures the magnitude of the association.
- Cramer's V ranges from -1---0---+1 or 0---+1. The closer it is to 0, the weaker the association. 

|              |male     |female    | Row.total|
|--------      |---------|----------|-----|
|survived      |(E=)O=2  |(E=)O=10  |12   |
|perished      |(E=)O=10 |(E=)O=2   |12   |
|**Col.Total** |12       |12        |Total.Obs=**24**   |

The expected cell counts for *H<sub>0</sub> = There exists no associacation between survival and gender* are :
> (Row.Tot * Col.Tot)/Obs.Tot . (12*12)/24 = 6

The 𝛘<sup>2</sup> test can be performed by the `PROC FREQ` procedure.

``` SAS
PROC freq data=stat1.safety;
TABLES (Type Region Size Weight) * Unsafe / CHISQ;
run;
```

This creates cross tabulation reports with each of the predictors with the variable "Unsafe", and the `CHISQ` option for the `TABLES` statement performs the 𝛘<sup>2</sup> test and produces the 𝛘<sup>2</sup> statistic and the P-values.

### Detecting Ordinal Associations

Ordinal associations are cases where the predictor is an ordinal (category levels with a natuaral order : size=small/medium/big) and the association is ordinal in nature. The distribution of the response consistently increase/decrease across the predictor levels.

- > Ordinal associations are tested using the **Mantel-Haenszel Chi-Squared** test, which is sensitive to the  order of the predictor levels.

- > The **Spearman corellation statistic** is used to measure the magnitude of the association. In SAS, its generated by the `CL` option (confidence limits) for `PROC FREQ`.

Just like the Pearson Chi-Squared test :

- It does not measure the magnitude of the association
- It simply evalutates if there is an associaton
- It is influenced by the sample size and for small sample sizes the value will be low with an insignificant P-value.
- Spearman's correlation statistic is not affected by sample size
- It ranges from -1----0---+1 with values near to -/+1 indicating a strong -/+ correlation and values close to 0 indicating a weak correlation.

```
PROC FREQ data=stat1.safety;
TABLES (Region Size )*Unsafe / chisq expected oddsratio cl;
RUN;
```

In the sample above, the `PROC FREQ` generates the cross tabulation tables for Region and Size with Unsafe. The options are 
- `CHISQ` - chi-squared statistic
- `EXPECTED` - generate expected counts in the the cross tabulation tables
- `ODDSRATIO` - generate the odds ratio for the cross tabulation table.
- `CL` - generate confidence limits for stats, including the *Spearman Correlation*.

### PROC LOGISTIC

`PROC LOGISTIC` is the procedure in SAS to fit a logistic regression model for a binary, ordinal or nominal response variable.

```SAS
PROC LOGISTIC data= ameshousing_data plots(only)=(effect oddsratio);
   MODEL bonus_eligible(event='1') = basement_size / clodds=pl;
RUN;
```
The options are as follows :

- A `CLASS` statement can be specified to include cat.Predictors.
  - The referecen level in a cat.Predictor can be specified by the `ref` option. By default the reference level is the last level in alphanumerin order.
  - The paramterization (coding used for the levels) can be either 
    - Effect coding - default - compares the difference between each level and the average with all levels.
    - referece cell coding - `param=ref` - compares the difference between each level and the referece level (default = last level in alpha numeric order) 
- The `event` keyword specifies which reponse level probaility we are modelling. By default this is the first in the alphanumeric order, so usually the model predicts the value for 0.
- `clodds` - Confidence limit odds - can be:
  -  PL - Profile Likelibood (conpute intensive, but works well with smaller sample sizes.)
  -  Wald - Default value, and requires lesser computation, but not good for small sample sizes.

#### Oversampling

If we take a representative sample when modelling a rare event, then this may give us very few samples. Instead we can build a better (more obs) sample by, say choosing all the events in the population and a subset of the non-events. Now there is a larger proportion of the event in the sample, and the sample is biases. This is **oversampling**. The effect of oversampling needs to be adjusted after the model is built.

- Oversampling leads to the intercept being higher. This difference is the Offset.
- To correct the bias, the offset is applied to reduce the intercept
- The offset only affects the intercept and not the other parameter estimates
- The Pi-1 value of the population - the proportion of events in the population need to be known to compute the offset.

#### Result interpretation

In the output, always check the '**Probability Modelled**', make sure the model is modelling the desired outcome.
- Model Convergence - make sure that the model converges, without this the results cannot be trusted.
- Model Fit statistics
  - **AIC**     - Penalizes the number of predictors, but not sample size
  - **SC/SBC**  - Larger penalty for #predictors, and also adjusts for sample size. This metric favors the most parsimonious models.
  - **-2Log L** - -2* Log(Likelihood) - the value depends on the  number of predictors, so this cannot be used to compare models with varying number of predictors.
  - **Testing global H0** - all regression co-effs are 0.
    - Use the **likelihood ratio** rather than the wald test to verify the gloabl H0. We can say that at least one regression co-eff is != 0 if the likelihood ratio's P-value is significant.
  - Analysis of Maximum Likelihood estimates - This table tells us which regression co-effs are significant, based on the Wald Chi-Squared test and its P-value. Compared to the Type-3 Analysis of effects, this is more detailed since this breaks down the analysis by the levels in the catergorical predictors.
  - Association of predicted probabilities with observations
    - This is a goodness of fit measure that used the model to evaluate the dataset itself.
    - All possible pair-wise combinations of the obs from either of the two binary response var is created.
    - The model is used to see if the model would have predicted the outcome correctly. ie, the predicted probability of the desired outcome is higher. This is also called **concordant**.
    - When the model's predicted probability for an outcome does not match the actual outcome, its called **discordant**.
    - When the model predicts equal probability of either outcome, it is a **tie**.
    - More concordant pairs and less ties and discordant pairs in a model makes it a better model.
    - The following statistics can be calculated.
      - Somer's D, Gamma, Tau-A, C (Concordant statistic)
      - Larger values for these statistics indicate a better fitting model.
- **The Odds Ratio** table shows the odds ratio and the confidence limits of the odds ratio should not include 1 to be significant.
  - Odds ratios depend on the `UNITS` statement in the `PROC LOGISTIC`. If a `UNITS` statement is provided, then the default option should also be provided because any predictors without an explicit `UNITS` set will be exacluded from the set.
  - Odds ratios measure how much a one unit change in the predictor changes the odds of the response (p(response)/1-p(response) ).
  - The confidence limits of the the Odds Ratio has 1, then the predictor is not significant or does not change the odds of the response significantly.
  - Ex: in a `MODEL genuine_product(event='1') = price`,  If the odds ratio for a $100 increase in price is 1.07, that means that there is a 7% increase in the odds that the item is genuine for every $100 increase in price. Odds ratio does not show the change in logit or probability (though these can be calculated).
- **Analysis of maximum likelihood estimates**
  - This table shows the parameter estimates for the model
  - The Chi-squares values and the p-values are also shown
  - The insignificant predictors will have an insignificant P value
  - The most powerful predictors are found by looking at the **Standardized Estimate** column, where the rank order of the absolute value of the standardized estimate will yeild this order.

Sample :

``` SAS 
PROC LOGISTIC data=stat1.safety plots(only)=(effect oddsratio);
class region(ref='Asia') size(ref='3') / param=ref;
model Unsafe(event='1') = region size weight / clodds=pl;
run;
```

The sample above does the following :

- data is from the safety dataset.
- Plots requests the effect plot (sigmoidal) and the odds ratio plot.
- CLASS identifies the region and size as cat.Predictors.
  - The `ref=` arg sets the reference level for each cat.predictor
  - The `param=ref` option specifies that reference cell coding should be used.
- Model speficies that the response variable is *Unsafe* and that we are modelling the event where Unsafe = 1.
  - The `CLODDS=PL`  requests Profile Likelihood confidence limits (and also makes the oddsratio plot available for the plot option in the proc) 
  
### Interaction effects in Logistic regression

The core ideas are the same as that of linear regression.

- An interaction occurs when one predictor is affected by another, in other words, when the presence or absence of one predictor influences the the model parameter esitmates significantly.
- We can use **stepwise**, **forward** or **backward** selection methods.

`PROC LOGISTIC` can:

-  do automatic model selction when the `selection` option is provided.
- model interactions by using the `|` between the model predictors that need to be analyzed for interactions.
  - `MODEL response = cat1 | cat2 | cat3 @2`
  - Indicates that the interactions between each pair of cat predictors need to be analyzed and `@2` indicates that only 2-factor interactions are analyzed.

### Predictive analysis/ Scoring using Logistic regression

Using a logistic regression model to predict or score a new dataset is done similar to lineat regression.

- The model generated by `PROC LOGISTIC` is saved to an item store using the `STORE out=` statement.
- `PROC PLM` is then used with the `restore=` option to read the item store and then
  - `SCORE data= out=` statement can be used to score in modern SAS versions
  - CODE statement is used to generate the scoring code.

## Data preparation
