function [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele)
    for i= 1:size(elemat,1)
        for j = 1: size(elemat,2)
            sysmat(ele(i),ele(j)) = elemat(i,j)+ sysmat(ele(i),ele(j));
        end
    end

    for k = 1: size(elevec,1)
        rhs(ele(k)) = elevec(k)+ rhs(ele(k));
    end
end