function problem4
    close all
    clear all
    clc
    part1();

end

function part1()
    [XA, YA] = regressAData();
    [XB, YB] = regressBData();
    [XV, YV] = validateData();
    
    %weightA = gradientDescentML2(XA', YA', 0.1, 3)
    
    [newX,newY, numIterations] = gradientDescentML2([0; 0; 0], @LAD, @computeNumericalGradient, 0.01, 0.0001, XA', YA', 0)

    
end

