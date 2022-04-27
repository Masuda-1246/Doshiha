clear;

n0 = 8;
n1 = 3;
n2 = 10;
n3 = 1;

f = n0;
A = n1;
L = 1;
Fs = 1000;
Ts = 1 / Fs;
Ns = L * Fs + 1;
t = zeros(1,Ns);
p = zeros(1,Ns);

for i = 1 : Ns
    t(i) = (i-1)*Ts;
    p(i) = A * sin(2*pi*f*t(i));
end

plot(t,p);
xlabel('t');
ylabel('p');


