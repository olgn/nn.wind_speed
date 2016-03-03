Final Project: Renewable Energy and Distributed Generation

Neural Networks for Wind Speed Prediction Along the Oregon-Washington Border

Teal Hobson-Lowther
CWID: 10658036
12/10/2015

****Code requires Matlab and Matlab's Neural Network Toolkit****

The folder NN_WindSpeed contains all files necessary to run the simulations. Results of the simulations are discussed in the paper "Neural_Networks_for_Wind Speed_Prediction.pdf". 

To run the simulations, change the working directory in Matlab to the folder NN_WindSpeed. This folder contains 6 ".m" simulation files, 4 ".mat" data files, the "Wind_PreProcessing.m" function file, and this readme. Running any of the simulation files will generate  nonlinear autoregressive neural networks and show labeled graphs of their results.

The Biddle Butte analysis can be found in:

NAR_BiddleButte_30.m - Runs the 30 minute Biddle Butte neural network. Relies on "BiddleButte_ButlerGrade_30_2012.mat" and "BiddleButte_ButlerGrade_30_2013.mat"

NAR_BiddleButte_60.m - Runs the 60 minute Biddle Butte neural network. Relies on "BiddleButte_ButlerGrade_60_2012.mat" and "BiddleButte_ButlerGrade_60_2013.mat"

NAR_BiddleButte_Daily.m - Runs the daily Biddle Butte neural network. Relies on "BiddleButte_ButlerGrade_60_2012.mat" and "BiddleButte_ButlerGrade_60_2013.mat"

The Butler Grade analyses are as follows:

NAR_ButlerGrade_30- Runs the 30 minute Butler Grade neural network. Relies on "BiddleButte_ButlerGrade_30_2012.mat" and "BiddleButte_ButlerGrade_30_2013.mat"

NAR_ButlerGrade_60.m - Runs the 60 minute Butler Grade neural network. Relies on "BiddleButte_ButlerGrade_60_2012.mat" and "BiddleButte_ButlerGrade_60_2013.mat"

NAR_ButlerGrade_Daily.m - Runs the daily Butler Grade neural network. Relies on "BiddleButte_ButlerGrade_60_2012.mat" and "BiddleButte_ButlerGrade_60_2013.mat"

Explicit description of the processes involved in these networks can be found within the scripts. 

Enjoy!
Teal Hobson-Lowther





