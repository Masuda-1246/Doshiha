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

fa = 440;
fc = fa*2^(-9/12);
fd_ = fc^(3/12);
fg = fc^(7/12);
fa_ = fc^(10/12);

pc = zeros(1,Ns);
pd_ = zeros(1,Ns);
pg = zeros(1,Ns);
pa_ = zeros(1,Ns);
p = zeros(1,Ns);


for i = 1 : Ns
    t(i) = (i-1)*Ts;
    pc(i) = A * sin(2*pi*fc*t(i));
    pd_(i) = A * sin(2*pi*fd_*t(i));
    pg(i) = A * sin(2*pi*fg*t(i));
    pa_(i) = A * sin(2*pi*fa_*t(i));
    p(i) = pc(i)+pd_(i)+pg(i) +pa_(i);
end


sound(p,Fs);
audiowrite('ave 1116211038.wav',p,Fs)
