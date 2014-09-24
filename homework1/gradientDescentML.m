function [newX,newY, numIterations] = gradientDescentML(initialGuess, objectiveFunction, computeGradient, stepSize, threshold)

%Gradient Descent

firstIter = 1;
currentX = initialGuess;
numIterations = 0;

while true
    
    numIterations = numIterations + 1;
    
    if (firstIter == 1)
        oldY = objectiveFunction(currentX);  
        firstIter = 0;
    else
        gradient = computeGradient(currentX);
        newX = currentX - gradient*stepSize;
        newY = objectiveFunction(newX);
        difference = abs(oldY - newY)
        if difference < threshold

            break
        end
        
        oldY = newY;
        currentX = newX;
    end
end

end



