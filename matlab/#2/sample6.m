clear;

n0 = 8;
n1 = 3;
n2 = 10;
n3 = 1;

A = 0.1;
L = 1;
Fs = 96000;
Ts = 1 / Fs;
Ns = L * Fs + 1;
t = zeros(1,Ns);
p = zeros(1,Ns);

f = 300;
t0 = 0.2;
z = zeros(1, Fs/2);

for i = 1:Ns
    t(i) = (i - 1) * Ts;
    if t(i) < t0
        p(i) = A * (1 -cos(pi * t(i) / t0)) / 2 * sin(2 * pi * f * t(i));
    elseif t(i) > L - t0
        p(i) = A * (1 -cos(pi * (L - t(i) / t0))) / 2 * sin(2 * pi * f * t(i));
    else 
        p(i) = A * sin(2 * pi * f * t(i));
    end
end
q = [p z p z p];
sound(q,Fs);