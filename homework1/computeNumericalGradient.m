function gradient = computeNumericalGradient(objectiveFunction, Xdata, Ydata, X, lambda)
    delta = 0.000001;
    gradient = zeros(length(X),1);
    
    for i = 1: length(X)
        Xplus = zeros(length(X),1);
        Xminus = zeros(length(X),1);
        Xplus(i) = Xplus(i) + delta;
        Xminus(i) = Xminus(i) - delta;
        gradient(i) = objectiveFunction(Xdata, Ydata, Xplus, lambda) - objectiveFunction(Xdata, Ydata, Xminus, lambda)./(2*delta);        
    end

end