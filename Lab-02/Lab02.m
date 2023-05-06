%% Lab 02 : CONV CORR

clc
clear all
close all

%% Getiing Time Shifted Impulse

n1=-5;
n2=5;
n = n1:n2;
k = 2;
x1= (n-k)==0; %zekhane n-k=0 ache, shekhanei TRUE(=1) , onnoshomoy FALSE(=0)
figure(1)
stem(n,x1)
title('Time Shifted Impulse')

%% Getiing Time Shifted Unit Step

n1=-5;
n2=5;
n =n1:n2;
k =-1;
x2= [(n-k)>=0]; %zekhane n-k>=0 ache, shekhanei TRUE(=1) , onnoshomoy FALSE(=0)
figure(2)
stem(n,x2)
title('Time Shifted Unit Step')

%% Getiing Time Shifted Ramp

n1=-5;
n2=5;
n =n1:n2;
x31=n; % y=x Eta dile Ramp ashbe tobe negative side eo. Amader only positive side e lagbe 
figure(3)
stem(n,x31)
title('Time Shifted Ramp (Both side)')

% getting the epositive side only
% x2 te positive niye neya hoise oivabe neya zabe

start = 0; %POINT OF SHIFTING
x321= [(n-start)>=0];
r=x321.*n
figure(4)
stem(n,r)
title('Time Shifted Ramp (Positive side)')

%% Convolution

x1 = [4 5 -2 3 7 4 5]
n1 = [-2:4]

x2 = [6 0 -3 4 2]
n2=[-2:2]

Kmin=n1(1)+n2(1);
Kmax=n1(end)+n2(end);
k=Kmin:Kmax;

figure(5)
y=conv(x1,x2)
stem(k,y)

figure(6)
subplot(311)
plot(n1,x1)
subplot(312)
plot(n2,x2)
subplot(313)
plot(k,y)
xlim([-5 6])
ylim([-15 100])

%% Lab Ex. C.1

%{
y(n) + 0.6y(n-1)= x(n)
Use MATLAB to find impulse response, step response and sinusoidal response for
x(n)=0.5sin(n)u(n) in the range -10?n?20. Verify the result using conv() function for step
and sinusoidal responses 
%}

a=[1 0.6];  %denominator
b=[1 0 ]; %numerator
n1=-10;
n2=20;
n=n1:n2;
x_i=[n==0]; %if n==0, x=1 ; otherwise x=0 . IMPULSE
x_s=[n>0]; %if n>0, x=1 ; otherwise x=0 . STEP

u=[n>0]; %Unit step
x_sin= 0.5*sin(n).*u %given signal
y_i=filter(b,a,x_i);
y_s=filter(b,a,x_s);
y_sin=filter(b,a,x_sin);

figure(7)
plot(n,y_i,'Linewidth',2)
title('Impulse Response for the given System','fontweight','bold','fontsize',12);
grid on

figure(8)
plot(n,y_s,'Linewidth',2)
title('Step Response Response for the given System','fontweight','bold','fontsize',12);
grid on

figure(9)
plot(n,y_sin,'Linewidth',2)
title('Sinusoidal Response for the given System','fontweight','bold','fontsize',12);
grid on

figure(90)
subplot(131)
stem(n,y_i,'Linewidth',1)
title('Impulse','fontweight','bold','fontsize',12);
subplot(132)
stem(n,y_s,'Linewidth',1)
title('Step','fontweight','bold','fontsize',12);
subplot(133)
stem(n,y_sin,'Linewidth',1)
title('Sinusoid','fontweight','bold','fontsize',12);

%Verification of the result using conv() function for step and sinusoidal

y_v1=conv( y_sin, y_s)

figure(10)
plot(y_v1,'Linewidth',2)
title('Sinusoidal and Step Response Convoluted','fontweight','bold','fontsize',12);
grid on
xlim([15 70])

%% Lab Ex. C.2

