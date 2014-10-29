function bounding_box_plots(filename_object, bb_results)

[points] = import_shl(filename_object);



% best_points = load(bb_results);
% 
figure();
plot3(points(:,1), points(:,2), points(:,3),'*'); 
title('Original_objetc'); grid on
xlabel('x');  ylabel('y');  zlabel('z'); 

 T =[   0.781113    0.589467    0.205892  -0.0264067
  -0.571446    0.807779   -0.144713   0.0192473
  -0.251619 -0.00461886    0.967815   0.0449642
          0           0           0           1];
      
       


X =[-0.188466 -0.0668068 -0.0483791];
Y = [0.0955151 0.0666183 0.0515402];


plotOrientedIsobox(X, Y, T)


pointspca = (inv(T)*([points ones(size(points,1),1)].')).';

hold on
plot3(pointspca(:,1), pointspca(:,2), pointspca(:,3),'r*'); 


figure
data = points;
m = mean(data);
hold on;
plot3(m(1), m(2), m(3), 'r*')
data_m = data - repmat(m, length(data), 1);
m_m = mean(data_m);

%plot3(data_m(:,1), data_m(:,2), data_m(:,3),'g*')


N = size(data, 1);
covar = data_m'*data_m/N


[U,S,V] = svd(covar)
% 
% 
% 
% data_r = data_m*V; % rotated data
% 
% 
% plot3(data_r(:,1), data_r(:,2), data_r(:,3), 'm*');
% 
T2 = [V m.'; zeros(1,3) 1]
% data_recover = (T*([data_r ones(size(data_r,1),1)].')).';
% 
% plot3(data_recover(:,1), data_recover(:,2), data_recover(:,3), 'ro');
% 
% legend('Original Data','Translated Data','Translated and rotated data', 'Recovered data')

% plot3(data(:,1), data(:,2), data(:,3),'b*')
% plot3(m_m(1), m_m(2), m_m(3), 'r*')









% subplot(2,2,2); 
% plot(points(:,1), points(:,2), '*'); title('xy projection'); 
% grid on; hold on;
% plot(best_points(1,1), best_points(1,2), 'r*');
% 
% subplot(2,2,3); 
% plot(points(:,1), points(:,3), '*'); title('xz projection'); 
% grid on; hold on;
% plot(best_points(2,1), best_points(2,2), 'r*');
% 
% subplot(2,2,4); plot(points(:,2), points(:,3), '*'); title('yz projection'); 
% grid on; hold on;
% plot(best_points(3,1), best_points(3,2), 'r*');
% 
% subplot(2,2,1); hold on; 

%plot3isobox([best_points(4,1) best_points(4,2) best_points(4,3)],...
 %   [best_points(4,4) best_points(4,5) best_points(4,6)], 0, [1 0 0]);
            
%plot3isobox([best_points(5,1) best_points(5,2) best_points(5,3)],...
 %   [best_points(5,4) best_points(5,5) best_points(5,6)], 0, [1 0 0]);

% plot3isobox([best_points(6,1) best_points(6,2) best_points(6,3)],...
%     [best_points(6,4) best_points(6,5) best_points(6,6)], .5, [1 0 0]);

end





