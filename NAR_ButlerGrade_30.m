%Neural Network Prediction for Butler Grade Sensor Bank
%trains on 2012 30 minute data, tests on 2013 30 minute data.
clear all; close all; 
data_2012 = 'BiddleButte_ButlerGrade_30_2012.mat';
[BB_x_2012, BB_y_2012, BG_x_2012, BG_y_2012] = Wind_PreProcessing(data_2012);

BG_y_2012 = mat2gray(BG_y_2012);
%calculate some statistics of the training wind speed:
m  = mean(BG_y_2012)
sigma = std(BG_y_2012)

BG_y_2012 = BG_y_2012 - repmat(m,size(BG_y_2012,1),1);

T = num2cell(BG_y_2012)';
D = num2cell(BG_x_2012)';
lag =5 ; %number of 30 min samples lag
graphend = lag+1;
%develop narnetwork with time delay of "lag" 30 minute samples
%and 30 hidden neurons
net = narnet(1:lag,30); 
N = size(D,2);
net.layers{1}.transferFcn = 'logsig'; %set 1st layer transfer function to logsig
net.divideFcn = 'divideblock'; %use the 1st 70% of data for training

[ Xs, Xsi, Asi, Ts ] = preparets( net, {}, {}, T ); %prepare the data for training
ts = cell2mat( Ts );
%% train the nn:
rng( 'default' ) %set random seed
[ net tr Ys Es Af Xf ] = train( net, Xs, Ts, Xsi, Asi ); %train the net
view(net); %show net structure

NMSEs = mse( Es ) /var( ts,1 ) %normalized mean square error 
Y = net(Xs,Xsi); %use network to predict based on input data
RMSEtrain = sqrt(perform(net,Ts,Y)) %root mean square error
ys = cell2mat( Y ); % now ys contains the predictions of the NN

figure(1);
hold on;
plot( ts, 'LineWidth', 2 )
plot( cell2mat(Y), 'red', 'LineWidth', 2 ); %plot predictions versus known values
axis tight; %set axis
legend( 'TARGET', 'OUTPUT' );
title( 'BUTLER GRADE NARNET RESULTS, 30 MINUTE DATA, 2012' );

%% predict 2013 data based on 2012 trained net:
data_2013 = 'BiddleButte_ButlerGrade_30_2013.mat';
[BB_x_2013,BB_y_2013, BG_x_2013, BG_y_2013] = Wind_PreProcessing(data_2013);
BG_y_2013 = mat2gray(BG_y_2013);
%calculate some statistics of the training wind speed:
m  = mean(BG_y_2013)
sigma = std(BG_y_2013)

BG_y_2013 = BG_y_2013 - repmat(m,size(BG_y_2013,1),1);
T_2013 = num2cell(BG_y_2013)';
%BiddleButte_Data = BiddleButte_Data(:,1);
D_2013 = num2cell(BG_x_2013)';
[ Xs_2013, Xsi_2013, Asi_2013, Ts_2013 ] = preparets( net, {}, {}, T_2013 );
ts_2013 = cell2mat(Ts_2013);
Y_2013 = net(Xs_2013,Xsi_2013); %use network to predict based on input data
RMSEtest = sqrt(perform(net,Ts_2013,Y_2013)) %root mean square error
ys = cell2mat( Y_2013 ); % now ys contains the predictions of the NN
figure(2);
hold on; 
plot(ts_2013, 'LineWidth',2);
plot( cell2mat(Y_2013), 'red', 'LineWidth', 2 ); %plot predictions versus known values
axis tight; %set axis
legend( 'TARGET', 'OUTPUT' );
title( 'BUTLER GRADE NARNET RESULTS, 30 MINUTE DATA, 2013' );
%%
figure(3);
hold on;
plot(ts_2013((end-100):end),'LineWidth',2);
plot(ys((end-100):end),'r','LineWidth',2);
axis tight;
legend('TARGET','OUTPUT');
title('BUTLER GRADE DETAIL, 30 MINUTE DATA, 2013');