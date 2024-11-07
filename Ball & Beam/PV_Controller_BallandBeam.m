clc
close
clear
% defining variables
tp = 1.5;
ze = 0.707;
w_n = pi/(tp*sqrt(1-ze^2));
k_p = (w_n^2)/7;
k_v = (2*ze*w_n)/7;

%Transfer Function
s = tf('s');
T = (7*k_p)/(s^2 + 7*k_v*s + 7*k_p);

%Results
display(T)
stepinfo(T)

% figure(1)
% pzmap(G, T)

figure(2)
rlocus(T)
% figure(3)
% rlocus(G_ol)

figure(4)
step(T, 3.5)