% clear all;clc;close all;

%% 参数配置
Bit_n=10000;%码元数量
L=160;%扩频增益
fs=96000;%采样频率
nSamp=1/fs;%采样间隔
Bit=single(sign(randn(1,Bit_n)));%待发送码元
Nsample=Bit_n*L*2;%采样点数量
M=L*2; %扩频增益

%% 参数配置显示及效验
Vb=fs/L;
fprintf('\r');
fprintf('通信参数\r');
fprintf('--------------\r');
fprintf('采样频率: %g Hz\n',fs);
fprintf('通信速率: %g bit/s\n',Vb);
fprintf('扩频因子: %g \n',L);
fprintf('载频过采样: %g \n',fs/L);


%% 混沌信号生成
u=logistic_map(Nsample);

%% 调制
Modulated_signal=Chaotic_modulate(Bit_n,L,Bit,u);

%% 多径
flag_rece=Modulated_signal;
% h=[0.6,zeros(1,400),0.3,zeros(1,500),0.1];
% flag_rece=conv(Modulate_signal,h);
% flag_rece=flag_rece(1:length(Modulate_signal));

%% 解调
Eb_N0=0:1:20;
for i=1:length(Eb_N0)
    Received_signal=Fun_EBN0(flag_rece,Bit_n,Eb_N0(i));%% 噪声    
    Recover_bit=Chaotic_demodulate(Bit_n,L,Received_signal);%解码
    %误码
    BER(i)=length(find((Bit-Recover_bit)~=0))/Bit_n;
    %进度条
    wa=waitbar(i/length(Eb_N0));
end
close(wa);%关闭进度条
%% 理论误码率
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

