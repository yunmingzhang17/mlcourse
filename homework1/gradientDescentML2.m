function [newX,newY, numIterations] = gradientDescentML2(initialGuess, objectiveFunction, computeGradient, stepSize, threshold, M)

%Gradient Descent

firstIter = 1;
currentX = initialGuess;
numIterations = 0;

while true
    
    numIterations = numIterations + 1;
    
    if (firstIter == 1)
        oldY = objectiveFunction(currentX, M);  
        firstIter = 0;
    else
        gradient = computeGradient(currentX, M);
        newX = currentX - gradient*stepSize;
        newY = objectiveFunction(newX, M);
        difference = abs(oldY - newY);
        if difference < threshold

            break
        end
        
        oldY = newY;
        currentX = newX;
    end
end

end



