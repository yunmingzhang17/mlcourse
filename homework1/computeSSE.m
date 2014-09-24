function J =  computeSSE(theta)
    


    % You need to return the following variables correctly 
    J = 0;

    data = importdata('curvefitting.txt');  
    X = data(1,:);
    Y = data(2,:);
    
    % Initialize some useful values
    m = length(Y); % number of training examples
    
    X = X';
    X = horzcat(ones(m,1), X);
    Y = Y';
    
    predictions = X*theta;
    sqrErrors = (predictions - Y).^2;
    %J = 1/(2*m)*sum(sqrErrors);
    J = sum(sqrErrors);
    
end