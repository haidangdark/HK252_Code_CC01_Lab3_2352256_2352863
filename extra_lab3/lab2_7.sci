n = -1:3;

x1 = [0 1 3 -2];
x2 = [0 1 2 3];

x1a = [0 x1];
x2a = [x2 0];

y = x1a .* x2a;

clf();

subplot(3,1,1);
plot2d3(n, x1a);
title("x1(n)");
xlabel("n"); ylabel("Am");
plot(n, x1a, 'r.')

subplot(3,1,2);
plot2d3(n, x2a);
title("x2(n)");
xlabel("n"); ylabel("Amp");
plot(n, x2a, 'g.')

subplot(3,1,3);
plot2d3(n, y);
title("y(n)");
xlabel("n"); ylabel("Amp");
plot(n, y, 'b.')
