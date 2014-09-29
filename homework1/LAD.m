function J = LAD(X, Y, weight, lambda)
    
    newX = [];
    
    M = length(weight) - 1;
    
    for i = 0 : M
        newX = horzcat(newX, X.^(i));
    end
    
    predictions = newX*weight;
    absErrors = abs(predictions - Y);
    %J = 1/(2*m)*sum(sqrErrors);
    %do this to make sure that w0 is not being penalized
    weightWithOutFirstRow = weight(2:end ,:);
    J = sum(absErrors) + lambda*weightWithOutFirstRow'*weightWithOutFirstRow;

end