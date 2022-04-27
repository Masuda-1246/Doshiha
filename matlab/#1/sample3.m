clear;

n0 = 8;
n1 = 3;
n2 = 10;
n3 = 1;

f = 100*n1 + 10*n0;
A = 0.1;
L = 1;
Fs = 44100;
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
sound(p,Fs);
audiowrite('sound 1116211038.wav',p,Fs)