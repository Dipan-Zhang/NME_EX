h = 1e-5;
x0 = 0.6;
step = nthroot(1e5,100);
h_coord = zeros(101,1);
for i = [1:1:101]
    h_coord(i) = h*step;
    h = h*step;
end


f2p_deriv_ar = zeros(101,1);
f3p_ep_deriv_ar = zeros(101,1);
f3p_mp_deriv_ar = zeros(101,1);
f5p_mp_deriv_ar = zeros(101,1);
f_deriv_exact =  0.038623809814453;
f_deriv_exact_ar = f_deriv_exact*ones(101,1);
h = 1e-5;
for i = [1:1:101]
    f2p_deriv_ar(i) = (fx(x0+h)-fx(x0))/h;
    f3p_ep_deriv_ar(i) = (-3*fx(x0)+4*fx(x0+h)-fx(x0+2*h))/2/h;
    f3p_mp_deriv_ar(i) = (fx(x0+h)-fx(x0-h))/2/h;
    f5p_mp_deriv_ar(i) = (fx(x0-2*h)-8*fx(x0-h)+8*fx(x0+h)-fx(x0+2*h))/12/h;
    h = h_coord(i);
end

errors_f2p = abs(f_deriv_exact_ar - f2p_deriv_ar);
errors_f3p_ep = abs(f_deriv_exact_ar - f3p_ep_deriv_ar);
errors_f3p_mp = abs(f_deriv_exact_ar - f3p_mp_deriv_ar);
errors_f5p_mp = abs(f_deriv_exact_ar - f5p_mp_deriv_ar);

loglog(h_coord,errors_f2p,'r');
hold on;
loglog(h_coord,errors_f3p_ep,'g');
loglog(h_coord,errors_f3p_mp,'b');
loglog(h_coord,errors_f5p_mp,'k');
loglog(h_coord,h_coord,'c');
loglog(h_coord,h_coord.^2,'c');
loglog(h_coord,h_coord.^4,'c');

% plot(log(h_coord),log(errors_f2p),'r');
% hold on;
% plot(log(h_coord),log(errors_f3p_ep),'g');
% plot(log(h_coord),log(errors_f3p_mp),'b');
% plot(log(h_coord),log(errors_f5p_mp),'k');
% plot(log(h_coord),log(h_coord),'c');
% plot(log(h_coord),log(h_coord.^2),'c');
% plot(log(h_coord),log(h_coord.^4),'c');
%plot(h_coord,f5p_mp_deriv_ar,'k');