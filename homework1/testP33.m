clear all
close all
clc

data = importdata('BlogFeedback/blogData_train.csv');
[row, col] = size(data);
X = data(:,1:(col-1));
Y = data(:,col);

lambda = 10;

weight = ridgeRegression(X,Y,lambda)

fls = dir('BlogFeedback/blogData_test*.csv');
A = cell(60:1);
ERR = zeros(60:1);
for fi=1:60
    A{fi} = importdata(strcat('BlogFeedback/', fls(fi).name));
    testData = A{fi};
    [rowT, colT] = size(testData);
    Xtest = testData(:,1:(colT-1));
    Ytest = testData(:,colT);
    XtestEstimate = horzcat(ones(rowT,1),Xtest);
    YtestEstimate = XtestEstimate*weight;
    err = YtestEstimate - Ytest;
    sse = sumsqr(err);
    ase = sse/rowT;
    ERR(fi) = ase;
    %ase = sse/colT;
    %ERR(fi) = sqrt(ase);
end

meanErr = mean(ERR)