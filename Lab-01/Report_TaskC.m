%% Analog SIgnal 

f1=10;
f2=50;
f3=100;
nB=4; %No. of bits
Level=2^nB;

N=2;
n1=0:0.0001:N-1;
y = sin(2*pi*f1*n1/N) + sin(2*pi*f2*n1/N) + sin(2*pi*f3*n1/N);
figure(1)
subplot(311)
plot(n1,y);
hold on
title('Analog Signal')
hold off

%% Sampling 

fsD=2*f3;    % Sampling frequency fs=200Hz
n2=0:1/fsD:N-1;
ys = sin(2*pi*f1*n2) + sin(2*pi*f2*n2) + sin(2*pi*f3*n2)
figure(1)
subplot(312)
stem(n2,ys);
title('Sampling Signal')
hold off

%% Quantization

step=(max(ys)-min(ys))/(Level-1) %We get 1 slot less than the level

for i=1:Level
    L(i)=min(ys)+ step*(i-1); %First L1, then L1+step , next L1+step*2, then L1+step*3
end

yq=ys;

%% Level Assignment

for m=1:length(L)-1;
    p= yq>L(m) & yq<L(m+1) & abs(yq-L(m)) < abs (yq-L(m+1));
    yq(p)= L(m);
    
    p= yq>L(m) & yq<L(m+1) & abs(yq-L(m)) > abs (yq-L(m+1));
    yq(p)=L(m+1);
end

subplot(313)
stairs(n2,yq);
title('Quantized Signal')
hold off

%% Encoding 


for c=1:length(yq)
    yc(c)=round(yq(c)-min(yq))/step;
end

figure(2)
stairs(yc)
Z=unique(yc);
display (Z)
yEnc=dec2bin(yc);