a=[1 0.6]; 
b=[1 0 1]; 
n1=-10;
n2=20;
n=n1:n2;
k=0;

%Superposition Analogy

x0= [n>0]
x2= [(n-2)>0]
y1= [(n-1)>0]
yA = x0+ x2 - (0.6*y1)

figure(11)
subplot(212)
plot(yA)
subplot(211)
stem(yA)
title('Plotted Values by Superposition', 'fontweight','bold','fontsize',12);
grid on

%Filter

%x_i=[n==0]; %if n==0, x=1 ; otherwise x=0 . IMPULSE
x_s=[n>0]; %if n==0, x=1 ; otherwise x=0 . STEP

%u=[n>0]; %Unit step
%x_sin= 0.5*sin(n).*u %given signal
%y_i=filter(b,a,x_i);
y_s=filter(b,a,x_s);
%y_sin=filter(b,a,x_sin);

figure(13)
stem(n,y_s,'Linewidth',2)
ylim ([-0.6 2])
title('Step Signal Response', 'fontweight','bold','fontsize',12);
grid on


%{

figure(112)
stem(n,y_i,'Linewidth',2)
ylim ([-1 2])
grid on
title('Impulse Signal Response', 'fontweight','bold','fontsize',12);
grid on

figure(14)
stem(n,y_sin,'Linewidth',2)
ylim ([-0.6 0.6])
title('Sinusoid Response', 'fontweight','bold','fontsize',12);
grid on
%}

%% Correlation

x = [3,11,7,0,-1,4,2]
nx = -3:3
k=2;

y=x;
ny=nx+k;
x=fliplr(x)

rxy = conv(x,nx)
nxy = conv(y,ny);
figure(15)
stem(nxy,rxy/max(rxy))

%% Lab Ex. D.1

%{
a) Determine the ACF of a sine wave sin(wot) analytically.(Homework)
b) Take period, T=2ms, tstep as T/100.
1. Take t=tstep:tstep:T ;
Find ACF for x=2*sin(2*pi*t/T).
2. Repeat 1 for t=tstep:tstep:3*T
Explain for (b.2) why ACF magnitude decreases for successive periods? What happens if we
set t(end)=5T , 10T etc.?
%}

%% Segment-A

m=-5*pi:0.001:5*pi
subplot(211)
plot (sin(m),'Linewidth',2)
title('Given Sinusoid', 'fontweight','bold','fontsize',12);
grid on

y=xcorr(sin(m),sin(m))
subplot(212)
plot(y,'Linewidth',2)
title('Autocorrelation', 'fontweight','bold','fontsize',12);
grid on

%% Segment-B.1

T=0.002 ;
tstep = T/100 ;
t=tstep:tstep:T ;

x=2*sin(2*pi*t/T)

figure(16)
subplot(211)
plot (x,'Linewidth',2)
title('Given Signal','fontweight','bold','fontsize',12);

y=xcorr(x,x)
subplot(212)
plot (y,'Linewidth',2)
title('Auto-Correlation','fontweight','bold','fontsize',12);

%% B.2

T=0.002 ;
tstep = T/100 ;
t=tstep:tstep:3*T

x=2*sin(2*pi*t/T)

figure(17)
subplot(211)
plot (x,'Linewidth',2)
title('Given Signal','fontweight','bold','fontsize',12);

y=xcorr(x,x)
subplot(212)
plot (y,'Linewidth',2)
title('Auto-Correlation (until 3*T)','fontweight','bold','fontsize',12);

%% Testing with end at 5*T

T=0.002 ;
tstep = T/100 ;
t=tstep:tstep:5*T

x=2*sin(2*pi*t/T)

figure(18)
subplot(211)
plot (x,'Linewidth',2)
title('Given Signal','fontweight','bold','fontsize',12);

y=xcorr(x,x)
subplot(212)
plot (y,'Linewidth',2)
title('Auto-Correlation (until 5*T)','fontweight','bold','fontsize',12);

