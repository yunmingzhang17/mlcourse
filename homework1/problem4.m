function problem4
    close all
    clc
    part1();

end

function part1()
    [XA, YA] = regressAData();
    [XB, YB] = regressBData();
    [XV, YV] = validateData();
    
    %weightA = gradientDescentML2(XA', YA', 0.1, 3)
    
    [weightA,newY, numIterations] = gradientDescentML2([0; 0; 0], @LAD, @computeNumericalGradient, 0.001, 0.00001, XA', YA', 0)

    sseVA = computeSSE3(weightA, XV', YV')
    plot(XA', YA', 'og', 'MarkerSize', 10);
    hold on;
    plotWithTheta2(weightA, -3, 2);
end

