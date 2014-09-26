 function weight = ridgeRegression(X,Y,lambda)
    
    Ya = mean(Y);
    Yc = Y - Ya;
    
    [N,M] = size(X);
    Z = ones(N,M);
    Xa = ones(1,M);
    for i = 1:M
        Xa(i) = mean(X(:,i));
        Z(:,i) = X(:,i) - Xa(i);
    end

    w1 = (Z'*Z + lambda.*eye(M))\Z'*Yc;
    w0 = Ya - w1'*Xa';
    
    weight = [w0;w1];
    
end
 