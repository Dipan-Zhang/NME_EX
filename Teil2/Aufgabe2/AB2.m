function [LHS,RHS] = AB2(timestep,M,B,C,sol)

    LHS = M;
    RHS = (M + 1.5*timestep*B(2))*sol(1) -0.5*timestep*B(1)*sol(2) - 0.5 *timestep*C(2) + 1.5*timestep * C(1);
    
end