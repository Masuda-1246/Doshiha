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
p1 = zeros(1,Ns);
t0 = 0.2;

fc = 500;
fm = 101600;
m = 1;
z = zeros(1, Fs/2);

for i = 1:Ns
    t(i) = (i - 1) * Ts;
    p1(i) = A * (1 + m * sin(2 * pi * fm * t(i))) * sin(2 * pi * fc * t(i));
    if t(i) < t0
        p(i) = A * (1 -cos(pi * t(i) / t0)) / 2 * sin(2 * pi * fc * t(i));
    elseif t(i) > L - t0
        p(i) = A * (1 -cos(pi * (L - t(i) / t0))) / 2 * sin(2 * pi * fc * t(i));
    else 
        p(i) = A * sin(2 * pi * fc * t(i));
    end
end
% plot(t,p);
% xlabel('t');
% ylabel('p');

plot(t,p1);
xlabel('t');
ylabel('p1');

q = [p z z p1];
sound(q,Fs);