n = -2:1;
x = [1 -2 3 6];

// Ví dụ manipulations thường gặp:

n1 = -1:2;
y1 = x($:-1:1);

n2 = n - 3;
y2 = x;

n3 = -3:0;
y3 = 2 * x($:-1:1);

clf();

subplot(2,2,1);
plot2d3(n, x);
title("x(n)");
xlabel("n"); ylabel("Amp"); 
plot(n, x, 'r.')

subplot(2,2,2);
plot2d3(n1, y1);
title("x(-n)");
xlabel("n"); ylabel("Amp");
plot(n1, y1, 'y.')

subplot(2,2,3);
plot2d3(n2, y2);
title("x(n+3)");
xlabel("n"); ylabel("Amp");
plot(n2, y2, 'g.')

subplot(2,2,4);
plot2d3(n3, y3);
title("2x(-n-2)");
xlabel("n"); ylabel("Amp"); 
plot(n3, y3, 'b.')
