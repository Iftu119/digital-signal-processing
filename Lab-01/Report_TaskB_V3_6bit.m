%% Task B Step-7 for 6bit

%% Analog SIgnal 

f1=10;
f2=50;
f3=100;
nB=6; %No. of bits %CHANGED FROM PREVIOUS CODES
Level=2^nB;

N=2;
n1=0:0.0001:N-1;
y = sin(2*pi*f1*n1/N) + sin(2*pi*f2*n1/N) + sin(2*pi*f3*n1/N);
figure(1)
plot(n1,y);
hold on
title('Analog Signal')
hold off

%% Sampling 

fsD=2*f3;    % Sampling frequency fs=200Hz
n2=0:1/fsD:N-1;
ys = sin(2*pi*f1*n2) + sin(2*pi*f2*n2) + sin(2*pi*f3*n2);
figure(2)
stem(n2,ys);
title('Sampling Signal')
hold off

%% Quantization

step=(max(ys)-min(ys))/(Level-1) %We get 1 slot less than the level

for i=1:Level
    L(i)=min(ys)+ step*(i-1); %First L1, then L1+step , next L1+step*2, then L1+step*3
end

yq=ys;

%Level Assignment
for m=1:length(L)-1;
    p= yq>L(m) & yq<L(m+1) & abs(yq-L(m)) < abs (yq-L(m+1));
    yq(p)= L(m);
    
    p= yq>L(m) & yq<L(m+1) & abs(yq-L(m)) > abs (yq-L(m+1));
    yq(p)=L(m+1);
end

figure(3)
stem(n2,yq)
hold off

figure(3)
plot(n1,y,'r');
hold on
stem(n2,ys,'m');
hold on
stairs(n2,yq);
xlim([0 0.2])
legend ('Analog Signal','Sampling Signal', 'Quantized Signal');
title('Quantization of Analog Signal | 200Hz Sampling Frequency')
grid on

%% Determination of Power
Noise_Power = 20*log(step^2/12)

%% Determination of SQNR 

sA= meansqr(ys)/((step^2)/12); %NOT dB value
sqnrA=10*log10(sA)%dB Value
sqnrB=1.76+(6*nB) %dB Value

%% Reconstruct

figure (4)
subplot(221);
plot(n1,y,'r','Linewidth',2);
title ('Original Signal')
xlim([0 0.3])
hold on
subplot(222);
stem (n2,ys,'Linewidth',2)
title ('Sampled Signal')
xlim([0 0.3])
hold on
subplot(223);
stem (n2,yq,'Linewidth',2)
title ('Quantized Signal')
xlim([0 0.3])
hold on
yr=interp1(n2,yq,n2);
subplot(224);
plot(n2,yr,'r','Linewidth',2);
title ('Reconstructed Signal')
xlim([0 0.3])









