clc
close
clear
% defining variables
Am = 0.129;
B = 0.0844;
J = 0.00213;
z = 83.29; %-->65.29
S_d = -40 + 41.987i;

%Transfer Function
s = tf('s');
G = Am / (s * (s*J + B));
K = rlocfind(G*(S_d + z), S_d);
C = K*(s + z) ;
G_ol = series (G, C);
T = feedback (G_ol, 1);

%Results
display(T)
stepinfo(T)

figure(1)
pzmap(G, T)

figure(2)
rlocus(G)

figure(3)
rlocus(G_ol)

figure(4)
step(T, 0.3)