clc
clear all
close all

%% Problem Statement
% With Given details below, Plot only the Initial Value Response (State
% Vector)
%%
% 
% <<ProblemStatement.jpg>>
% 

%% Initial Value Response (State Vector Only) using EXPM function 
x_0 = [1 ; -1];
A = [0, 1; -5, -2]; 
B = [0; 1];
t = linspace(0, 10, 100); % Creating a linearly spaced vector of 100 elements between 0 to 10s
M = zeros(100,2); % Making a 100 by 2 matrix with all elements 0
for j = 1:2 
    for k = 1:100
        X = expm(A*t(k))*x_0;
        M(k,j) = X(j); % Inputing the 1st element of each X matrix in the 1st column of Matrix M followed by 2nd element of each X matric in the 2nd column of Matrix M  
    end
end

figure()
subplot(1,2,1)
plot(t,M(:,1),'b');
title(' \fontsize{11} Initial Value Response using expm function:');
grid on
ylabel('x_1(t)');
xlabel('time(s)');

subplot(1,2,2)
plot(t,M(:,2),'b');
grid on
ylabel('x_2(t)');
xlabel('time(s)');
%% Initial Value Response (State Vector Only) using LSIM function 
u = zeros(100,1); %Note: A, B, t and x_0 are defined in the EXPM code
C = eye(2);
D = zeros(2,1);
sys = ss(A,B,C,D);

[y,t] = lsim(sys,u,t,x_0);

subplot(1,2,1)
plot(t, y(:,1), 'r');
title(' \fontsize{11} Initial Value Response using lsim function:');
grid on
ylabel('x_1(t)');
xlabel('time(s)');

subplot(1,2,2)
plot(t, y(:,2), 'r');
grid on
ylabel('x_2(t)');
xlabel('time(s)');

