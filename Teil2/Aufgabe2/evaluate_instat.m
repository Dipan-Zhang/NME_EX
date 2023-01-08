function [elemat,elevec] = evaluate_instat(elenodes,gpx,gpw,elesol,eleosol,timInt_m,timestep,theta,firststep)
    ro = 7800;
    c = 452;
    lambda = 48.0;
    M_mat = zeros(4,4);
    B_mat = zeros(4,4);
    for i = 1 : 4
        for j = 1 : 4
            M = 0;
            for k = 1 : size(gpx,1)
                [~,detJ,~] = getJacobian(elenodes, gpx(k,1), gpx(k,2));
                val = linquadderivref(gpx(k,1), gpx(k,2));
                temp = val(i,:)*val(j,:)'*detJ*gpw(k);
                M = M + temp;
            end
            M = M.*c.*ro;
            
            B = 0;
            for k = 1 : size(gpx,1)
                [~,detJ,invJ] = getJacobian(elenodes, gpx(k,1), gpx(k,2));
                val = linquadderivref(gpx(k,1), gpx(k,2));
                temp = val(i,:)*invJ*(val(j,:)*invJ)'*detJ*gpw(k);
                B = B + temp;
            end
            B = -B.*lambda;
            M_mat(i,j) = M;
            B_mat(i,j) = B;
        end
    end

       C = 0;
       if timInt_m==1
           [LHS,RHS] = OST(theta,timestep,M_mat,B_mat,C,elesol);
       elseif timInt_m==2
           [LHS,RHS] = AB2(timestep,M,B,C,[elesol,eleosol]);
       elseif timInt_m==3
           [LHS,RHS] = AM3(timestep,M,B,C,[elesol,eleosol]);
       elseif timInt_m==4
           [LHS,RHS] = BDF2(timestep,M,B,C,[elesol,eleosol]);
       else
           disp('false')
       end

elemat=LHS;
elevec=RHS;

end