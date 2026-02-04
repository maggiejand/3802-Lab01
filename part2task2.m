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
E = 69.5 * (10^9); %GPa
I = 0.000002475; % m^4

%Finding and taking the mean value for each of the reaction forces when
%there is the full load
imaxFirst = find(P==50, 1, "first"); % first time 50 shows up
imaxLast = find(P==50, 1, "last"); 

P  = mean(P(imaxFirst:imaxLast)) * 4.44822; %average and converting to newtons

F0 = mean(F0(imaxFirst:imaxLast))* 4.44822;  %average and converting to newtons
F1 = mean(F1(imaxFirst:imaxLast))* 4.44822;  %average and converting to newtons
F2 = mean(F2(imaxFirst:imaxLast))* 4.44822; %average and converting to newtons
F3d = mean(F3d(imaxFirst:imaxLast)); %average and converting to newtons
LVDT = mean(LVDT(imaxFirst:imaxLast)) * 25.4; %to mm

%Plugging in equation

x_p = (F2) / (F0 + F1 + F2);

x_pl = (F2 * L) / (F0 + F1 + F2);
answer1 = ['The load is at ' , num2str(x_p), 'L or ', num2str(x_pl), ' meters from the leftmost support'];
disp(answer1);



%Comparison of deflection
deflection = ((P * x_pl) / (E * I)) * (((x_pl^2) / 12) - ((L^2) / 16));
deflection = abs(deflection * 1000); %from m to mm


answer2 = ['The deflection according to our derived beam model is ' , num2str(deflection), 'mm and the deflection from the LVDT is ', num2str(LVDT), ' mm.'];
disp(answer2);


%Comparison of internal stress at mid span

%zeroing out the relative internal force 

F3d = F3d - data2(1,5);
c = 0.125; %m
A = 0.00003958; %m^2

moment = P*x_pl/2; %N*m
calcForce = moment * c * A / I; % N
F3d = F3d * 4.448;

answer3 = ['The internal force at mid span according to our derived beam model is ' , num2str(calcForce), ' Newtons and the internal force measured by the loadcell is ', num2str(F3d), ' Newtons.'];
disp(answer3);
