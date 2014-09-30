function [newX,newY, numIterations] = gradientDescentML2(initialGuess, objectiveFunction, computeGradient, stepSize, threshold, X, Y, lambda)

%Gradient Descent

firstIter = 1;
currentX = initialGuess;
numIterations = 0;

while true
    
    numIterations = numIterations + 1;
    
    if (firstIter == 1)
        oldY = objectiveFunction(X, Y, currentX, lambda);  
        firstIter = 0;
    else
        gradient = computeGradient(objectiveFunction, X, Y, currentX, lambda);
        newX = currentX - gradient*stepSize;
        newY = objectiveFunction(X, Y, newX, lambda);
        difference = abs(oldY - newY)
        if difference < threshold
            break
        end
        
        oldY = newY;
        currentX = newX;
    end
end

end



