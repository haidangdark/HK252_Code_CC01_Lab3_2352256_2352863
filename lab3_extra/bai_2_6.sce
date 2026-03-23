clear; clc; clf;
n = -3:5;
function y = xin(nk)
    y = double(nk >= 0 & nk <= 3);
endfunction
function y = xin2(nk)
    y = xin(nk - 2);
endfunction
x1 = zeros(1,length(n));
y1 = zeros(1,length(n));
yd = zeros(1,length(n));
x2 = zeros(1,length(n));
y2 = zeros(1,length(n));
for k = 1:length(n)
    x1(k) = xin(n(k));
    y1(k) = xin(n(k)^2);
    yd(k) = xin((n(k)-2)^2);
    x2(k) = xin2(n(k));
    y2(k) = xin2(n(k)^2);
end
disp("n      = " + string(n));
disp("y(n-2) = " + string(yd));
disp("y2(n)  = " + string(y2));
disp("y(n-2) == y2(n): " + string(and(yd == y2)));
disp("=> He thong KHONG bat bien thoi gian (time-variant)");
function draw(sub, n, x, col, tit)
    subplot(3,2,sub);
    plot2d3(n, x, style=color(col));
    plot2d(n, x, style=-color(col));
    xtitle(tit,"n","");
endfunction
draw(1, n, x1, "blue",    "(1) x(n)");
draw(2, n, y1, "red",     "(2) y(n)");
draw(3, n, yd, "darkgreen","(3) y(n-2)");
draw(4, n, x2, "orange",  "(4) x2(n) = x(n-2)");
draw(5, n, y2, "magenta", "(5) y2(n) = x(n^2-2)");
