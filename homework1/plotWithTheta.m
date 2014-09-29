function p = plotWithTheta(theta)
    
    M = length(theta);
    newXRangeWithOnes = [];
    xrange = 0: 0.01: 1;
    for i = 0 : M-1 
        newXRangeWithOnes = horzcat(newXRangeWithOnes, xrange'.^(i));
    end
    yrange = newXRangeWithOnes*theta;
    p = plot(xrange, yrange, 'g');

end