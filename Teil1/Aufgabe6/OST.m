function [LHS,RHS] = OST(theta,timestep,M,B,C,sol)
    LHS = M - theta*timestep*B(1);
    RHS = (M + (1-theta)*timestep*B(2)) * sol + theta * timestep * C(1) + (1-theta)*timestep*C(2);
end