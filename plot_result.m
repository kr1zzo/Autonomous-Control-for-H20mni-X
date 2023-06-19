x = 0;
y = 0;

Ts1 = 5;
wn1 = 4/Ts1;
K_av = [0;0;0];
K_av2 = [0,0,0];

%%
Kp_pose = wn1.* (Kd_pose+1)

w_n = wn1*6

Ki_vel = alpha.* w_n.^2

Kp_vel = Ki_vel * (2*zeta)./w_n - beta

Kp_vel = Kp_vel

%%

figure(1);
hold on;
yaw = pi/2;
out = sim('main');
data1 = out.yaw_plot;
plot(data1)
hold on;

yaw = pi/3;
out = sim('main');
data2 = out.yaw_plot;
plot(data2)
hold on;

yaw = pi/4;
out = sim('main');
data3 = out.yaw_plot;
plot(data3)
hold on;

yaw = pi;
out = sim('main');
data4 = out.yaw_plot;
data4.Data(data4.Data < 0) = data4.Data(data4.Data < 0) + 180;
plot(data4)
hold on;
legend("ψ=pi/2", "ψ=pi/3", "ψ=pi/4", "ψ=pi")
title("Yaw reposnses for referential yaw values, Ts=5")
grid on;
hold on;

%%
Ts1 = 3;
wn1 = 4/Ts1;

%%
Kp_pose = wn1.* (Kd_pose+1)

w_n = wn1*6

Ki_vel = alpha.* w_n.^2

Kp_vel = Ki_vel * (2*zeta)./w_n - beta

Kp_vel = Kp_vel
%%

figure(2);
hold on;
yaw = pi/2;
out = sim('main');
data1 = out.yaw_plot;
plot(data1)
hold on;

yaw = pi/3;
out = sim('main');
data2 = out.yaw_plot;
plot(data2)
hold on;

yaw = pi/4;
out = sim('main');
data3 = out.yaw_plot;
plot(data3)
hold on;

yaw = pi;
out = sim('main');
data4 = out.yaw_plot;
plot(data4)
hold on;
legend("ψ=pi/2", "ψ=pi/3", "ψ=pi/4", "ψ=pi")
title("Yaw reposnses for referential yaw values, Ts=3")
grid on;
hold off;

%%
%%
K_av2 = Kp_pose./Kd_pose
%%

K_av = Ki_vel./Kp_vel
figure(3);
hold on;
yaw = pi/2;
out = sim('main');
data1 = out.yaw_plot;
plot(data1)
hold on;

yaw = pi/3;
out = sim('main');
data2 = out.yaw_plot;
plot(data2)
hold on;

yaw = pi/4;
out = sim('main');
data3 = out.yaw_plot;
plot(data3)
hold on;

yaw = pi;
out = sim('main');
data4 = out.yaw_plot;
plot(data4)
hold on;
legend("ψ=pi/2", "ψ=pi/3", "ψ=pi/4", "ψ=pi")
title("Yaw reposnses for referential yaw values, Ts=3, anti-windup")
grid on;
hold off;