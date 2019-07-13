function Modulate_signal=Chaotic_modulate(Bit_n,L,Bit,u)
Modulate_signal=[];
for i=1:Bit_n
    refer_signal=u((i-1)*L+1:i*L);%每个码元的参考信号
    modul_signal=refer_signal.*Bit(i);%每个码元的调制信号
    Modulate_signal=[Modulate_signal,refer_signal,modul_signal];
end   
Modulate_signal=single(Modulate_signal);
