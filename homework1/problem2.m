function problem2

clear all
clc

%y = sin(2 pi x) + N(0,0.3),
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
testGradientDescent();


end


function testGradientDescent ()

%minTheta = gradientDescentML([1; 1], @computeSSE, @computeSSEGradient, 0.05, 0.000001)
%minTheta2 = gradientDescentML2([1; 1], @computeSSE2, @computeSSEGradient2, 0.05, 0.000001, 1)


%M = 2 not including the ones column
% minTheta3 = gradientDescentML([0; 0; 0], @computeSSE2, @computeSSEGradient2, 0.05, 0.0000001)
% plotWithTheta(minTheta3);

% hold on

%M = 3
%easy to get into local minimum
% minTheta4 = gradientDescentML([0; 0; 0; 0], @computeSSE2, @computeSSEGradient2, 0.05, 0.0000001)
% plotWithTheta(minTheta4);

hold on
% M = 9
%as the dimensions increases, the step size needs to be smaller
minTheta10 = gradientDescentML(zeros(10, 1), @computeSSE2, @computeSSEGradient2, 0.04, 0.0000001)
plotWithTheta(minTheta10);

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


function plotWithTheta(theta)
    
    M = length(theta);
    newXRangeWithOnes = [];
    xrange = 0: 0.01: 1;
    for i = 0 : M-1 
        newXRangeWithOnes = horzcat(newXRangeWithOnes, xrange'.^(i));
    end
    yrange = newXRangeWithOnes*theta;
    plot(xrange, yrange, 'g');

end



