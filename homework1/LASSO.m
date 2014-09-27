function J = LASSO(X, Y, weight, lambda)

    newX = [];
    
    M = length(weight) - 1;
    
    for i = 0 : M
        newX = horzcat(newX, X.^(i));
    end
    
    predictions = newX*weight;
    sqrErrors = (predictions - Y).^2;
    %J = 1/(2*m)*sum(sqrErrors);
    J = sum(sqrErrors) + lambda*sum(abs(weight));

end