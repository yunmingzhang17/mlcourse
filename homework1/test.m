function test

clear all
clc

%Problem 1.1, 1.2
%[x,y] = gradientDescentML(10,@objectiveFunction,@computeGradient,0.1,0.0001)

%[x,y] = gradientDescentML([10,10],@qualdraticBowl,@qualdraticGradient,0.1,0.0001)

%[x,y] = gradientDescentML([10,10],@gaussian,@gaussianGradient,0.1,0.0001)

%[x,y] = gradientDescentML(10,@nonConvex,@nonConvexGradient,0.001,0.000001)

%[x,y] = gradientDescentML([10,10],@qualdraticBowl,@qualdraticGradientNumerical,0.1,0.0001)

%[x,y] = gradientDescentML(10,@nonConvex,@nonConvexGradientNumerical,0.001,0.000001)

%Problem 3
%compareQualdraticGradient();

%Problem 4
compareQualdraticMin();

end

function compareQualdraticMin
    %[x,y,iterations] = gradientDescentML([10,10],@qualdraticBowl,@qualdraticGradientNumerical,0.1,0.0001)
    
    
    %will terminate because gradient becomes 0 after 22 iterations (really
    %large x and y
    %[x,y,iterations] = gradientDescentML([10,10],@qualdraticBowl,@qualdraticGradientNumerical,0.5,0.0001)
    
    %[x,y,iterations] = gradientDescentML([10,10],@qualdraticBowl,@qualdraticGradient,0.1,0.0001)

    %will ocillate betwen different values and never stop
    [x,y,iterations] = gradientDescentML([10,10],@qualdraticBowl,@qualdraticGradient,0.5,0.0001)    
    
    
    %[x,y,iterations] = gradientDescentML([10,10],@qualdraticBowl,@qualdraticGradient,0.1,0.0001)
    %[x,y,exitflag,output,lambda] = fmincon(@qualdraticBowl,[10,10],[-1 -1;1 1],[1000,1000])
end


function compareQualdraticGradient
    x = [[10, 10]; [12 ,2]];
    [rows, cols] = size(x);
    for row = 1:rows
        qualdraticGradient(x(row, :))
        qualdraticGradientNumerical(x(row, :))
    end
end

function y = qualdraticBowl(x)
    y = 3 * x(1)^2 + 4 * x(2)^2;
end

function y = qualdraticGradient(x)
    y(1) = 6*x(1);
    y(2) = 8*x(2);
end

function y = qualdraticGradientNumerical(x)
    delta = 0.000001;
    xplus = [0,0];
    xminus = [0,0];
    xplus(1) = x(1) + delta;
    xminus(1) = x(1) - delta;
    xplus(2) = x(2) + delta;
    xminus(2) = x(2) - delta;
    y(1) = (qualdraticBowl([xplus(1), x(2)]) - qualdraticBowl([xminus(1),x(2)]))./(2*delta);   
    y(2) = (qualdraticBowl([x(1),xplus(2)]) - qualdraticBowl([x(1),xminus(2)]))./(2*delta); 
end

function y = nonConvex(x)
    y = (x-3)*(x+5);
end

function y = nonConvexGradient(x)
   y =(x - 3) + (x+5);
end

function y = nonConvexGradientNumerical(x)
    delta = 0.000001;
    xplus = x + delta;
    xminus = x - delta;
    y = (nonConvex(xplus) - nonConvex(xminus))./(2*delta);   
end

% function y = gaussian(x)
%     Mu = [1,2];
%     Sigma = [2 1; 1 2];
%     y = - exp(-1/2*(x-Mu)'\Sigma * (x-Mu));
% end
% 
% function y = gaussianGradient(x)
%     y(1) = 
% end