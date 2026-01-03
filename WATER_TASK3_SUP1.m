

simOut   = sim('WATER_TASK3_MAIN');

% Retrieving deterministic [H+] (pH_true)
H_true   = simOut.get('pH_true');     % actually [H+]
Ts       = 0.5;
t        = (0:Ts:(length(H_true)-1)*Ts)';

% Converting to pH scale
pH_true  = -log10(H_true);

% Retrieving sensor lag output
if ismember('pH_sensor', simOut.who)
    H_sensor = simOut.get('pH_sensor');
    pH_sensor = -log10(H_sensor);
else
    warning('Variable pH_sensor not found in model output.');
    pH_sensor = nan(size(pH_true));
end

% Retrieving measured output (with drift + noise)
if ismember('pH_measured', simOut.who)
    H_measured = simOut.get('pH_measured');
    pH_measured = -log10(H_measured);
else
    warning('Variable pH_measured not found in model output.');
    pH_measured = nan(size(pH_true));
end

% Plotting all three traces 
figure('Color','w');
plot(t, pH_true, 'b-', 'LineWidth', 1.5); hold on;
plot(t, pH_sensor, 'r--', 'LineWidth', 1.2);
plot(t, pH_measured, 'k:', 'LineWidth', 1.2);
xlabel('Time (s)');
ylabel('pH');
title('Dynamic Step Response');
legend('Deterministic','Sensor Lag','Measured (Lag + Drift + Noise)', ...
       'Location','best');
grid on;
ylim([0 14]);

