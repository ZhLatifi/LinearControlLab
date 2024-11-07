clc
close
clear
% defining variables
Am = 0.129;
B = 0.0844;
J = 0.00213;
z = 0.1;

%Transfer Function
s = tf('s');
G = Am / (s * (s*J + B));
K = 6.48;
C = K*(s + z)/s;

%Results
figure(1)
rlocus(G);

figure(2)
G_ol = series (G, C);
rlocus(G_ol);
T = feedback (G_ol, 1);

figure(3)
pzmap(G, T)

%step(T/s, 0.3)
display(C);