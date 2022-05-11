clear;

[p, Fs] = audioread('./audio/name.wav');
Ns = length(p);
Ts = 1/Fs;
t = zeros(1,Ns);
fr = zeros(1,Ns);
for i = 1:Ns
    t(i) = (i-1)*Ts;
    fr(i) = i/(Ns*Ts);
end
%プログラムA
plot(t,p);
% xlim([1 1.05]);
% xlabel('t');
% ylabel('A');

%プログラムB
y = abs(fft(p));
semilogy(fr, 2*y/Ns);
xlim([0 5000]);
xlabel('f');
ylabel('A');

specgram(p,512,Fs,kaiser(500,5),475);
xlabel('t');
ylabel('f');