clc
clear all;
close all;

%% Analog Signal Generation

t=0:0.001:0.2;
f=10;
A=1;
x=A*sin(2*pi*f*t);
figure(1)

subplot(511)
plot(t,x,'r','Linewidth',2);
title('Analog signal (10Hz)')
grid on

%% Sampling Signal with 20Hz Sampling frequency

fs20=2*f;            % Sampling frequency fs=20Hz
ts20=0:1/fs20:0.2;
xs20=A*sin(2*pi*f*ts20);

figure(2)
%figure(1)
subplot();
stem(ts20,xs20,'Linewidth',2);
title('Sampling signal (20Hz)')
hold on
plot(t,x,'r--','Linewidth',0.5);
grid on

%% Interpolation
% figure (3)
% ti20=0:1/200:0.2;    % Interpolate values for every 1/200 second
% xi20=interp1(ts20,xs20,ti20,'spline')
% stem(ts20,xs20);
% hold on
% plot(ti20,xi20);
% title('Sampling signal (20Hz) | Interpolate by 0.005 s')
% grid on

%% Interpolation 1/20
figure (3)
ti20=0:1/20:0.2;    % Interpolate values for every 1/20 second
xi20=interp1(ts20,xs20,ti20,'spline')
stem(ts20,xs20);
hold on
subplot(512)
plot(ti20,xi20);
title('Sampling signal (20Hz) | Interpolate by 1/20 s')
grid on

%% Sampling Signal with 50Hz Sampling frequency

fs50=5*f;            % Sampling frequency fs=50Hz
ts50=0:1/fs50:0.2;
xs50=A*sin(2*pi*f*ts50);
ti50=0:1/fs50:0.2; % Interpolate at the sampling frequency
xi50=interp1(ts50,xs50,ti50,'spline')
figure(1)
plot(513);
stem(ts50,xs50);
hold on
plot(ti50,xi50);
title('Sampling signal (50Hz)')
grid on

%% Sampling Signal with 100Hz Sampling frequency

fs100=10*f;            % Sampling frequency fs=100Hz
ts100=0:1/fs100:0.2;
xs100=A*sin(2*pi*f*ts100);
ti100=0:1/500:0.2;
xi100=interp1(ts100,xs100,ti100,'spline')
figure(1)
plot(514);
stem(ts100,xs100);
hold on
plot(ti100,xi100);
title('Sampling signal (100Hz)')
grid on

%% Sampling Signal with 10Hz Sampling frequency

fs10=f;            % Sampling frequency fs=10Hz
ts10=0:1/fs10:0.2;
xs10=A*sin(2*pi*f*ts10);
ti10=0:1/fs10:0.2;
xi10=interp1(ts10,xs10,ti10,'spline')
figure(1)
subplot(515);
stem(ts10,xs10);
hold on
plot(ti10,xi10);
title('Sampling signal (10Hz)')
grid on

%% Comparison with Original Signal

figure(3)

subplot(221);
stem(ts20,xs20);
hold on
plot(ts20,xi20,'Linewidth',2);
hold on
plot(t,x,'r--','Linewidth',0.5)
title('Sampling signal (20Hz)')
grid on

subplot(222);
stem(ts50,xs50);
hold on
plot(ts50,xi50,'Linewidth',2);
hold on
plot(t,x,'r--','Linewidth',0.5)
title('Sampling signal (50Hz)')
grid on

subplot(223);
stem(ts100,xs100);
hold on
plot(ts100,xi100,'Linewidth',2);
hold on
plot(t,x,'r--','Linewidth',0.5)
title('Sampling signal (100Hz)')
grid on

subplot(224);
stem(ts10,xs10);
hold on
plot(ts10,xi10,'Linewidth',2);
hold on
plot(t,x,'r--','Linewidth',0.5)
title('Sampling signal (10Hz)')
grid on

%% Sampling Frequency Verification

f1=10;
f2=50;
f3=100;
t=0:0.001:0.2
y = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);
figure(4)
subplot(311)
plot(t,y)
title('Given Signal')
grid on


fsD=2*f3;            % Sampling frequency fs=200Hz
tsD=0:1/fsD:0.2;
ysD = sin(2*pi*f1*tsD) + sin(2*pi*f2*tsD) + sin(2*pi*f3*tsD);
tiD=0:1/fsD:0.2;
yiD=interp1(tsD,ysD,tiD,'spline')
figure(4)
subplot(312);
stem(tsD,ysD);
title('Sampling signal (200Hz)')
grid on
subplot(313)
stem(tsD,ysD);
hold on
plot(tiD,yiD);
title('Interpolated signal (200Hz)')
grid on
ylim([-3 3])

%% Test Case with 50Hz

f1=10;
f2=50;
f3=100;
t=0:0.001:0.2
y = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);
figure(4)
subplot(311)
plot(t,y)
title('Given Signal')
grid on


fsD=50;            % Sampling frequency fs=50Hz
tsD=0:1/fsD:0.2;
ysD = sin(2*pi*f1*tsD) + sin(2*pi*f2*tsD) + sin(2*pi*f3*tsD);
tiD=0:1/fsD:0.2;
yiD=interp1(tsD,ysD,tiD,'spline')
figure(4)
subplot(312);
stem(tsD,ysD);
title('Sampling signal (50Hz)')
grid on
subplot(313)
stem(tsD,ysD);
hold on
plot(tiD,yiD);
title('Interpolated signal (50Hz)')
grid on
xlim([0 0.1])

%% Test Case with 1000Hz

f1=10;
f2=50;
f3=100;
t=0:0.001:0.2
y = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);
figure(4)
subplot(211)
plot(t,y)


fsD=1000;            % Sampling frequency fs=1000Hz
tsD=0:1/fsD:0.2;
ysD = sin(2*pi*f1*tsD) + sin(2*pi*f2*tsD) + sin(2*pi*f3*tsD);
tiD = 0:1/10000:0.2
yiD=interp1(tsD,ysD,tiD,'spline')
figure(4)
subplot(212);
stem(tsD,ysD);
hold on
plot(tiD,yiD);
title('Sampling signal (100Hz)')
grid on

%% Test Case with 50Hz

f1=10;
f2=50;
f3=100;
t=0:0.001:0.2
y = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);
figure(4)
subplot(311)
plot(t,y)
title('Given Signal')
grid on


fsD=1000;            % Sampling frequency fs=1KHz
tsD=0:1/fsD:0.2;
ysD = sin(2*pi*f1*tsD) + sin(2*pi*f2*tsD) + sin(2*pi*f3*tsD);
tiD=0:1/fsD:0.2;
yiD=interp1(tsD,ysD,tiD,'spline')
figure(4)
subplot(312);
stem(tsD,ysD);
title('Sampling signal (1KHz)')
grid on
subplot(313)
stem(tsD,ysD);
hold on
plot(tiD,yiD);
title('Interpolated signal (1KHz)')
grid on
xlim([0 0.1])
