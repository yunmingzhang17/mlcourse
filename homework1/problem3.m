 function problem3
%clear all;
close all;

 
 %part2();
 part3();
    
 %evaluateMandLambdaOnBishop();
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
 
 
function evaluateMandLambdaOnBishop()

    data = importdata('curvefitting.txt');
    X = data(1,:);
    Y = data(2,:);

    
    %lambdarange = [0, 0.01, 0.05, 0.1, 0.5, 1];
    lambdarange = [0, 0.01, 0.05, 0.5];
    color = ['g', 'b', 'y', 'c']
    Mrange = [1, 3, 9];
    for M = Mrange
        M

        i = 0;
        figure();
        plot(X, Y, 'o', 'MarkerSize', 10);
        xlabel('x');
        ylabel('y');
        hold on
        title(strcat('Bishop Figure 1.4 M = ', num2str(M)));
        p = zeros(length(lambdarange), 1);
            
        fplot(@(x) sin(2*pi*x), [0,1, -2, 2], 'r') 
        for lambda = lambdarange
            i = i+ 1;
            lambda
            weightA = computeRidgeWeight(X', Y', lambda, M)
            p(i) = plotWithThetaAndColor(weightA, color(i));
            
        end
        legend('x', 'sin2pi', strcat('lambda: ', num2str(lambdarange(1))), strcat('lambda: ', num2str(lambdarange(2))), strcat('lambda: ', num2str(lambdarange(3))), strcat('lambda: ', num2str(lambdarange(4))));
    end
        
        
end
 
 function part2
 

 
    [XA, YA] = regressAData();
    [XB, YB] = regressBData();
    [XV, YV] = validateData();
    
    figure();
    plot(XA, YA, 'og', 'MarkerSize', 10);
    hold on;
    plot(XB, YB, 'xb', 'MarkerSize', 10);  %blue has an outlier
    hold on;
    plot(XV, YV, '+r', 'MarkerSize', 10);
    title('Training Set A, B and Validation Set');
    legend('Training Set A', 'Training Set B', 'Validation Set', 'Location', 'southeast');
    xlabel('x');
    ylabel('y');
%     
%     weightA = computeRidgeWeight(XA', YA', 0, 2);
%     sse1 = computeSSE3(weightA, XA', YA')
%     
%     weightA = computeRidgeWeight(XA', YA', 0.1, 3);, 
%     sse2 = computeSSE3(weightA, XA', YA')

    figure();
    weightA = computeRidgeWeight(XA', YA', 0.001, 6)
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
    
    weightB = computeRidgeWeight(XB', YB', 0.01, 6);
    sseB = computeSSE3(weightB, XB', YB')
    
    
    sseVB = computeSSE3(weightB, XV', YV')
    plot(XV', YV', 'og', 'MarkerSize', 10);
    hold on;
    plotWithTheta2(weightB, -3, 2);
    
    
 end
 
 function part3
 
 
    fls = dir('dataset/blogData_test*.csv');
    x_train = importdata('dataset/x_train.csv');
    y_train = importdata('dataset/y_train.csv');

    %test the best lambda on validation
    lambda = 5000;
    weight = computeRidgeWeightNoDim(x_train, y_train, lambda);
    
    x_val = importdata('dataset/x_val.csv');
    y_val = importdata('dataset/y_val.csv'); 
    [rows, cols] = size(x_val);
    XvalEstimate = [ones(rows, 1), x_val];
    yvalEstimate = XvalEstimate*weight;
    valErr = sumsqr(y_val - yvalEstimate)
    
    x_test = importdata('dataset/x_test.csv');
    y_test = importdata('dataset/y_test.csv');
    [rows, cols] = size(x_test);
    XtestEstimate = [ones(rows, 1), x_test];
    ytestEstimate = XtestEstimate*weight;
    testErr = sumsqr(y_val - ytestEstimate)

    %fit a model on the test set, to verify that the error is there
    %doesn't work, there seem to be some precision error. 
%     weightTestOverfit = computeRidgeWeightNoDim(x_test, y_test, 0);
%     yTestOverfit = XtestEstimate*weightTestOverfit;
%     OverfitError = sumsqr(yTestOverfit - y_test)
    
    %plot the difference for different lambda
    current = 0.0001;
    numberOfLambda = 40;
    lambdarange = zeros(numberOfLambda,1)';
    blogErr = zeros(length(lambdarange), 1);

    for i = 1:numberOfLambda
        lambdarange(i) = current;
        current = current * 2;
    end
    i = 1;
    for lambda = lambdarange
        weight = computeRidgeWeightNoDim(x_train, y_train, lambda);
        yvalEstimate = XvalEstimate*weight;
        valErr = sumsqr(y_val - yvalEstimate);
        blogErr(i) = valErr;
        i = i + 1;
    end
    figure();
    plot(log(lambdarange'), blogErr, 'og', 'MarkerSize', 10);
    title('Blog data validation error ');
    xlabel('lambda (logscale)');
    ylabel('Validation Set Error');
     
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