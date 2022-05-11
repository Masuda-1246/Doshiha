clear;


Fs = 44100;
Ns = length(p);
Ts = 1/Fs;
t = zeros(1,Ns);
p = zeros(1,Ns);

F = [];
A = [];
M = length(F);
A0 = 100;

for j = 1:M
    for i = 1:Ns
        t(i) = (i-1) * Ts;
        p(i) = p(i) + A(j) * sin(2*pi*F(j) * t(i)) * A0;
    end
end

%プログラムA
plot(t,p);
xlabel('t');
ylabel('p');

