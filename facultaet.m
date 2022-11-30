function nfac = facultaet(n)
nfac = 1;
if n>1
    nfac = n* facultaet(n-1);
elseif n ==1
    nfac = nfac;
end
if n == 0
    nfac = 1;
end
end
 