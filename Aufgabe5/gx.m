function gaussx = gx(n)
    switch(n)
        case 1
            gaussx = 0;
        case 2
            gaussx = [-1/sqrt(3),1/sqrt(3)];
        case 3
            gaussx = [-sqrt(0.6),0,sqrt(0.6)];
        otherwise
            disp("input error, n<4");
    end

end