%genergate random number rand(num,range)
% facultaet
a = rand(1000,1);
if a(1,1)>=0.5
    disp('a');
else
    disp('b');
end

n_05 = 0;
for i = 1:size(a,1) 
    if a(i,1)>= 0.5
        n_05 = n_05+1;
    end
end