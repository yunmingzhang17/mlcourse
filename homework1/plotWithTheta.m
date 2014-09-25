function plotWithTheta(theta)
    
    M = length(theta);
    newXRangeWithOnes = [];
    xrange = 0: 0.01: 1;
    for i = 0 : M-1 
        newXRangeWithOnes = horzcat(newXRangeWithOnes, xrange'.^(i));
    end
    yrange = newXRangeWithOnes*theta;
    plot(xrange, yrange, 'g');

end