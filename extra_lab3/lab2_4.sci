/*
n = -5:5;
msignal = bool2s (n >= 0);
plot2d3(n, msignal) 
plot(n, msignal, 'r.')
*/

////////////////

/*
n = -5:5;
msignal = bool2s (n == 0);
plot2d3(n, msignal)
plot(n, msignal, 'b.')
*/

////////////////


n = -5:5;
ur = n .* bool2s(n >= 0);
plot2d3(n, ur);
plot(n, ur, 'r.')

