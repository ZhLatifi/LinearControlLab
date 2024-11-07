clc
close
clear
% defining variables
Am = 64.2;
B = 36.42;
J = 1;
z = 40;
p = 87.442;
s_d = -40 + 41.987i;

%Transfer Function
s = tf('s');
G = Am / (s*(s*J + B));
K = rlocfind(G*((s + z)/(s + p)),s_d);
C = K*((s + z)/(s + p)) ;
G_ol = series (G, C);
T = feedback (G_ol, 1);

%Results
display(T)
stepinfo(T)

%figure(1)
%pzmap(G, T) 

figure(2)
rlocus(G)

figure(3)
step(T)

%Question5
T1 = feedback(series(C, G), 1)
T2 = feedback(series(T1, (7/(s^2))), 0.5981*s);
T_new = feedback(series(T2, 1.2524), 1)
display(T_new)
figure(4)
step(T_new, 5)
hold on
stepinfo(T_new)

T_pre  = 7 / (s^2 + s*3.5899 + 7)
display(T_pre)
step(T_pre)
stepinfo(T_pre)
