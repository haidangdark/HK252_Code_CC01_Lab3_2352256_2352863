clear; clc; clf;
n = -5:6;
x = zeros(1, length(n));
for k = 1:length(n)
    if n(k) >= -3 & n(k) <= -1 then
        x(k) = 1 + n(k)/3;
    elseif n(k) >= 0 & n(k) <= 3 then
        x(k) = 1;
    end
end
subplot(2,3,1);
plot2d3(n, x, style=color("blue"));
plot2d(n, x, style=-color("blue"));
xtitle("(a) x(n)", "n", "x(n)"); xgrid();
xb1 = zeros(1, length(n));
for k = 1:length(n)
    m = 4 - n(k);
    if m >= -3 & m <= -1 then
        xb1(k) = 1 + m/3;
    elseif m >= 0 & m <= 3 then
        xb1(k) = 1;
    end
end
subplot(2,3,2);
plot2d3(n, xb1, style=color("red"));
plot2d(n, xb1, style=-color("red"));
xtitle("(b1)"); xgrid();
xb2 = zeros(1, length(n));
for k = 1:length(n)
    m = -n(k) - 4;
    if m >= -3 & m <= -1 then
        xb2(k) = 1 + m/3;
    elseif m >= 0 & m <= 3 then
        xb2(k) = 1;
    end
end
subplot(2,3,3);
plot2d3(n, xb2, style=color("darkgreen"));
plot2d(n, xb2, style=-color("darkgreen"));
xtitle("(b2)"); xgrid();
xc = xb1;
subplot(2,3,4);
plot2d3(n, xc, style=color("magenta"));
plot2d(n, xc, style=-color("magenta"));
xtitle("(c)"); xgrid();
u = double(n >= 0);
xe = (1 + n/3) .* (double(n >= -3) - u) + (u - double(n >= 4));
subplot(2,3,5);
plot2d3(n, xe, style=color("cyan"));
plot2d(n, xe, style=-color("cyan"));
xtitle("(e)"); xgrid();
disp("b1 va c co giong nhau khong: " + string(and(xb1 == xc)));
