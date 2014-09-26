function J = LAD(X, Y, weight, lambda)
    
    newX = [];
    
    M = length(weight) - 1;
    
    for i = 0 : M
        newX = horzcat(newX, X.^(i));
    end
   
    newX
    weight
    
    predictions = newX*weight;
    absErrors = abs(predictions - Y);
    %J = 1/(2*m)*sum(sqrErrors);
    J = sum(absErrors) + lambda*weight'*weight;

end