clear;
clc;
close all;

data2 = readmatrix("Case 2 data");
P = data2(:,1);
F0 = data2(:,2);
F1 = data2(:,3);
F2 = data2(:,4);
F3d = data2(:,5);
LVDT = data2(:,6);

L = 4; %Length of beam in meters

%Finding and taking the mean value for each of the reaction forces when
%there is the full load
imaxFirst = find(P==50, 1, "first"); % first time 50 shows up
imaxLast = find(P==50, 1, "last"); 

P  = mean(P(imaxFirst:imaxLast));

F0 = mean(F0(imaxFirst:imaxLast));  F1 = mean(F1(imaxFirst:imaxLast));  F2 = mean(F2(imaxFirst:imaxLast));

%Plugging in equation

x_p = (F2) / (F0 + F1 + F2);

x_pl = (F2 * L) / (F0 + F1 + F2);
answer = ['The load is at ' , num2str(x_p), 'L or ', num2str(x_pl), ' meters from the leftmost support'];
disp(answer);
