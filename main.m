% clear all;clc;close all;

%% ��������
Bit_n=10000;%��Ԫ����
L=160;%��Ƶ����
fs=96000;%����Ƶ��
nSamp=1/fs;%�������
Bit=single(sign(randn(1,Bit_n)));%��������Ԫ
Nsample=Bit_n*L*2;%����������
M=L*2; %��Ƶ����

%% ����������ʾ��Ч��
Vb=fs/L;
fprintf('\r');
fprintf('ͨ�Ų���\r');
fprintf('--------------\r');
fprintf('����Ƶ��: %g Hz\n',fs);
fprintf('ͨ������: %g bit/s\n',Vb);
fprintf('��Ƶ����: %g \n',L);
fprintf('��Ƶ������: %g \n',fs/L);


%% �����ź�����
u=logistic_map(Nsample);

%% ����
Modulated_signal=Chaotic_modulate(Bit_n,L,Bit,u);

%% �ྶ
flag_rece=Modulated_signal;
% h=[0.6,zeros(1,400),0.3,zeros(1,500),0.1];
% flag_rece=conv(Modulate_signal,h);
% flag_rece=flag_rece(1:length(Modulate_signal));

%% ���
Eb_N0=0:1:20;
for i=1:length(Eb_N0)
    Received_signal=Fun_EBN0(flag_rece,Bit_n,Eb_N0(i));%% ����    
    Recover_bit=Chaotic_demodulate(Bit_n,L,Received_signal);%����
    %����
    BER(i)=length(find((Bit-Recover_bit)~=0))/Bit_n;
    %������
    wa=waitbar(i/length(Eb_N0));
end
close(wa);%�رս�����
%% ����������
BER_DCSK=Fun_BER_DCSK_theoretical(L,Eb_N0);


%% plot
semilogy(Eb_N0,BER,'yo-','LineWidth',2)
% hold on
% semilogy(Eb_N0,BER_DCSK,'bs:','LineWidth',2)
grid on
axis([0 Eb_N0(end) 10^-4 10^0])
legend('DCSK')
% legend('Simulation','Therotical')

 % fre_spec(u,fs);

