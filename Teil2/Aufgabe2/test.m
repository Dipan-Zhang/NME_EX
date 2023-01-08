
%%test evaluate inst
elenodes = [0,0;1,0;1,2;0,2];
elesol = [1;2;3;4];
eleosol = [0;0;0;0];
timInt_m = 1;
timestep = 1000;
theta = 0.66;
firststep = 1;


RHS_std = [809866.6666666666,373253.3333333334,182666.6666666667,397013.3333333334; 
           373253.3333333334,809866.6666666669,397013.3333333334,182666.6666666667; 
           182666.6666666667,397013.3333333334,809866.6666666667,373253.3333333334; 
           397013.3333333334,182666.6666666667,373253.3333333334,809866.6666666666];
LHS_std = [3736426.6666666665;3918693.3333333335;4895306.6666666670;5077573.3333333321];

[RHS_cal,LHS_cal] = evaluate_instat(elenodes,gx2dref(3),gw2dref(3),elesol,eleosol,timInt_m,timestep,theta,firststep);
for i = 1:size(RHS_std(:),1)
    assert(abs(RHS_std(i)-RHS_cal(i))<1e-5,"RHS fails");
end
for j = 1:size(LHS_std,1)
    assert(abs(LHS_std(j)-LHS_cal(j))<1e-5,"rhs fails");
end
