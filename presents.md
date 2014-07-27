
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
[1] 1.387
```

```
[1] 0.986
```
For Cooling Load:

```
[1] 3.516
```

```
[1] 0.961
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
