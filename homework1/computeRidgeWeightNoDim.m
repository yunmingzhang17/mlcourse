 function weight = computeRidgeWeightNoDim(X, Y, lambda)    
    
    
    [N,M] = size(X);
    Z = zeros(N,M);
    Xnormalized = zeros(1, M);
    
    
    for i = 1: M
        muXj = mean(X(:, i));
        Z(:,i) = X(:, i) - muXj;
        Xnormalized(:,i) = muXj;
    end
    
    muY = mean(Y);
    Ynormalized = Y - muY;

    zproduct = Z'*Z;
    [rows, cols] = size(zproduct);
    Wridge = (zproduct + lambda*eye(rows))\Z'*Ynormalized;
    
    
    W0 = muY - Xnormalized*Wridge;
    weight = [W0; Wridge];
    
 end