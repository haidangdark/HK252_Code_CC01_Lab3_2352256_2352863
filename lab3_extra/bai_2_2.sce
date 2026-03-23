clear; clc; clf;
n = -5:10;
x = zeros(1, length(n));
for k = 1:length(n)
    if n(k) >= 0 & n(k) <= 3 then
        x(k) = 1;
    elseif n(k) == 4 | n(k) == 5 then
        x(k) = 0.5;
    end
end
function y = xval(nk)
    if nk >= 0 & nk <= 3 then
        y = 1;
    elseif nk == 4 | nk == 5 then
        y = 0.5;
    else
        y = 0;
    end
endfunction
function draw(sub, n, x, col, tit)
    subplot(4, 2, sub);
    plot2d3(n, x, style=color(col));
    plot2d(n, x, style=-color(col));
    xtitle(tit, "n", "");
endfunction
draw(1, n, x, "blue", "original x(n)");
xa = zeros(1,length(n));
for k=1:length(n), xa(k) = xval(n(k)-2); end
draw(2, n, xa, "red", "(a)");
xb = zeros(1,length(n));
for k=1:length(n), xb(k) = xval(4-n(k)); end
draw(3, n, xb, "darkgreen", "(b)");
xc = zeros(1,length(n));
for k=1:length(n), xc(k) = xval(n(k)+2); end
draw(4, n, xc, "magenta", "(c)");
xd = x .* double(n <= 2);
draw(5, n, xd, "orange", "(d)");
xe = zeros(1,length(n));
for k=1:length(n)
    xe(k) = xval(n(k)-1) * double(n(k)==3);
end
draw(6, n, xe, "cyan", "(e)");
xg = zeros(1,length(n));
for k=1:length(n), xg(k) = (xval(n(k)) + xval(-n(k))) / 2; end
draw(7, n, xg, "purple", "(g)");
xh = zeros(1,length(n));
for k=1:length(n), xh(k) = (xval(n(k)) - xval(-n(k))) / 2; end
draw(8, n, xh, "brown", "(h)");
