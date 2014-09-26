function plotWithTheta2(theta, min, max)
    
    M = length(theta);
    newXRangeWithOnes = [];
    xrange = min: 0.01: max;
    for i = 0 : M-1 
        newXRangeWithOnes = horzcat(newXRangeWithOnes, xrange'.^(i));
    end
    yrange = newXRangeWithOnes*theta;
    plot(xrange, yrange, 'r');

end