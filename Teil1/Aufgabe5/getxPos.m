% xi x coordinate
%eta y coordinate of reference KS
% transfer (x,y) in refernce frame to (x,y) in real frames

function x = getxPos(nodes,xi,eta)
    
    N = [(1 - xi)*(1 - eta);
         (1 + xi)*(1 - eta);
         (1 + xi)*(1 + eta);
         (1 - xi)*(1 + eta)]/4;
    x = nodes'*N;
end