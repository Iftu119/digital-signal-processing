clc
clear all;
close all;

% Part 01 : Analog Signal Generation

t=0:0.001:2;
f=1;
amp=5;
x=amp*sin(2*pi*f*t);
subplot(221);
plot(t,x);
title('Analog signal')
grid on

% Part 02 : Sampling Signal

fs=10*f;
ts=0:1/fs:2;
xs=amp*sin(2*pi*f*ts);
subplot(222);
stem(ts,xs);
title('Sampling signal')
grid on

% Part 03 : Quantizing the Signal

Nsamples=length(xs)     % No. of Samples taken
Nbit=3;                 % Given no. of bits
level=2^Nbit            % No of stages created within the Peak to Peak range
step=2*amp/level;       % Step=1.25  So Steps come at 5 > 3.75 > 2 > 0.5 > -1 > -2.5 > -3.75 > -5

% The levels require assigned values to quantize. The lowest level from -5 to -3.75 will get -4.375 (average) as assigned value. 
% Similarly other blocks/levels will get values incremented by step size
  
Lmin=-amp+step/2;       % Lmin = -4.375
Lmax=amp-step/2;        % Lmax =  4.375

for i=Lmin:step:Lmax    % -4.375 < -3.125 < -1.875 < -0.625 < 0.625 < 1.875 < 3.125 < 4.375 
    for j=1: Nsamples;  % All the samples need to be checked
    
        if (((i-step/2)<xs(j))&&(xs(j)<(i+step/2)))    %Filtered all the values lying within -5 to -3.75 i.e greater than -5 and less than -3.75
            
            qValue(j)=i % All the values lie within -5 to -3.75 have been assigned -4.375
          
            disp (qValue)
        end
    end
end
subplot(223);
stem(ts,qValue);
hold on
grid on
axis()
plot(ts,xs,'color','c') %Comparison with sampled signal
hold on
plot(t,x,'color','r') %Comparison with analog signal


