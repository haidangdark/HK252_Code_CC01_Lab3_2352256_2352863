n = -1:1;
x = [1 3 -2];

x_fold = x($:-1:1);
xe = 0.5 * (x + x_fold);
xo = 0.5 * (x - x_fold);

clf();

subplot(3,1,1);
plot2d3(n, x);
title("x(n)");
xlabel("n"); ylabel("Amp"); 
plot(n, x, 'r.')

subplot(3,1,2);
plot2d3(n, xe);
title("xe(n)");
xlabel("n"); ylabel("Amp");
plot(n, xe, 'g.')

subplot(3,1,3);
plot2d3(n, xo);
title("xo(n)");
xlabel("n"); ylabel("Amp"); 
plot(n, xo, 'b.')
