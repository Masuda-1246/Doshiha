clear;

n0 = 8;
n1 = 3;
n2 = 10;
n3 = 1;

number = 4;
m = 5*n1 + n0 + 4;
f1 = 1;
Fs = 10000;
L = 2;
Ts = 1/Fs;
Ns = L * Fs + 1;
M = [5 9 m 999];
t = zeros(1,Ns);
p = zeros(1,Ns);
bk = zeros(1,M(number));
w = 2 * pi * f1;

for i = 1:2:M(number)
    bk(i) = 4 / (i * pi);
end


for i = 1:Ns
    t(i) = (i-1)*Ts;
    for j=1:2:M(number)
        bk(i) = 4 / (j * pi);
        p(i) = p(i) + bk(i) * sin (w * j * t(i));
    end
end



plot(t,p);
xlabel('t');
ylabel('p');
