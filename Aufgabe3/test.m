
%test
y_values = [0 1 3 1];


%funktionswert im (0,0)

f_est1 = linquadref(0,0)'*y_values'
f_est2 = linquadref(0.577, -0.577)'*y_values'

linquadderivref(0,0)
linquadderivref(0.577, -0.577)

f_dev_est1 = linquadderivref(0,0)'*y_values'
f_dev_est2 = linquadderivref(0.577, -0.577)'*y_values'