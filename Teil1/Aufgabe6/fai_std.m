function res = fai_std(t)
    res = exp(-5.*t).*(t.^2-2.*t+2)-2.*exp(-6.*t);
end