%% Testing with end at 10*T

T=0.002 ;
tstep = T/100 ;
t=tstep:tstep:10*T

x=2*sin(2*pi*t/T)

figure(19)
subplot(211)
plot (x,'Linewidth',2)
title('Given Signal','fontweight','bold','fontsize',12);

y=xcorr(x,x)
subplot(212)
plot (y,'Linewidth',2)
title('Auto-Correlation (until 10*T)','fontweight','bold','fontsize',12);

%% Segment-C 
%White Noise Correlation

A=2;
sample=20;
x=A+randn(sample,1);

figure(20)
subplot(211)
plot(x,'Linewidth',2)
title('Signal Mixed with Noise', 'fontweight','bold','fontsize',12);
grid on

y=xcorr(x,x)
%figure(21)
subplot(212)
plot(y,'Linewidth',2)
title('Signal extracted by Correlation', 'fontweight','bold','fontsize',12);
grid on

%% End of Exercise

%% Problem-1

x= [0,1,1,3,5,7,2,0];
nx= -2:5;

y= [0,5,5,5,3,3,1,1,0];
ny= -6:2;

A=2;
sample=10;
noise=A+randn(sample,1);
R=xcorr(x,y)

figure(22)
subplot(311)
plot(x,'Linewidth',2)
title('Signal-1', 'fontweight','bold','fontsize',12);
grid on

subplot(312)
plot(y,'Linewidth',2)
title('Signal-2', 'fontweight','bold','fontsize',12);
grid on

subplot(313)
plot(R,'Linewidth',2)
title('Correlated Signal', 'fontweight','bold','fontsize',12);
grid on

%% Problem-2
%  Detection of signals in noise by auto-correlation

T=0.002 ;
tstep = T/100 ;
t=tstep:tstep:T ;

x_t=10*sin(2*pi*t/T) %Transmitted
x_r=10*sin(2*pi*t/T) %received
noise = awgn(x_t,.5,'measured');

figure(223)
subplot(221)
plot (x_t,'Linewidth',2)
title('Given Signal','fontweight','bold','fontsize',12);

subplot(222)
plot (noise,'Linewidth',2)
title('Noise','fontweight','bold','fontsize',12);

y=x_t+noise
subplot(223)
plot(y,'Linewidth',2)
title('Noise Mixed Signal','fontweight','bold','fontsize',12);

y_c= xcorr(x_t,y)
subplot(224)
plot(y_c,'Linewidth',2)
title('Recovered','fontweight','bold','fontsize',12);


%% Problem-3


%{
Let in the transmitter, to transmit zero (0) we send x0(n) for 0 ? n ? L-1 and to transmit
one (1) we send x1(n) for 0 ? n ? L-1 where x1(n) = - x0(n). The signal received by the
receiver
y(n) = xi(n) + w(n) i = 0,1 and 0 ? n ?L-1 (14)
w(n) is additive white noise.
Present a technique to detect the sequence transmitted from y(n).Assume that
particular receiver knows x0(n) and x1(n).Write a general MATLAB program for this
purpose.
%}

% Detection of a transmitted sequence

L=3;
x = [(n<=L-1)]

T=0.002 ;
tstep = T/100 ;
t=tstep:tstep:T ;
x_t=10*sin(2*pi*t/T) ; %Transmitted
noise = awgn(x_t,0.5,'measured') ;

y=1+noise

figure(26)
subplot(311)
plot(x_t,'Linewidth',2)
title('Transmitted Sequence','fontweight','bold','fontsize',12);


subplot(312)
stem(noise)
hold on
plot(y,'r')
title('Noise','fontweight','bold','fontsize',12);

%Correlation
y_r=xcorr(x_t,y)
%figure(27)
subplot(313)
plot(y_r,'Linewidth',2)
xlim ([0 100])
title('Recovered Transmitted Sequence','fontweight','bold','fontsize',12);


