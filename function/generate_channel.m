function [H, h] = generate_channel(para, BS_array, STAR_array)

epsilon = para.rician; % Rician factor

%% BS to STARS channel
% NLOS
H_NLOS = 1/sqrt(2) .* ( randn(para.N_STAR,para.M) + 1i*randn(para.N_STAR,para.M) );

% LOS
a_BR = steering_vector(BS_array, -para.BS_loc(2), -para.BS_loc(3));
a_RB = steering_vector(STAR_array, para.BS_loc(2), para.BS_loc(3));
H_LOS = a_RB*a_BR.';

% pathloss
path_loss = para.pathloss_indirect(para.BS_loc(1))';
path_loss = sqrt(10.^(- path_loss/10));
H = path_loss .* (sqrt(epsilon/(epsilon+1)) * H_LOS + sqrt(1/(epsilon+1)) * H_NLOS);


%% STAR-RIS to users channel
% NLOS
h_NLOS = 1/sqrt(2) .* ( randn(para.N_STAR,para.K) + 1i*randn(para.N_STAR,para.K) );

% LOS
h_LOS = zeros(para.N_STAR,para.K);
for k = 1:para.K
    h_LOS(:,k) = steering_vector(STAR_array, para.user_loc(k,2), para.user_loc(k,3));    
end

% pathloss
path_loss = para.pathloss_indirect(para.user_loc(:,1))';
path_loss = sqrt(10.^( (-para.noise_dB-path_loss)/10));
h = path_loss .* (sqrt(epsilon/(epsilon+1)) * h_LOS + sqrt(1/(epsilon+1)) * h_NLOS);
end