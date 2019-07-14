% clear all;clc;close all;

%% 参数配置
fc=30000; % 载波频率
fd=1000; % 频偏
fs=96000;% 采样频率
nSamp=1/fs;% 采样间隔
Bit_n=10000;% 码元数量
Bit=single(sign(randn(1,Bit_n)));% 待发送码元

%% 参数配置显示及效验
fprintf('\r');
fprintf('通信参数\r');
fprintf('--------------\r');


hold on
grid on
Eb_N0=0:1:20;
% axis([0 Eb_N0(end) 10^-4 10^-0.3]);
color=['r','g','b','y','k'];
% color=['r','g'];
for i = 1:5
    L=i*6;% 扩频增益
    Nsample=Bit_n*L*2;% 采样点数量
    % 混沌信号生成
    u=logistic_map(Nsample);
    
    % DCSK FM-DCSK调制解调
%     BER_DCSK=DCSK(Bit_n,L,Bit,u);
%     semilogy(Eb_N0,BER_DCSK,color(i),'LineWidth',2);
    BER_FM_DCSK=FM_DCSK(Bit_n,L,Bit,u,fc,fs,fd);
    semilogy(Eb_N0,BER_FM_DCSK,color(i),'LineWidth',2);
end
legend('L=6','L=12','L=18','L=24','L=30');
xlabel('扩频增益');
ylabel('误码率');
% legend('DCSK','FM_DCSK')

% %% 调制
% Modulated_signal=Chaotic_modulate(Bit_n,L,Bit,u);
%
% %% 多径
% flag_rece=Modulated_signal;
% h=[0.6,zeros(1,400),0.3,zeros(1,500),0.1];
% flag_rece=conv(Modulated_signal,h);
% flag_rece=flag_rece(1:length(Modulated_signal));
%
% %% 解调
% Eb_N0=0:1:20;
% for i=1:length(Eb_N0)
%     Received_signal=Fun_EBN0(flag_rece,Bit_n,Eb_N0(i));%% 噪声
%     Recover_bit=Chaotic_demodulate(Bit_n,L,Received_signal);%解码
%     %误码
%     BER_DCSK(i)=length(find((Bit-Recover_bit)~=0))/Bit_n;
%     %进度条
%     wa=waitbar(i/length(Eb_N0));
% end
% close(wa);%关闭进度条
% %% 理论误码率
% BER=Fun_BER_DCSK_theoretical(L,Eb_N0);
% semilogy(Eb_N0,BER,'yo-','LineWidth',2)

%% plot

