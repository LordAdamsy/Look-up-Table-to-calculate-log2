clc;close all;clear;

%初始化参数
P = 0:2^12-1;
x = P*2^(-12);
A = floor(P/2^8)*2^(-4);
B = mod(floor(P/2^4), 2^4)*2^(-8);
C = mod(P,2^4)*2^(-12);
log = log2(1+x);

%进行计算, log2(1+c)+log2(1+A+B)
rom_1 = floor((log2(1+C)-C)*2^12);
rom_2 = floor((log2(1+A+B)-A-B)*2^12);
result_1 = rom_1 + rom_2 + (A + B + C)*2^12;

figure
plot(x, log2(abs(log-result_1*2^(-12))));
title('对数误差曲线');
xlabel('x');
ylabel('log2(abs_error)');
figure
plot(x, log);
hold on;
plot(x, result_1*2^(-12));
title('理想对数函数与查表曲线图');
xlabel('x');
ylabel('y');

%进行计算, log2(1+c/(1+A+B))+log2(1+A+B)
rom_1 = floor((log2(1+C./(1+A+B)))*2^12);
rom_2 = floor((log2(1+A+B)-A-B)*2^12);
result_1 = rom_1 + rom_2 + (A + B)*2^12;

figure
plot(x, log2(abs(log-result_1*2^(-12))));
title('对数误差曲线');
xlabel('x');
ylabel('log2(abs_error)');
figure
plot(x, log);
hold on;
plot(x, result_1*2^(-12));
title('理想对数函数与查表曲线图');
xlabel('x');
ylabel('y');

