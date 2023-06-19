pwm = out.yout{1}.Values.Data;
force = out.yout{2}.Values.Data;
plot(pwm, force);
ylabel('Force output');
xlabel('PWM signal');

