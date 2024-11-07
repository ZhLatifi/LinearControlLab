clc
close
clear
% defining variables
Am = 0.129;
B = 0.0844;
J = 0.00213;
z = 40;
p = 81.18;
s_d = -40 + 107.05i;

%Transfer Function
s = tf('s');
G = Am / (s * (s*J + B));
K = rlocfind(G*((s + z)/(s + p)),s_d);
C = K*((s + z)/(s + p)) ;
G_ol = series (G, C);
T = feedback (G_ol, 1);
z_i = 1117/17.92;
C_pre = z_i / (s + z_i);
P = series (C_pre, T);

%Results
display(T) %->P
stepinfo(T) %->P

figure(1)
pzmap(G, T) %T->P

figure(2)
rlocus(G_ol)

figure(3)
step(T, 0:0.001:0.3) %->P
