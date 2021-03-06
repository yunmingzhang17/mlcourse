function J =  computeSSE2(theta)
    


    % You need to return the following variables correctly 
    J = 0;

%     data = importdata('curvefitting.txt');  
%     X = data(1,:);
%     Y = data(2,:);
%     X = X';
%     Y = Y'; 
    X = [0,    0.1111,    0.2222,    0.3333,    0.4444,    0.5556,    0.6667,    0.7778,    0.8889,    1.0000]';
    Y = [0.3495,    0.8308,    1.0073,    0.9715,    0.1331,    0.1668,   -0.8483,   -0.4457,   -0.5636,    0.2615]';
    
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