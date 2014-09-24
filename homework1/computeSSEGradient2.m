function J = computeSSEGradient2(theta, M)
    % Initialize some useful values
    %m = length(y); % number of training examples

    % You need to return the following variables correctly 
    J = 0;

    data = importdata('curvefitting.txt');  
    X = data(1,:);
    Y = data(2,:);
    X = X';
    Y = Y'; 
    
    newX = [];
    for i = 0 : M 
        newX = horzcat(newX, X.^(i));
    end
    
    J = 2*( newX'*newX*theta - newX'*Y);
    
end