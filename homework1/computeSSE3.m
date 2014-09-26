function J =  computeSSE3(theta, X, Y)
    
    
    newX = [];
    
    M = length(theta) - 1;
    
    for i = 0 : M
        newX = horzcat(newX, X.^(i));
    end
   
    
    predictions = newX*theta;
    sqrErrors = (predictions - Y).^2;
    %J = 1/(2*m)*sum(sqrErrors);
    J = sum(sqrErrors);
    
end