clear;

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

p = zeros(1,Ns);


for i = 1 : Ns
    t(i) = (i-1)*Ts;
    pc = A * sin(2*pi*fc*t(i));
    pd = A * sin(2*pi*fd_*t(i));
    pg = A * sin(2*pi*fg*t(i));
    pa = A * sin(2*pi*fa_*t(i));
    p(i) = pc+pd+pg+pa;
end

sound(p,Fs);
audiowrite('ave 1116211038.wav',p,Fs)