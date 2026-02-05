%Part 2, Task 3

clear;
clc;
close all;

%Read in data from the Case 3 data file

data3 = readmatrix("Case 3 data");
P = data3(:,1);
F0 = data3(:,2);
F1 = data3(:,3);
F2 = data3(:,4);
F3d = data3(:,5);
LVDT = data3(:,6);

%Define beam parameters:

L = 4; %Length of beam in meters
E = 69.5 * (10^9); %GPa
I = 0.000002475; % m^4

%Finding and taking the mean value for each of the reaction forces when there is the full load
imaxFirst = find(P==60, 1, "first"); % first time 60 shows up
imaxLast = find(P==60, 1, "last"); 

F3d = F3d - data3(1,5);

P  = mean(P(imaxFirst:imaxLast)) * 4.44822; %average and converting to newtons

F0 = mean(F0(imaxFirst:imaxLast))* 4.44822;  %average and converting to newtons
F1 = mean(F1(imaxFirst:imaxLast))* 4.44822;  %average and converting to newtons
F2 = mean(F2(imaxFirst:imaxLast))* 4.44822; %average and converting to newtons
F3d = mean(F3d(imaxFirst:imaxLast))* 4.448; %average and converting to newtons
LVDT = mean(LVDT(imaxFirst:imaxLast)) * 25.4; %converting to mm

A = 0.00003958; %m^2
c = 0.125; %m

%Solving for inline stress

sigma = F3d/A;

%Solving for a

a = (I*sigma)/(P*c);

answer1 = ['The first load is ' , num2str(a),' meters from the leftmost support and the second load is ', num2str(a),' meters from the right support.'];
disp(answer1);

%Comparison of deflection
deflection = ((P * a*2) / (E * I)) * (((a^2) / 12) - ((L^2) / 16));
deflection = abs(deflection * 1000); %convert from m to mm


answer2 = ['The deflection according to our derived beam model is ' , num2str(deflection), 'mm and the deflection from the LVDT is ', num2str(LVDT), ' mm.'];
disp(answer2);

%Comparison of internal stress at mid span
%Calculating force given our value for a

calcForce = (A*P*a*c)/I;

answer3 = ['The internal force at mid span according to our derived beam model is ' , num2str(calcForce), ' Newtons and the internal force measured by the loadcell is ', num2str(F3d), ' Newtons.'];
disp(answer3);
