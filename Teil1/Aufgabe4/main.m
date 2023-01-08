%main func
%test different Finite-Differenzen-Verfahre


x0 = 0.6;
h = 0.1;
f_deriv_exact =  0.038623809814453;

%zweipunkte-Formel
f2p_deriv = (fx(x0+h)-fx(x0))/h

%dreipunkte--Endpunk-Formel
f3p_ep_deriv = (-3*fx(x0)+4*fx(x0+h)-fx(x0+2*h))/2/h

%dreipunkte---Mittelpunk-Formel
f3p_mp_deriv = (fx(x0+h)-fx(x0-h))/2/h

%Fünfpunkt---Mittelpunk-Formel
f5p_mp_deriv = (fx(x0-2*h)-8*fx(x0-h)+8*fx(x0+h)-fx(x0+2*h))/12/h

