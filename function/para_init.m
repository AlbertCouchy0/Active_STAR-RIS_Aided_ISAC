function [values] = para_init()

values.noise_dB = -110; % noise power in dBm
values.noise = 10^(values.noise_dB/10); 

values.M = 10; % overall antennas
values.STAR_size = [5,2]; % reflecting elements at RIS
values.N_STAR = values.STAR_size(1)*values.STAR_size(2); % reflecting elements at RIS

values.Pt = 10^(30/10); % overall transmit power
values.n = 1; % equivalent noise power
values.K = 4; % user number
values.eta = 3;%target number
values.phi_m = 0; % desired direction
values.pathloss_indirect = @(d) 30 + 20*log10(d); % path loss with d in m
values.pathloss_direct =  @(d) 32.6 + 36.7*log10(d); % path loss with d in m

values.rician = 1; % rician factor
values.gamma = 10^(0/10);

values.STAR_loc = [0,0,0];
values.BS_loc = [30, 40, 0];

% user locations
range = [20, 50];
values.user_loc = zeros(values.K, 3);
for i = 1:values.K
    values.user_loc(i,:) = [ (range(2)-range(1))*rand(1) + range(1), -180*rand(1), 180*rand(1)-90 ];
end

% target locations
values.target_loc = zeros(values.eta, 3);
for i = 1:values.eta
    values.target_loc(i,:) = [ (range(2)-range(1))*rand(1) + range(1), 180*rand(1), 180*rand(1)-90 ];
end
end

