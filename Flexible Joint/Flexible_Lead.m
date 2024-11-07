clc
close
clear

%Defining variables
A = [0, 0, 1,0; 0, 0, 0, 1; 0, 483.13, -28.26, 0; 0, -837.21, 28.26, 0];
B = [0; 0; 49.7; -49.7];
C = [1, 0, 0, 0; 0, 1, 0, 0];
D = [0; 0];
ka = (10*1.001e4)/(1.76e4);

%Transfer Function
Statespace = ss(A, B, C, D);
display(Statespace);
[num_G, den_G] =ss2tf(A, B, C, D);
G_1 = tf(num_G(1, :), den_G);
display(G_1);

%Bode Uncompensated
margin(ka*G_1);

%Bode Compensated
C = tf([1 6.85], [1 14.88]);
figure
margin(C*ka*G_1)

%Step & Impulse response
figure
step(feedback(C*ka*G_1, 1))
stepinfo(feedback(C*ka*G_1, 1))
figure
impulse(feedback(C*ka*G_1, 1))