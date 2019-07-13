function Decode=Chaotic_demodulate(Bit_n,L,Receive_signal)

for i=1:Bit_n
    receive_refer_signal=Receive_signal((i-1)*2*L+1:(i-1)*2*L+L);
    receive_bit_signal=Receive_signal((i-1)*2*L+L+1:(i-1)*2*L+2*L);
    receive_refer_signal=reshape(receive_refer_signal,1,length(receive_refer_signal));
    receive_bit_signal=reshape(receive_bit_signal,length(receive_bit_signal),1);
    panjue(i)=receive_refer_signal*receive_bit_signal;
end
Decode=sign(panjue);