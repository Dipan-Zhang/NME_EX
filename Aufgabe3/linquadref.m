%um die bilinearen ansatzfunktion zu rechnen
% using -1 1 rect as default
function val = linquadref(xi,eta)
    val = [(1 - xi)*(1 - eta);
           (1 + xi)*(1 - eta);
           (1 + xi)*(1 + eta);
           (1 - xi)*(1 + eta)]/4;

end