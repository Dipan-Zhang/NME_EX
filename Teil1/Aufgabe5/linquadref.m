%um die bilinearen ansatzfunktion zu rechnen
function val = linquadref(xi,eta)
    val = [(1 - xi)*(1 - eta)/4;
           (1 + xi)*(1 - eta)/4;
           (1 + xi)*(1 + eta)/4;
           (1 - xi)*(1 + eta)/4];

end