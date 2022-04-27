clear;

n0 = 8;
n1 = 3;
n2 = 10;
n3 = 1;

A = 0.1;
L = 1;
Fs = 44100;
Ts = 1 / Fs;
Ns = L * Fs + 1;
t = zeros(1,Ns);
p = zeros(1,Ns);

fc = 500;
fm = 500000;
m = 1;
z = zeros(1, Fs/2);

for i = 1:Ns
    t(i) = (i - 1) * Ts;
    p(i) = A * (1 + m * sin(2 * pi * fm * t(i))) * sin(2 * pi * fc * t(i));
end
plot(t,p);
xlabel('t');
ylabel('p');

% q = [p];
sound(p,Fs);