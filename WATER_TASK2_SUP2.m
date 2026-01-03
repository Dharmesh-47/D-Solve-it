%Simulation vs Experimental Dataset 
clc; clear; close all;

% 1. Define titrant volume data for Simulink 
V0     = 0.05;          % L
Vmax   = 0.05;          % L
Vstep  = 0.0005;        % L increment
Vadd   = (0:Vstep:Vmax)';     
time   = (0:length(Vadd)-1)'; 
Vadd_data = [time, Vadd];   % [time, volume] for From Workspace block
N = length(Vadd);

%  Push to base workspace (Simulink needs this)
assignin('base','Vadd_data',Vadd_data);
assignin('base','N',N);

% 2. Run Simulink model 
simOut = sim('WATER_TASK2_MAIN');   % run model
pH_out = simOut.get('pH_out');


V_sim = Vadd_data(:,2); 
pH_sim = pH_out(:,1);

%- 3. Experimental Dataset 
x_exp = [3.6,4.6,5.6,6.8,8.1,9.7,11.6,13.9,16.4,19.3,22.4,25.9,29.1,32.1,34.7,37.0,39.1,40.9,42.4,43.5,44.5,45.3,46.1];
pH_exp = [5.80,5.90,6.00,6.10,6.20,6.30,6.40,6.50,6.60,6.70,6.80,6.90,7.00,7.10,7.20,7.30,7.40,7.50,7.60,7.70,7.80,7.90,8.00];
V_exp = x_exp/1000; % mL→L

% 4. Interpolate simulation for experimental points 
pH_sim_interp = interp1(V_sim, pH_sim, V_exp, 'pchip');

% 5. Plot  
figure('Name','Simulation vs Dataset');
hold on; box on;
plot(V_sim*1000, pH_sim, '-', 'LineWidth',1.6, 'Color',[0 0.45 0.74]); % sim curve
plot(x_exp, pH_exp, 'o', 'MarkerSize',6, 'MarkerFaceColor','w', 'MarkerEdgeColor','k', 'LineWidth',1.2); % exp pts
xlabel('Volume of 0.1 M NaOH added (mL)');
ylabel('pH');
legend('Simulation','Experimental','Location','NorthWest');
title('pH vs NaOH added for phosphate titration');
grid on;
xlim([0 50]); ylim([5.5 8.2]);


