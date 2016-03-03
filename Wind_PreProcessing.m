%% NN for Wind data
%This code preprocesses the data from two aenemometer sensors by removing 
%rows with NaNs
function [Biddle_x,Biddle_y, Butler_x, Butler_y] = Wind_PreProcessing(str)
load(str);
temp = [];
k=1;
%%
for i = 1:size(BiddleButte,1)
    nan = isnan(BiddleButte(i,:));
    if max(nan) == 0
        temp(k,:) = BiddleButte(i,:);
        k=k+1;
    end
end

BiddleButte = temp;
BiddleButte_Data = BiddleButte(:,7:10);
Biddle_y = BiddleButte_Data(:,1);
Biddle_x = BiddleButte_Data(:,2:4);

temp = [];
k=1;

for i = 1:size(ButlerGrade,1)
    nan = isnan(ButlerGrade(i,:));
    if max(nan) == 0
        temp(k,:) = ButlerGrade(i,:);
        k=k+1;
    end
end

ButlerGrade = temp;
ButlerGrade_Data = ButlerGrade(:,7:10);
Butler_y = ButlerGrade_Data(:,1);
Butler_x = ButlerGrade_Data(:,2:4);
end