function [f1,val]=fre_spec(x,fs)
%x----------����
%fs--------����Ƶ��
%Ƶ�׷���
N=length(x);
X1=fft(x,N);
X2=fftshift(fft(x,N));
F1=abs(X1);
F2=abs(X2);
f1=(fs/N)*(1:N/2);
f2=linspace(-fs/2,fs/2,N);
val=F1(1:N/2);
% figure
% plot(f1,F1(1:N/2));
% xlabel('Frequency/Hz');
% ylabel('Amplitude/dB');
% grid on;
figure
plot(f2,F2);
xlabel('Frequency/Hz');
ylabel('Amplitude/dB');
title('�����źŵ�Ƶ��');
grid on;
