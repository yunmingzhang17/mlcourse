 function weight = computeRidgeWeightNoDim(X, Y, lambda)    
    Z = [];
    for i = 1 : M
        Z = horzcat(Z, X.^(i));
    end
    
    Xnormalized = zeros(1, M);
    
    
    for i = 1: M
        muXj = mean(Z(:, i));
        Z(:,i) = Z(:, i) - muXj;
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