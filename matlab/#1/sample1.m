clear;

n0 = 8;
n1 = 3;
n2 = 10;
n3 = 1;

f0 = n0;
f1 = n1;
f2 = n2;

A0 = 1/n0;
A1 = 1/n1;
A2 = 1/n2;

L = 1;
Fs = 1000;
Ts = 1 / Fs;
Ns = L * Fs + 1;
t = zeros(1,Ns);
p = zeros(1,Ns);

for i = 1 : Ns
    t(i) = (i-1)*Ts;
    p(i) = A0 * sin(2*pi*f0*t(i)) + A1 * sin(2*pi*f1*t(i)) + A2 * sin(2*pi*f2*t(i));
end

plot(t,p);
xlabel('t');
ylabel('p');



