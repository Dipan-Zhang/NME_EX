function [LHS,RHS] = BDF2(timestep,M,B,C,sol)
    LHS = 1.5*M - timestep*B(1);
    RHS = 2*M*sol(1) -0.5*sol(2) + timestep * C(1);
end