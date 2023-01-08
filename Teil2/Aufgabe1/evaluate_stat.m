function [elemat,elevec] = evaluate_stat(elenodes,gpx,gpw)
    elemat = zeros(4,4);
    for i = 1 : 4
        for j = 1 : 4
            a_ele = 0;
            for k = 1 : size(gpx,1)
                [~,detJ,invJ] = getJacobian(elenodes, gpx(k,1), gpx(k,2));
                val = linquadderivref(gpx(k,1), gpx(k,2));
                temp = val(i,:)*invJ*(val(j,:)*invJ)'*detJ*gpw(k);
                a_ele = a_ele + temp;
            end
            elemat(i,j) = a_ele;
        end
    end
    elevec = zeros(4,1);
end 