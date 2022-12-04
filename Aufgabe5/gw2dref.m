function gaussw = gw2dref(n)
    switch(n)
        case 1
            gaussw = [4.0];%1x1
        case 2
            gaussw = [1.0;1.0;1.0;1.0];%4x1
        case 3
            gaussw = [0.308642;0.493827;0.308642;0.493827;0.790123;0.493827;0.308642;0.493827;0.308642];%9x1
        otherwise
            disp("input error, n<4");
    end

end