function [BS_array, STAR_array] = generate_arrays(para)

BS_array = [(1:para.M)'-(para.M+1)/2, zeros(para.M,1), zeros(para.M,1)];

STAR_array = zeros(para.N_STAR, 3);
for i = 1:para.STAR_size(1)
    for  j = 1:para.STAR_size(2)
        n = (i-1)*para.STAR_size(2) + j;
        STAR_array(n,:) = [ i, 0, j ];
    end
end
STAR_array = STAR_array - [(para.STAR_size(1)+1)/2, 0, 0];

figure; hold on;
plot3(STAR_array(:,1),STAR_array(:,2),STAR_array(:,3),'sb','LineWidth',2,'MarkerSize',10);
title('Locations of Antennas');
grid on;
xlabel('x'); 
ylabel('y');
zlabel('z');
view(45,30);
end

