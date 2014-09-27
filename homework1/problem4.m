function problem4
    close all
    %clc
    
    %part1();
    part2();

end

function part1()
    [XA, YA] = regressAData();
    [XB, YB] = regressBData();
    [XV, YV] = validateData();
    
    %weightA = gradientDescentML2(XA', YA', 0.1, 3)
    lambda = 1;
    [weightA,newY, numIterations] = gradientDescentML2([0; 0; 0; 0], @LAD, @computeNumericalGradient, 0.001, 0.00001, XA', YA', lambda)

    sseVA = computeSSE3(weightA, XV', YV')
    figure();
    plot(XA', YA', 'og', 'MarkerSize', 10);
    hold on;
    plotWithTheta2(weightA, -3, 2);
    
    
    
    
end


function part2()
    [XA, YA] = regressAData();
    [XB, YB] = regressBData();
    [XV, YV] = validateData();
    
    [weightA,errA, numIterations] = gradientDescentML2([0; 0; 0; 0], @LASSO, @computeNumericalGradient, 0.0001, 0.00001, XA', YA', 0)
    figure();
    sseVA = computeSSE3(weightA, XV', YV')
    plot(XA', YA', 'og', 'MarkerSize', 10);
    hold on;
    plot(XV', YV', 'or', 'MarkerSize', 10);
    plotWithTheta2(weightA, -3, 2);
    
    
    figure();
    [weightB,errB, numIterations] = gradientDescentML2([0; 0; 0; 0], @LASSO, @computeNumericalGradient, 0.0001, 0.00001, XB', YB', 0)
    sseB = computeSSE3(weightB, XB', YB')
        
    
    sseVB = computeSSE3(weightB, XV', YV')
    plot(XV', YV', 'og', 'MarkerSize', 10);
    hold on;
    plotWithTheta2(weightB, -3, 2);
    

end