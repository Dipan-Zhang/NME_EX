% key points at how to construct T
function quadplot(nodes,elements,sol)
    x = nodes(:,1);
    y = nodes(:,2);

    
    T = [elements(:,1:3);elements(:,3:4),elements(:,1)];
    
    trisurf(T,x,y,sol);
    xlabel('x');
    ylabel('y');
    zlabel('f(x,y)');
    title('happy birthday to u')
end