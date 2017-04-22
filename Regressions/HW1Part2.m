function [L_m1_table,L_m2_table, L_m1_table_100, L_m2_table_100]=HW1Part2()
% Learning real predictors - polynomial basis
format long

t=10;
sigma = 0.1;
x = rand(t,1);
y = double(x>0.5);
y1= 0.5 - 10.4*x.*(x-0.5).*(x-1)+sigma*randn(t, 1);

%% Part a
d=3;
c = minL2poly(x, y, d);
c1 = minL2poly(x, y1, d);

%% Part b
d=1;
c_m1_1 = minL2poly(x, y, d);
c_m2_1 = minL2poly(x, y1, d);
d=3;
c_m1_3 = minL2poly(x, y, d);
c_m2_3 = minL2poly(x, y1, d);
d=5;
c_m1_5 = minL2poly(x, y, d);
c_m2_5 = minL2poly(x, y1, d);
d=9;
c_m1_9 = minL2poly(x, y, d);
c_m2_9= minL2poly(x, y1, d);

% Generate plots
% Model 1
strtitle='Generative Model 1'
figure('Name',strtitle)
axis([0 1 -0.5 1.5]);
hold
plot(x', y', 'k*')
xx = (0:1000)/1000;
yy = double(xx>0.5);
plot(xx, yy, 'k:')
plot(xx, polyval(c_m1_1, xx), 'r-') 
plot(xx, polyval(c_m1_3, xx), 'g-') 
plot(xx, polyval(c_m1_5, xx), 'b-') 
plot(xx, polyval(c_m1_9, xx), 'm-')
title(strtitle)
legend('Few Train Points','Training Data','d=1','d=3','d=5','d=9')

% Model 2
strtitle='Generative Model 2'
figure('Name',strtitle)
axis([0 1 -0.5 1.5]);
hold
plot(x', y1', 'k*')
yy1 = 0.5 - 10.4*xx.*(xx-0.5).*(xx-1);
plot(xx, yy1, 'k:')
plot(xx, polyval(c_m2_1, xx), 'r-') 
plot(xx, polyval(c_m2_3, xx), 'g-') 
plot(xx, polyval(c_m2_5, xx), 'b-') 
plot(xx, polyval(c_m2_9, xx), 'm-')
title(strtitle)
legend('Few Train Points','Training Data','d=1','d=3','d=5','d=9')

save_all_figures_to_directory('/Users/Jaliss/Documents/UCSC/CMPS_142/Hw1/Deliverable/','Part_2')


%% Part bc 
% Model 1
c1_e=norm(polyval(c_m1_1, x)-y);
c3_e=norm(polyval(c_m1_3, x)-y);
c5_e=norm(polyval(c_m1_5, x)-y);
c9_e=norm(polyval(c_m1_9, x)-y);
L_m1_table=[c1_e;c3_e;c5_e;c9_e];
% Model 2
c1_e=norm(polyval(c_m2_1, x)-y1);
c3_e=norm(polyval(c_m2_3, x)-y1);
c5_e=norm(polyval(c_m2_5, x)-y1);
c9_e=norm(polyval(c_m2_9, x)-y1);
L_m2_table=[c1_e;c3_e;c5_e;c9_e];

%% Part bd
te=1000;
sigma = 0.1;
x = rand(te,1);
y = double(x>0.5);
y1= 0.5 - 10.4*x.*(x-0.5).*(x-1)+sigma*randn(te, 1);

% Model 1
c1_e=norm(polyval(c_m1_1, x)-y);
c3_e=norm(polyval(c_m1_3, x)-y);
c5_e=norm(polyval(c_m1_5, x)-y);
c9_e=norm(polyval(c_m1_9, x)-y);
L_m1_table_100=[c1_e;c3_e;c5_e;c9_e];

% Model 2
c1_e=norm(polyval(c_m2_1, x)-y1);
c3_e=norm(polyval(c_m2_3, x)-y1);
c5_e=norm(polyval(c_m2_5, x)-y1);
c9_e=norm(polyval(c_m2_9, x)-y1);
L_m2_table_100=[c1_e;c3_e;c5_e;c9_e];

end
