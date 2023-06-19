function control_allocation_coverage(invFunc)
%%
% Supply your inverse allocation function that take a tau vector (X,Y,N)
% and return the thruster forces vector (F1,...,F4).
% You can pass a function pointer by using @, e.g.,
% control_allocation_cov-Fnmaxerge(@MyInverseAllocationFunction).

% Parameters
B=[0.25, 0.25, -0.25, -0.25; -0.25,  0.25, -0.25,  0.25; -0.25, 0.25, 0.25, -0.25];
Fnmax=1;
Fnmin=-0.78;

% Calculate the grid values
Xrange = linspace(-1,1,101);
Yrange = linspace(-1,1,101);
tau_a_X = zeros(length(Xrange), length(Yrange));
tau_a_Y = zeros(length(Xrange), length(Yrange));

for i=1:length(Xrange)
    for j=1:length(Yrange)       
        % Use the supplied method to calculate thruster forces
        tau_r = [Xrange(i), Yrange(j), 0]';
        F = invFunc(tau_r);
        
        % Limit the thruster to practical max,min
        for k=1:length(F)
            if F(k) > Fnmax
                F(k) = Fnmax;
            elseif F(k) < Fnmin
                F(k) = Fnmin;
            end
        end
            
        % Calculate the tau vector from saturated forces on thrusters
        tau = B*F;

        % Take into account only well achieved tau
        dtau = abs(tau_r-tau);
        if dtau(1) < eps && dtau(2)<eps
            tau_a_X(i,j) = tau(1);
            tau_a_Y(i,j) = tau(2);
        else
            tau_a_X(i,j) = 0;
            tau_a_Y(i,j) = 0;
        end
    end
end

% Plot the phyisically achievable
XYmax = 0.5*Fnmax - 0.5*Fnmin;
xidl = [-XYmax,0,XYmax,0,-XYmax];
yidl = [0,XYmax,0,-XYmax,0];
figure;
hold on; 
grid on;
plot(xidl,yidl, 'r', 'LineWidth',2);

% Plot the achieved
xc = reshape(tau_a_X,length(Xrange)^2,1);
yc = reshape(tau_a_Y,length(Yrange)^2,1);
k = convhull(xc,yc);
plot(xc(k), yc(k), '-k', 'LineWidth',2);
% The Achieved data points
plot(xc,yc,'g.');
plot(xc(k), yc(k), '-k', 'LineWidth',2);

legend('Physically achievable', 'Achieved by control allocation');

end