clear;

n0 = 8;
n1 = 3;
n2 = 10;
n3 = 1;

A0 = 0.1;
dA = 0.02;
A1 = A0 + dA;
L = 1;
Fs = 44100;
Ts = 1 / Fs;
Ns = L * Fs + 1;
t = zeros(1,Ns);
p0 = zeros(1,Ns);
p1 = zeros(1,Ns);

number = 2;
f = [100 500 1000];
f0 = f(number);
t0 = 0.2;
z = zeros(1, Fs/2);

for i = 1:Ns
    t(i) = (i - 1) * Ts;
    if t(i) < t0
        p0(i) = A0 * (1 -cos(pi * t(i) / t0)) / 2 * sin(2 * pi * f0 * t(i));
        p1(i) = A1 * (1 -cos(pi * t(i) / t0)) / 2 * sin(2 * pi * f0 * t(i));
    elseif t(i) > L - t0
        p0(i) = A0 * (1 -cos(pi * (L - t(i) / t0))) / 2 * sin(2 * pi * f0 * t(i));
        p1(i) = A1 * (1 -cos(pi * (L - t(i) / t0))) / 2 * sin(2 * pi * f0 * t(i));
    else 
        p0(i) = A0 * sin(2 * pi * f0 * t(i));
        p1(i) = A1 * sin(2 * pi * f0 * t(i));
    end
end
q = [p0 z p1];
sound(q,Fs);
audiowrite('ensyu8.wav',p1,Fs)