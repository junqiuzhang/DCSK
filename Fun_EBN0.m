function Output=Fun_EBN0(Input,Num_bit,Eb_N0)%输入信号，码元数量，Eb/N0
Num=length(Input);
EbN0=10^(Eb_N0/10);
%Esampler=sum(Input.^2)/Num_bit/2;
Esampler=norm(Input).^2/Num_bit/2;
sigma=sqrt(Esampler/EbN0);
awgn_all=sigma*randn(1,length(Input));
Output=awgn_all+Input;
