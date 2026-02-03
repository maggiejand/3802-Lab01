clear; 
clc;
close all;

% Analysis of Experimental Data

data_1 = load("Case 1 - load in center");
load_1 = data_1(2:52,1);
F0_1 = data_1(2:52,2);
F1_1 = data_1(2:52,3);
F2_1 = data_1(2:52,4);
F3D_1 = data_1(2:52,5);
LVDT_1 = data_1(2:52,6);


data_2 = load("Case 2 data.txt");
load_2 = data_2(2:52,1);
F0_2 = data_2(2:52,2);
F1_2 = data_2(2:52,3);
F2_2 = data_2(2:52,4);
F3D_2 = data_2(2:52,5);
LVDT_2 = data_2(2:52,6);

data_3 = load("Case 3 data.txt");
load_3 = data_3(2:52,1);
F0_3 = data_3(2:52,2);
F1_3 = data_3(2:52,3);
F2_3 = data_3(2:52,4);
F3D_3 = data_3(2:52,5);
LVDT_3 = data_3(2:52,6);

figure (1)
title("Applied Load Vs F0");
xlabel("Applied Load (lbs)")
ylabel("F0 (lbf)")
hold on;
scatter(load_1,F0_1,'filled','red','DisplayName','Case 1 Data');
F0_line_1 = polyfit(load_1,F0_1,1);
plot(load_1,polyval(F0_line_1,load_1),'red','DisplayName','Case 1');
scatter(load_2,F0_2,'filled','blue','DisplayName','Case 2 Data');
F0_line_2 = polyfit(load_2,F0_2,1);
plot(load_2,polyval(F0_line_2,load_2),'blue','DisplayName','Case 2');
scatter(load_3,F0_3,'filled','green','DisplayName','Case 3 Data');
F0_line_3 = polyfit(load_3,F0_3,1);
plot(load_3,polyval(F0_line_3,load_3),'green','DisplayName','Case 3');
legend('Location','northwest');
hold off;

figure (2)
title("Applied Load Vs F1");
xlabel("Applied Load (lbs)")
ylabel("F1 (lbf)")
hold on;
scatter(load_1,F1_1,'filled','red','DisplayName','Case 1 Data');
F1_line_1 = polyfit(load_1,F1_1,1);
plot(load_1,polyval(F1_line_1,load_1),'red','DisplayName','Case 1');
scatter(load_2,F1_2,'filled','blue','DisplayName','Case 2 Data');
F1_line_2 = polyfit(load_2,F1_2,1);
plot(load_2,polyval(F1_line_2,load_2),'blue','DisplayName','Case 2');
scatter(load_3,F1_3,'filled','green','DisplayName','Case 3 Data');
F1_line_3 = polyfit(load_3,F1_3,1);
plot(load_3,polyval(F1_line_3,load_3),'green','DisplayName','Case 3');
legend('Location','northwest');
hold off;

figure (3)
title("Applied Load Vs F2");
xlabel("Applied Load (lbs)")
ylabel("F2 (lbf)")
hold on;
scatter(load_1,F2_1,'filled','red','DisplayName','Case 1 Data');
F2_line_1 = polyfit(load_1,F2_1,1);
plot(load_1,polyval(F2_line_1,load_1),'red','DisplayName','Case 1');
scatter(load_2,F2_2,'filled','blue','DisplayName','Case 2 Data');
F2_line_2 = polyfit(load_2,F2_2,1);
plot(load_2,polyval(F2_line_2,load_2),'blue','DisplayName','Case 2');
scatter(load_3,F2_3,'filled','green','DisplayName','Case 3 Data');
F2_line_3 = polyfit(load_3,F2_3,1);
plot(load_3,polyval(F2_line_3,load_3),'green','DisplayName','Case 3');
legend('Location','northwest');
hold off;

figure (4)
title("Applied Load Vs F3D");
xlabel("Applied Load (lbs)")
ylabel("F3D (lbf)")
hold on;
scatter(load_1,F3D_1,'filled','red','DisplayName','Case 1 Data');
F3D_line_1 = polyfit(load_1,F3D_1,1);
plot(load_1,polyval(F3D_line_1,load_1),'red','DisplayName','Case 1');
scatter(load_2,F3D_2,'filled','blue','DisplayName','Case 2 Data');
F3D_line_2 = polyfit(load_2,F3D_2,1);
plot(load_2,polyval(F3D_line_2,load_2),'blue','DisplayName','Case 2');
scatter(load_3,F3D_3,'filled','green','DisplayName','Case 3 Data');
F3D_line_3 = polyfit(load_3,F3D_3,1);
plot(load_3,polyval(F3D_line_3,load_3),'green','DisplayName','Case 3');
legend('Location','northwest');
hold off;

figure (5)
title("Applied Load Vs LVDT");
xlabel("Applied Load (lbs)")
ylabel("LVDT (in)")
hold on;
scatter(load_1,LVDT_1,'filled','red','DisplayName','Case 1 Data');
LVDT_line_1 = polyfit(load_1,LVDT_1,1);
plot(load_1,polyval(LVDT_line_1,load_1),'red','DisplayName','Case 1');
scatter(load_2,LVDT_2,'filled','blue','DisplayName','Case 2 Data');
LVDT_line_2 = polyfit(load_2,LVDT_2,1);
plot(load_2,polyval(LVDT_line_2,load_2),'blue','DisplayName','Case 2');
scatter(load_3,LVDT_3,'filled','green','DisplayName','Case 3 Data');
LVDT_line_3 = polyfit(load_3,LVDT_3,1);
plot(load_3,polyval(LVDT_line_3,load_3),'green','DisplayName','Case 3');
legend('Location','northwest');
hold off;

R2_F0 = [
    compute_R2(load_1,F0_1);
    compute_R2(load_2,F0_2);
    compute_R2(load_3,F0_3)
];

R2_F1 = [
    compute_R2(load_1,F1_1);
    compute_R2(load_2,F1_2);
    compute_R2(load_3,F1_3)
];

R2_F2 = [
    compute_R2(load_1,F2_1);
    compute_R2(load_2,F2_2);
    compute_R2(load_3,F2_3)
];

R2_F3D = [
    compute_R2(load_1,F3D_1);
    compute_R2(load_2,F3D_2);
    compute_R2(load_3,F3D_3)
];

R2_LVDT = [
    compute_R2(load_1,LVDT_1);
    compute_R2(load_2,LVDT_2);
    compute_R2(load_3,LVDT_3)
];

Case = ["Case 1"; "Case 2"; "Case 3"];

R2_Table = table( ...
    Case, ...
    R2_F0, ...
    R2_F1, ...
    R2_F2, ...
    R2_F3D, ...
    R2_LVDT, ...
    'VariableNames',{'Case','F0','F1','F2','F3D','LVDT'});
disp(R2_Table)

function R2 = compute_R2(x,y)
    p = polyfit(x,y,1);
    y_fit = polyval(p,x);
    SS_res = sum((y - y_fit).^2);
    SS_tot = sum((y - mean(y)).^2);
    R2 = 1 - SS_res/SS_tot;
end
