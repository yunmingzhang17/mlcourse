function J =  computeSSE2(theta, M)
    


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
   
    
    predictions = newX*theta;
    sqrErrors = (predictions - Y).^2;
    %J = 1/(2*m)*sum(sqrErrors);
    J = sum(sqrErrors);
    
end