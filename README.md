## Introduction

In "The Hidden Game of Baseball" Chaper 3, the authors suggest that certain batting statistics are more informative than others. This repository is an attempt to recreate the analysis they use to make this claim.

John Thorn and Pete Palmer propose a model that attempts to to use each batting statistic to predict how many runs a team will score over a season. The  statistic that more accurately predicts the number of runs scored in a season has more descriptive power than one that is inaccurate.

## The Model

Their model is informed as follows. If batting average is perfectly correlated with runs, than a team with a 10% higher batting average than normal can expect to score 10% more runs. Thus the following predictive model is proposed:

Expected_Runs = (Team_BA/ League_BA) * Average_Runs_Per_Inning * Innings_Played

In order to give each statistic it's best possible showing, this Expected_Runs prediction is then used to fit a linear regression against actual runs scored.

## Notes on the Data

I used data from the Lahman Database and extracted teams data frp, between 1951 and 2015.

I attempted to extract the Total Average stat (TA) from the database. Unfortunately, Grounded Into Double Play (GIDP) statistics were not available so this was omitted. Thus TA in this dataset is more or less a poor approximation of actual TA.

Similarly I attempted to extract the Linear Weights statistic as described. However The Out On Base statistic was unavailable. Likewise, Linear_Weights as included in this dataset is likely a poor approximation of the actual statistic.

## Results

STATISTIC            STD
==================   =====
Batting Average      50.58
On Base Percentage   48.31
Slugging             36.92
Isolated Power       51.69
Total Average        48.95

The predictive accuracy of Batting Average, Slugging and On Base Percentage held the same predictive ordering as in Thorn and Palmer's model. However, Isolated Power was less accurate than expected as was Total Average. However, the discrepency in Total Average as mentioned above is likely to do with the omition of GIDP from its calculation. 