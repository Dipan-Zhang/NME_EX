function gaussw = gw(n)
    switch(n)
        case 1
            gaussw = 2;
        case 2
            gaussw = [1,1];
        case 3
            gaussw = [5/9,8/9,5/9];
        otherwise
            disp("input error, n<4");
    end

end