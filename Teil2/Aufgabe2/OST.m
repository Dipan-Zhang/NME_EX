function [LHS,RHS] = OST(theta,timestep,M,B,C,sol)
    LHS = M - theta*timestep*B;
    RHS = (M + (1-theta)*timestep*B) * sol;
end