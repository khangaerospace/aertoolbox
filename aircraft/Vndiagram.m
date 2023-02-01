% Generate V-n diagram
M = 0.81; % mach number at cruse
alt = 12400;
Cl_max = 1.6;
Cl_min = -1.3;
nmax = 2.5;
nmin = -1;
R = 287;
T = 219.95;
rho = 1.225;
W = 88300;
S = 29.2;
f = 1.25; %slope of Vc and Vstall

V_c = M*sqrt(1.4*R*T);
Va = sqrt((2*nmax*W)/(rho*Cl_max*S));
Vstal_up = sqrt((2*W)/(rho*Cl_max*S));
Vstal_dw = sqrt((-2*W)/(rho*Cl_min*S));
Vd = f*V_c;


V_up = [0:0.001:Va];
n_1 = zeros(1,length(V_up));
for i = 1:length(n_1)
    n_1(i) = (0.5*rho*(V_up(i)^2)*S*Cl_max)/W;
end

V_down = [0:0.001:Vstal_dw];
n_2 = zeros(1,length(V_down));
for i = 1:length(n_2)
    n_2(i) = (0.5*rho*(V_up(i)^2)*S*Cl_min)/W;
end

Vu_c = [Va:0.001:Vd];
n_3 = zeros(1,length(Vu_c));
for i = 1:length(n_3)
    n_3(i) = nmax;
end

Vd_c = [Vstal_dw:0.001:V_c];
n_4 = zeros(1,length(Vd_c));
for i = 1:length(n_4)
    n_4(i) = nmin;
end


figure(1);
plot(V_down,n_2);
hold on;
plot(V_up,n_1);
hold on;
plot(Vu_c,n_3);
hold on;
plot(Vd_c,n_4);
hold on;
plot([V_c,Vd],[nmin,0]);
hold on;
plot([Vd,Vd],[nmax,0]);

axis([0, 350, -1.25, 2.75])
title('Vn Diagram')
xlabel('Velocity (m/s)')
ylabel('n')
