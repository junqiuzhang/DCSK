function Fm_signal=Fm_modulate(signal,fc,kf,fs)
% fc=1; % �ز�Ƶ��
% kf=1000; % ��Ƶϵ��
N=length(signal);
t=0:1/fs:1/fs*N; % ʱ������
% ����
integral_signal(1)=0;
for i=1:N
    integral_signal(i+1)=integral_signal(i)+signal(i);
end
Fm_signal=cos(2*pi*fc*t + 2*pi*kf*integral_signal);
end