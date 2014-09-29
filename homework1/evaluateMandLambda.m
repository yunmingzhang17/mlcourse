function evaluateMandLambda(computeWeightFunction, lossFunction )
    [XA, YA] = regressAData();
    [XB, YB] = regressBData();
    [XV, YV] = validateData();
    
    current = 0.0001;
    numberOfLambda = 40;
    lambdarange = zeros(numberOfLambda,1)';
    for i = 1:numberOfLambda
        lambdarange(i) = current;
        current = current * 2;
    end
    
    
    Mrange = [ 1, 2, 3, 4, 6];
    for M = Mrange
        errA = zeros(length(lambdarange), 1);
        errB = zeros(length(lambdarange), 1);
        i = 0;
        for lambda = lambdarange
            i = i+ 1;
            
            weightA = computeWeightFunction(XA', YA', lambda, M);
            weightB = computeWeightFunction(XB', YB', lambda, M);
            errA(i) = lossFunction(weightA, XV', YV');
            errB(i) = lossFunction(weightB, XV', YV');

        end
        figure();
        plot(log(lambdarange'), errA, 'og', 'MarkerSize', 10);
        title(strcat('Using trainng set A and M = ', num2str(M)));
        xlabel('lambda (logscale)');
        ylabel('Error');
        
        figure();
        plot(log(lambdarange'), errB, 'ob', 'MarkerSize', 10);
        title(strcat('Using trainng set B and M = ', num2str(M)));
        xlabel('lambda (logscale)');
        ylabel('Error');    
        
        
    end
    
    
end