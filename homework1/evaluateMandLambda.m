function evaluateMandLambda(computeWeightFunction )
    [XA, YA] = regressAData();
    [XB, YB] = regressBData();
    [XV, YV] = validateData();
    
    current = 0.0001;
    numberOfLambda = 30;
    lambdarange = zeros(numberOfLambda,1)';
    for i = 1:numberOfLambda
        lambdarange(i) = current;
        current = current * 2;
    end
    
    
    M = 6;
    errA = zeros(length(lambdarange), 1);
    errB = zeros(length(lambdarange), 1);
    i = 0;
    for lambda = lambdarange
        i = i+ 1;
        lambda
        weightA = computeWeightFunction(XA', YA', lambda, M);
        weightB = computeWeightFunction(XB', YB', lambda, M);
        sseVA = computeSSE3(weightA, XV', YV');
        sseVB = computeSSE3(weightB, XV', YV');
        errA(i) = sseVA;
        errB(i) = sseVB;
    end
        
    
    figure();
    plot(log(lambdarange'), errA, 'og', 'MarkerSize', 10);
    
    figure();
    plot(log(lambdarange'), errB, 'ob', 'MarkerSize', 10);
 
end