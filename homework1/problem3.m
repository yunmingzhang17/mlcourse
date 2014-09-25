 function problem3

 
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

hold on

weight = computeRidgeWeight(X, Y, 0, 3);
plotWithTheta(weight);




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

function ridge = computeRidge(X, Y, theta, lambda)
    
    M = length(theta) - 1;
    Z = [];
    for i = 0 : M
        Z = horzcat(newX, X.^(i));
    end

    ridge = (normalY - Z*theta) + lambda*theta'*theta;    

end

function gradient = computeRidgeGradient(X, Y, theta, lambda)
    
    M = length(theta) - 1;
    Z = [];
    for i = 0 : M
        Z = horzcat(newX, X.^(i));
    end
    gradient = Z'*(Z*theta - Y) + lambda*theta;
    
end