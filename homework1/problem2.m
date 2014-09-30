function problem2

clear all
close all
clc

%y = sin(2 pi x) + N(0,0.3),
% data = importdata('curvefitting.txt');
% 
% X = data(1,:);
% Y = data(2,:);
% 
% X = X';
% Y = Y';
% 
% figure;
% 
% plot(X, Y, 'o', 'MarkerSize', 10);
% xlabel('x');
% ylabel('y');
% 
% hold on
% 
% %plot the sin2pi function
% fplot(@(x) sin(2*pi*x), [0,1, -2, 2], 'r') 
% 
% hold on
 %plotMLEforM(X, Y, 1);
 
 %plotMLEforM(X, Y, 3);

% X = [ones(length(Y), 1), X]; % Add a column of ones to x
% theta = normalEqn(X, Y);
% 
% xrange = 0: 0.01: 1;
% xrangeWithOnes = [ones(length(xrange), 1), xrange'];
% yrange = xrangeWithOnes*theta;
% 
% plot(xrangeWithOnes, yrange, 'g');



%M = 2
% X = [ones(length(Y), 1), X, X.^2, X.^3] % Add a column of ones to x
% theta = normalEqn(X, Y)
% 
% xrange = 0: 0.01: 1;
% xrangeWithOnes = [ones(length(xrange), 1), xrange', xrange'.^2, xrange'.^3];
% yrange = xrangeWithOnes*theta
% [rows, cols] = size(yrange)
% 
% plot(xrange, yrange, 'g');

%compareSSEGradient();
part1();
%testGradientDescent();


end


function testGradientDescent ()


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

hold on
minTheta = gradientDescentML([1; 1], @computeSSE, @computeSSEGradient, 0.05, 0.000001)
plotWithTheta(minTheta);


figure();
plot(X, Y, 'o', 'MarkerSize', 10);
xlabel('x');
ylabel('y');

hold on

%plot the sin2pi function
fplot(@(x) sin(2*pi*x), [0,1, -2, 2], 'r') 

hold on
minTheta0 = gradientDescentML([1], @computeSSE2, @computeSSEGradient2, 0.05, 0.000001)
plotWithTheta(minTheta0);

%M = 2 not including the ones column
% minTheta3 = gradientDescentML([0; 0; 0], @computeSSE2, @computeSSEGradient2, 0.05, 0.0000001)
% plotWithTheta(minTheta3);

% hold on

%M = 3
%easy to get into local minimum
figure();
plot(X, Y, 'o', 'MarkerSize', 10);
xlabel('x');
ylabel('y');

hold on

%plot the sin2pi function
fplot(@(x) sin(2*pi*x), [0,1, -2, 2], 'r') 

hold on
minTheta4 = gradientDescentML(zeros(4,1), @computeSSE2, @computeSSEGradient2, 0.05, 0.0000001)
plotWithTheta(minTheta4);


% M = 9
%as the dimensions increases, the step size needs to be smaller

%the answer [0.35; 232.37; -5321.83; 48568.31; -231639.30; 640042.26; -1061800.52; 1042400.18; -557682.99; 125201.43;];
%this works 
initGuess = [0.35; 100; -5321.83; 48568.31; -231639.30; 640042.26; -1061800.52; 1042400.18; -557682.99; 125201.43;];
%initGuess = [0.35; 0; -5321.83; 48568.31; 0; 640042.26; -1061800.52; 1042400.18; -557682.99; 125201.43;];

%0.05 for step size is alwyas too big
figure();
plot(X, Y, 'o', 'MarkerSize', 10);
xlabel('x');
ylabel('y');

hold on

%plot the sin2pi function
fplot(@(x) sin(2*pi*x), [0,1, -2, 2], 'r') 

hold on
minTheta10 = gradientDescentML(initGuess, @computeSSE2, @computeSSEGradient2, 0.03, 0.0000001)
plotWithTheta(minTheta10);

end


function part1()
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

hold on
plotMLEforM(X, Y, 0);


figure();
plot(X, Y, 'o', 'MarkerSize', 10);
xlabel('x');
ylabel('y');

hold on

%plot the sin2pi function
fplot(@(x) sin(2*pi*x), [0,1, -2, 2], 'r') 

hold on
plotMLEforM(X, Y, 1);

%M = 2 not including the ones column
% minTheta3 = gradientDescentML([0; 0; 0], @computeSSE2, @computeSSEGradient2, 0.05, 0.0000001)
% plotWithTheta(minTheta3);

% hold on

%M = 3
%easy to get into local minimum
figure();
plot(X, Y, 'o', 'MarkerSize', 10);
xlabel('x');
ylabel('y');

hold on

%plot the sin2pi function
fplot(@(x) sin(2*pi*x), [0,1, -2, 2], 'r') 

hold on
plotMLEforM(X, Y, 3);


% M = 9
%as the dimensions increases, the step size needs to be smaller

%the answer [0.35; 232.37; -5321.83; 48568.31; -231639.30; 640042.26; -1061800.52; 1042400.18; -557682.99; 125201.43;];
%this works 
initGuess = [0.35; 100; -5321.83; 48568.31; -231639.30; 640042.26; -1061800.52; 1042400.18; -557682.99; 125201.43;];
%initGuess = [0.35; 0; -5321.83; 48568.31; 0; 640042.26; -1061800.52; 1042400.18; -557682.99; 125201.43;];

%0.05 for step size is alwyas too big
figure();
plot(X, Y, 'o', 'MarkerSize', 10);
xlabel('x');
ylabel('y');

hold on

%plot the sin2pi function
fplot(@(x) sin(2*pi*x), [0,1, -2, 2], 'r') 

hold on
plotMLEforM(X, Y, 9);

end

function compareSSEGradient
    x = [[10, 10, 12, -20]; [12, 2, 20, 15];];
    [rows, cols] = size(x);
    for col = 1:cols
        computeSSEGradient2(x(:, col), 1)
        computeNumericalSSEGradient(x(:, col))
    end
end

function y = computeNumericalSSEGradient(x)
    M = length(x) - 1;
    delta = 0.000001;
    xplus = [0,0];
    xminus = [0,0];
    xplus(1) = x(1) + delta;
    xminus(1) = x(1) - delta;
    xplus(2) = x(2) + delta;
    xminus(2) = x(2) - delta;
    y(1) = (computeSSE2([xplus(1); x(2)], M) - computeSSE2([xminus(1); x(2)], M))./(2*delta);   
    y(2) = (computeSSE2([x(1); xplus(2)], M) - computeSSE2([x(1); xminus(2)], M))./(2*delta); 
end


function plotMLEforM(X, Y, M)

newX = [];

for i = 0 : M 
   newX = horzcat(newX, X.^(i));
end

theta = normalEqn(newX, Y)

plotWithTheta(theta);

end






