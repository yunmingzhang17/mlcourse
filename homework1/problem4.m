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
    
%     %weightA = gradientDescentML2(XA', YA', 0.1, 3)
%     lambda = 1;
%     [weightA,newY, numIterations] = gradientDescentML2([0; 0; 0;], @LAD, @computeNumericalGradient, 0.00001, 0.0000001, XA', YA', lambda)
% 
%     sseVA = computeABSE(weightA, XV', YV')
%     figure();
%     plot(XA', YA', 'og', 'MarkerSize', 10);
%     hold on;
%     plotWithTheta2(weightA, -3, 2);
%     
%     figure();
%     [weightB,errB, numIterations] = gradientDescentML2([0; 0;0;], @LAD, @computeNumericalGradient, 0.0001, 0.00001, XB', YB', 0)
%     sseB = computeABSE(weightB, XB', YB')
%         
%     
%     sseVB = computeABSE(weightB, XV', YV')
%     plot(XV', YV', 'og', 'MarkerSize', 10);
%     hold on;
%     plot(XB', YB', 'or', 'MarkerSize', 10);
%     hold on;
%     plotWithTheta2(weightB, -3, 2);  
    
    evaluateMandLambdaGradientDescent(@LAD, @computeABSE);
    
end


function part2()
    [XA, YA] = regressAData();
    [XB, YB] = regressBData();
    [XV, YV] = validateData();
    
%     [weightA,errA, numIterations] = gradientDescentML2([0; 0; 0; 0], @LASSO, @computeNumericalGradient, 0.0001, 0.00001, XA', YA', 0.01)
%     figure();
%     sseVA = computeSSE3(weightA, XV', YV')
%     plot(XA', YA', 'og', 'MarkerSize', 10);
%     hold on;
%     plot(XV', YV', 'or', 'MarkerSize', 10);
%     plotWithTheta2(weightA, -3, 2);
%     
%     
%     figure();
%     [weightB,errB, numIterations] = gradientDescentML2([0; 0; 0; 0], @LASSO, @computeNumericalGradient, 0.0001, 0.00001, XB', YB', 0.01);
%     sseB = computeSSE3(weightB, XB', YB')
%     sseVB = computeSSE3(weightB, XV', YV')
%     plot(XB', YB', 'or', 'MarkerSize', 10);
%     hold on;
%     plot(XV', YV', 'og', 'MarkerSize', 10);
%     hold on;
%     plotWithTheta2(weightB, -3, 2);
    
    evaluateMandLambdaGradientDescent(@LASSO, @computeSSE3);

    

end