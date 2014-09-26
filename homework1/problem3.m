 function problem3
clear all;
close all;
clc;
 
part3();
    
 
 end

 
 function part1 ()
  %reading the input data
data = importdata('curvefitting.txt');  
X = data(1,:);
Y = data(2,:);
X = X';
Y = Y';

figure;

plot(X, Y, 'o', 'MarkerSize', 10);
xlabel('x');
ylabel('y');

hold on

%plot the sin2pi function
fplot(@(x) sin(2*pi*x), [0,1, -2, 2], 'r') 

% hold on
% 
% weight = computeRidgeWeight(X, Y, 0, 3);
% plotWithTheta(weight);

% hold on
% 
% weight = computeRidgeWeight(X, Y, 0.001, 9);
% plotWithTheta(weight);




%Part2

part3();

 end
 
 function part2
    [XA, YA] = regressAData();
    [XB, YB] = regressBData();
    [XV, YV] = validateData();
    
    
%     plot(XA, YA, 'og', 'MarkerSize', 10);
%     hold on;
%     plot(XB, YB, 'xb', 'MarkerSize', 10);  %blue has an outlier
%     hold on;
%     plot(XV, YV, '+r', 'MarkerSize', 10);
    
%     
%     weightA = computeRidgeWeight(XA', YA', 0, 2);
%     sse1 = computeSSE3(weightA, XA', YA')
%     
%     weightA = computeRidgeWeight(XA', YA', 0.1, 3);
%     sse2 = computeSSE3(weightA, XA', YA')

    
    weightA = computeRidgeWeight(XA', YA', 0.1, 3)
    %weightA2 = ridgeRegression(XA', YA', 0.1)
    sseA = computeSSE3(weightA, XA', YA')
    
    
%     XA = [ones(1,length(XA))', XA'];
%     estA = XA*weightA;
%     errA = YA' - estA;
%     sse = sumsqr(errA)



%     plot(XA', YA', 'og', 'MarkerSize', 10);
%     hold on;
%     
% 
%     plotWithTheta2(weightA, -3, 2);

    sseVA = computeSSE3(weightA, XV', YV')
    plot(XV', YV', 'og', 'MarkerSize', 10);
    hold on;
    plotWithTheta2(weightA, -3, 2);

    
%     weightB = computeRidgeWeight(XB', YB', 1, 4);
%     sseB1 = computeSSE3(weightB, XB', YB')
%     
%     weightB = computeRidgeWeight(XB', YB', 0, 4);
%     sseB1 = computeSSE3(weightB, XB', YB')
%     
%     
%     plot(XB', YB', 'og', 'MarkerSize', 10);
%     hold on;
%     plotWithTheta2(weightB, -3, 2);
    figure();
    
    weightB = computeRidgeWeight(XB', YB', 1, 4);
    sseB = computeSSE3(weightB, XB', YB')
    
    
    sseVB = computeSSE3(weightB, XV', YV')
    plot(XV', YV', 'og', 'MarkerSize', 10);
    hold on;
    plotWithTheta2(weightB, -3, 2);
    
 end
 
 function part3
    fls = dir('BlogFeedback/blogData_test*.csv');
    data = importdata('BlogFeedback/blogData_train.csv');
    [row, col] = size(data);
    X = data(:,1:(col-1));
    Y = data(:,col);
    
    lambda = 100000;
    weight = computeRidgeWeightNoDim(X, Y, lambda);
    
    weight2 = ridgeRegression(X,Y,1);
    
    diff = sum(weight - weight2);
    ERR = zeros(60,1);
    
    for fi=1:60
        A{fi} = importdata(strcat('BlogFeedback/', fls(fi).name));
        testData = A{fi};
        [rowT, colT] = size(testData);
        Xtest = testData(:,1:(colT-1));
        Ytest = testData(:,colT);
        XtestEstimate = [ones(rowT, 1), Xtest];
        YtestEstimate = XtestEstimate*weight;
        
        %normalized by the numerber of data sets
        err = sumsqr(YtestEstimate - Ytest)/rowT;
        ERR(fi) = err;
    end
%     fls = dir('BlogFeedback/blogData_test*.csv');
%     for fi=1:numel(fls)
%         A{fi} = importdata(strcat('BlogFeedback/', fls(fi).name));
%     end
    varErr = var(ERR)
    meanErr = mean(ERR)
    
    
    
 end

 function weight = computeRidgeWeight(X, Y, lambda, M)    
    Z = [];
    for i = 1 : M
        Z = horzcat(Z, X.^(i));
    end
    
    Xnormalized = zeros(1, M);
    
    
    for i = 1: M
        muXj = mean(Z(:, i));
        Z(:,i) = Z(:, i) - muXj;
        Xnormalized(:,i) = muXj;
    end
    
    muY = mean(Y);
    Ynormalized = Y - muY;

    zproduct = Z'*Z;
    [rows, cols] = size(zproduct);
    Wridge = (zproduct + lambda*eye(rows))\Z'*Ynormalized;
    
    
    W0 = muY - Xnormalized*Wridge;
    weight = [W0; Wridge];
    
 end

 

% function ridge = computeRidge(X, Y, theta, lambda)
%     
%     M = length(theta) - 1;
%     Z = [];
%     for i = 0 : M
%         Z = horzcat(newX, X.^(i));
%     end
% 
%     ridge = (normalY - Z*theta) + lambda*theta'*theta;    
% 
% end
% 
% function gradient = computeRidgeGradient(X, Y, theta, lambda)
%     
%     M = length(theta) - 1;
%     Z = [];
%     for i = 0 : M
%         Z = horzcat(newX, X.^(i));
%     end
%     gradient = Z'*(Z*theta - Y) + lambda*theta;
%     
% end