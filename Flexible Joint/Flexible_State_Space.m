clc
close
clear

%Defining variables
A = [0, 0, 1,0; 0, 0, 0, 1; 0, 483.13, -28.26, 0; 0, -837.21, 28.26, 0];
B = [0; 0; 49.7; -49.7];
C = [1, 0, 0, 0; 0, 1, 0, 0];
D = [0; 0];

%Controllability
C_c = ctrb(A, B);
r = rank(C_c);
if r == length(A)
    sd = [-5.04+1j*5.141 -5.04-1j*5.141 -100 -50];
    k = place(A, B, sd);
    display(k);
else
    disp("It's not CONTROLLABLE!!!");
end

%Transfer Function
Statespace = ss(A, B, C, D);
display(Statespace);
[num_G, den_G] =ss2tf(A, B, C, D);
G_1 = tf(num_G(1, :), den_G);
G_2 = tf(num_G(2, :), den_G);
G = [G_1; G_2];
display(G);

%Step & Impulse response
figure
step(feedback(G_1,1));
figure
impulse(feedback(G_1,1));
figure
step(feedback(G_2,1));
figure
impulse(feedback(G_2,1));

%Step response of Compensated system
A2 = A - B*k;
Statespace = ss(A2, B, C, D);
[num_Gc, den_Gc] =ss2tf(A2, B, C, D);
Gc_1 = tf(num_Gc(1, :), den_Gc);
Gc_2 = tf(num_Gc(2, :), den_Gc);
Gc = [Gc_1; Gc_2];
step(Gc_1)
stepinfo(Gc_1)
step(Gc_2)
stepinfo(Gc_2)


