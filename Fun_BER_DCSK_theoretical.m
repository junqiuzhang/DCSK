%%误码率（固定函数）
function BER_DCSK=Fun_BER_DCSK_theoretical(L,Eb_N0)
EbN0_2=10.^(Eb_N0./10);
ERFC_DCSK=(1/(2*L)+4./(EbN0_2)+2*L./(EbN0_2).^2).^(-1/2);
BER_DCSK=0.5*erfc(ERFC_DCSK);

