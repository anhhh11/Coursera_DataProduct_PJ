
Energy efficiency prediction
========================================================
author: anhhh11
date: 7/2014

Basic usage
========================================================
Following these step to predicting your house heating and cooling load
- Input all your parameters in by using slides (for example: Relative Compactness, etc.)
- You should see result on the right of screen in grey box
- Press PLOT button to see your energy efficiency comparation to overall other houses

More advanced usage
========================================================
- Summary tab show quantile of heating and loading load, you can use this results to compare your houses parameters if having some statistics knowledge.
- Training data also available in "Training data" tab, you can click and see it.

Underlying
========================================================
I use Random Forest with training data set ( you can find more info in "Data source" tab). Their performance are shown below
For Heating Load:

```
  mtry   RMSE Rsquared  RMSESD RsquaredSD
1    2 1.2147   0.9860 0.11511   0.002866
2    5 0.6230   0.9962 0.08563   0.001186
3    8 0.6333   0.9961 0.07743   0.001085
```
For Cooling Load:

```
  mtry  RMSE Rsquared RMSESD RsquaredSD
1    2 1.924   0.9595 0.1521   0.005848
2    5 1.845   0.9624 0.1669   0.005926
3    8 1.894   0.9603 0.2057   0.007569
```
Run on your own server
========================================================
- Please send me email if you need source code of project, before that make sure that you have installed following R version with all libraries which used in source code

```r
R.version$version.string
```

```
[1] "R version 3.0.3 (2014-03-06)"
```
