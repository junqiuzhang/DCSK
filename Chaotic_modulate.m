function Modulate_signal=Chaotic_modulate(Bit_n,L,Bit,u)
Modulate_signal=[];
for i=1:Bit_n
    refer_signal=u((i-1)*L+1:i*L);%ÿ����Ԫ�Ĳο��ź�
    modul_signal=refer_signal.*Bit(i);%ÿ����Ԫ�ĵ����ź�
    Modulate_signal=[Modulate_signal,refer_signal,modul_signal];
end   
Modulate_signal=single(Modulate_signal);
