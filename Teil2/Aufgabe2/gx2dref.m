function gaussx = gx2dref(n)
    a = 0.577350269189626;
    b = 0.774596669241483;
    switch(n)
        case 1
            gaussx = [0.0,0.0];%1x2
        case 2
            gaussx = [-a,-a;-a,a;a,-a;a,a];%4x2
        case 3
            gaussx = [-b,-b;-b,0;-b,b;0,-b;0,0;0,b;b,-b;b,0;b,b];%9x2
        otherwise
            disp("input error, n<4");
    end

end