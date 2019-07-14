function BER_DCSK = DCSK(Bit_n,L,Bit,u)
%% ����
Modulated_signal=Chaotic_modulate(Bit_n,L,Bit,u);

%% �ྶ
flag_rece=Modulated_signal;
h=[0.6,zeros(1,400),0.3,zeros(1,500),0.1];
flag_rece=conv(Modulated_signal,h);
flag_rece=flag_rece(1:length(Modulated_signal));

%% ���
Eb_N0=0:1:20;
for i=1:length(Eb_N0)
    Received_signal=Fun_EBN0(flag_rece,Bit_n,Eb_N0(i));%% ����
    Recover_bit=Chaotic_demodulate(Bit_n,L,Received_signal);%����
    %����
    BER_DCSK(i)=length(find((Bit-Recover_bit)~=0))/Bit_n;
    %������
    wa=waitbar(i/length(Eb_N0));
end
close(wa);%�رս�����

end