% Set the text
str='01234 I wish I were an Oscar Meyer wiener 56789';
% Set bit interleaving output
bit_interleaving_output=text2bin(str); 
N=length(bit_interleaving_output);

M=100; % oversampling factor
mup=zeros(N*M,4);
for i=1:N/4
    mup(i,:)=bit_interleaving_output(
%{
% Transmitter
M=100;
mup=zeros(1,N*M);
mup(1:M:N*M)=m;
p=hamming(M);
x=filter(p,1,mup);
figure(1), plotspec(x,1/M)
t=1/M:1/M:length(x)/M;
fc=40;
c=cos(2*pi*fc*t);
r=c.*x;
%}

% 16APSK mapping
% IQ points in the constellation diagram 
R1 = [0.267+0.267i -0.267+0.267i -0.267-0.267i 0.267-0.267i];  
R2 = [1.095+0.293i 0.802+0.802i 0.293+1.095i -0.293+1.095i 
    -0.802+0.802i -1.095+0.293i -1.095-0.293i -0.802-0.802i 
    -0.293-1.095i 0.293-1.095i 0.802-0.802i 1.095-0.293i];  
xlength = length(bit_interleaving_output);  % Length of input values 
for  k=1:xlength 
    if  bit_interleaving_output(k,:) == [0 0 0 0]; 
        modulation(1,k)= R2(2); 
    elseif  bit_interleaving_output(k,:)== [0 0 0 1]; 
        modulation(1,k)= R2(11); 
    elseif  bit_interleaving_output(k,:)== [0 0 1 0]; 
        modulation(1,k) = R2(5); 
    elseif  bit_interleaving_output(k,:)== [0 0 1 1]; 
        modulation(1,k) = R2(8); 
    elseif  bit_interleaving_output(k,:)== [0 1 0 0]; 
        modulation(1,k) = R2(1); 
    elseif  bit_interleaving_output(k,:)== [0 1 0 1]; 
        modulation(1,k) = R2(12); 
    elseif  bit_interleaving_output(k,:)== [0 1 1 0]; 
        modulation(1,k) = R2(6); 
    elseif  bit_interleaving_output(k,:)== [0 1 1 1]; 
        modulation(1,k) = R2(7); 
    elseif  bit_interleaving_output(k,:)== [1 0 0 0]; 
        modulation(1,k) = R2(3); 
    elseif  bit_interleaving_output(k,:)== [1 0 0 1]; 
        modulation(1,k) = R2(10); 
    elseif  bit_interleaving_output(k,:)== [1 0 1 0]; 
        modulation(1,k) = R2(4); 
    elseif  bit_interleaving_output(k,:)== [1 0 1 1]; 
        modulation(1,k) = R2(9); 
    elseif  bit_interleaving_output(k,:)== [1 1 0 0]; 
        modulation(1,k) = R1(1); 
    elseif  bit_interleaving_output(k,:)== [1 1 0 1]; 
        modulation(1,k) = R1(4); 
    elseif  bit_interleaving_output(k,:)== [1 1 1 0]; 
        modulation(1,k) = R1(2); 
    elseif  bit_interleaving_output(k,:)== [1 1 1 1]; 
        modulation(1,k) = R1(3); 
    end
end
%{
% Receiver
c2=cos(2*pi*fc*t);
x2=r.*c2;
f1=50; fbe=[0 0.1 0.2 1];
damps=[1 1 0 0];
b=firpm(f1,fbe,damps);
x3=2*filter(b,1,x2);

y=filter(fliplr(p)/(pow(p)*M),1,x3);

z=y(0.5*f1+M:M:N*M);

figure(2), plot([1:length(z)],z,'*')

mprime=quantalph(z,[-3,-1,1,3])';
cvar=(mprime-z)*(mprime-z)'/length(mprime)
lmp=length(mprime);
pererr=100*sum(abs(sign(mprime-m(1:lmp))))/lmp

reconstructed_message=pam2letters(mprime)
%}
