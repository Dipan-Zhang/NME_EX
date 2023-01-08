%% Test : function XVII
elenodes = [0,0;1,0;1,2;0,2];
lambda = 48.0;
A_std = [40.000000000000000,-28.000000000000004,-20.000000000000000,7.999999999999998;
            -28.000000000000004,40.000000000000007,8.000000000000000,-20.000000000000000;
            -20.000000000000000,8.000000000000000,39.999999999999993,-28.000000000000000; 
            7.999999999999998,-20.000000000000000,-28.000000000000000,40.000000000000000];     
[A_cal,~] = evaluate_stat(elenodes,gx2dref(3),gw2dref(3));
A_cal = A_cal.*lambda;
for i = 1:size(A_std(:),1)
    assert(abs(A_std(i)-A_cal(i))<1e-5);
end

%% Test2: FAssembileren 
clear;
elemat = [1, 2, 3, 4;5,6,7,8;9,10,11,12;13,14,15,16];
elerhs = [17;18;19;20];
sysmat = eye(5,5);
rhs = ones(5,1);
ele = [5,3,1,2]; 

%std ans
sysmat_std = [12,12,10,0,9;
             15,17,14,0,13;
             7,8,7,0,5;
             0,0,0,1,0;
             3,4,2,0,2];
rhs_std = [20;21;19;1;18];

%cal
[sysmat_cal, rhs_cal] =  assemble(elemat,elerhs,sysmat,rhs,ele);

for i = 1:size(sysmat_std(:),1)
    assert(abs(sysmat_std(i)-sysmat_cal(i))<1e-5,"sysmat fails");
end
for j = 1:size(rhs_std,1)
    assert(abs(rhs_std(j)-rhs_cal(j))<1e-5,"rhs matrix fails");
end


%%Test3 : Dirichtlet
clear;
sysmat = [12, 12,10,0,9;
        15,17,14,0,13;
        7,8,7,0,5;
        0,0,0,1,0;
        3,4,2,0,2];

rhs = [20;21;19;1;18];
dbc = [2,-7;
       5,-2];

dbcsysmat_std = [12,12,10,0,9;
                0,1,0,0,0;
                7,8,7,0,5;
                0,0,0,1,0;
                0,0,0,0,1];
dbcrhs_std = [20;-7;19;1;-2];

[dbcsysmat_cal,dbcrhs_cal] = assignDBC(sysmat,rhs,dbc);

for i = 1:size(dbcsysmat_cal(:),1)
    assert(abs(dbcsysmat_std(i)-dbcsysmat_cal(i))<1e-5,"sysmat fails");
end
for j = 1:size(dbcrhs_cal,1)
    assert(abs(dbcrhs_cal(j)-dbcrhs_std(j))<1e-5,"rhs matrix fails");
end
