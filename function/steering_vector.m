function [a] = steering_vector(array, theta, phi)

a = exp(-1i*array*K(theta,phi));
end

%% Wavenumber vector
function k = K(theta,phi)
k = pi * [cos(theta).*cos(phi), sin(theta).*cos(phi), sin(phi)]';
end

