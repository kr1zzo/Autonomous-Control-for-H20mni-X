% Pomorska robotika 2022./2023.

% Skripta za regulaciju pojačanja regulatora

%% 
x = 0;
y = 0;
yaw = pi/2;


%% 

alpha = [2.1,2.1,0.4]'
beta = [1,1,0.24]'
%alpha = [0.4,0.4,0.1]'
%beta = [0.4,0.4,0.1]'


%% Yaw rate controler - kontrola brzine

%zahtjevi za max nadvišenje i vrijeme smirivanja
o_m = 0.05
Ts = 5

zeta = abs(log(o_m))/sqrt(pi^2+log(o_m)^2)

w_n = pi/(Ts*sqrt(1-zeta^2))

Ki_vel = alpha * w_n^2
Kp_vel = Ki_vel * (2*zeta)/w_n - beta

Kp_vel = Kp_vel

K_av = Ki_vel./Kp_vel


%% 
wn1 = w_n /4;


Kd_pose_x = 1
Kd_pose_y = 1
Kd_pose_yaw = 0.33

Kd_pose = [Kd_pose_x, Kd_pose_y, Kd_pose_yaw]'

Kp_pose = wn1* (Kd_pose+1)
sim("main.slx")

