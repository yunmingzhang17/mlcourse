function J = computeSSEGradient(theta)
    % Initialize some useful values
    %m = length(y); % number of training examples

    % You need to return the following variables correctly 
    J = 0;

    data = importdata('curvefitting.txt');  
    X = data(1,:);
    Y = data(2,:);
    X = X';
    X = horzcat(ones(length(Y),1), X);
    Y = Y';
    
    J = X'*X*theta - X'*Y;
    
    
end