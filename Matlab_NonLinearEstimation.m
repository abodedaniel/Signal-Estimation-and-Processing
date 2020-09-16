clear all
clc
close all
% PART 2

% Original Sine Wave Specifications
a1=1;                   % amplitude of sine wave 1
a2=1;                   % amplitude of sine wave 2
f0=0.3;                 % hertz
f1=0.2;                 % hertz
t=1:1:10^3;
   
% Sine Wave 1:
s1 = a1*sin(2*pi*f0.*t');

% Sine Wave 2
s2 = a2*sin(2*pi*f1.*t');

% Gaussian Process
mean=0;
sd=2;                   % standard deviation
N=10^3;
g = sd*randn(N,1);

y = s1 + s2 + g;

% Iteration Specifications
a1_J=1;
a2_J=0;
f0_J=0:0.01:0.5;        % variable f0
f1_J=0;

iter=length(f0_J);
J=[];
s1_sim=[];
s2_sim=[];

for i=1:iter;
    % Sine Wave 1 Sim
    s1_sim = a1_J*sin(2*pi*f0_J(i).*t');
    % Sine Wave 2 sim
    s2_sim = 0; % a2_J*sin(2*pi*f1_J.*t');
    % Criterion
    J(i) = sum((y - s1_sim - s2_sim).^2);
end

plot(f0_J,J')