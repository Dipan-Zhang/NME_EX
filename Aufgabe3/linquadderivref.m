%um die bilinearen ansatzfunktion zu rechnen
function val = linquadderivref(xi,eta)
    val = [(eta - 1), (xi - 1);
           (1 - eta), (-xi - 1);
           (1 + eta), (1 + xi);
           (-1 - eta), (1 - xi)]/4;

end