clc; close; clear; clf;

function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    // Perform linear convolution using Scilab's built-in function
    yn = convol(xn, hn);
    
    // The mathematical origin for convolution is the sum of origins minus 1
    yorigin = xorigin + horigin - 1;
    
    // --- Determine time axes for all signals ---
    n_x = (1:length(xn)) - xorigin;
    n_h = (1:length(hn)) - horigin;
    n_y = (1:length(yn)) - yorigin;
    
    // --- Determine common X-axis bounds for perfect alignment ---
    x_min = min([n_x, n_h, n_y]) - 1;
    x_max = max([n_x, n_h, n_y]) + 1;
    
    // Find common Y limits to align the height proportionally
    y_min_all = min([min(xn), min(hn), min(yn), 0]) - 1;
    y_max_all = max([max(xn), max(hn), max(yn)]) + 2;
    
    // Plot input signal x(n)
    subplot(3, 1, 1);
    plot2d3(n_x, xn, style=2); // Blue stems
    plot(n_x, xn, 'bo');
    for i = 1:length(xn)
        xstring(n_x(i) + 0.1, xn(i) + 0.2, string(xn(i))); 
    end
    xtitle("Input signal x(n)", "n", "x(n)");
    xgrid();
    a = gca();
    a.data_bounds = [x_min, y_min_all; x_max, y_max_all];
    
    // Plot system characteristic function h(n)
    subplot(3, 1, 2);
    plot2d3(n_h, hn, style=5); // Red stems
    plot(n_h, hn, 'ro');
    for i = 1:length(hn)
        xstring(n_h(i) + 0.1, hn(i) + 0.2, string(hn(i))); 
    end
    xtitle("Impulse response h(n)", "n", "h(n)");
    xgrid();
    a = gca();
    a.data_bounds = [x_min, y_min_all; x_max, y_max_all];
    
    // Plot output convolution signal y(n)
    subplot(3, 1, 3);
    plot2d3(n_y, yn, style=3);   // Green stems
    plot(n_y, yn, 'go');
    for i = 1:length(yn)
        xstring(n_y(i) + 0.1, yn(i) + 0.2, string(yn(i))); 
    end
    xtitle("Convolution signal y(n) = x(n) * h(n)", "n", "y(n)");
    xgrid();
    a = gca();
    a.data_bounds = [x_min, y_min_all; x_max, y_max_all];
endfunction

// Test with a simple example:
// x(n) = {1, 2, 3} (origin at index 1 -> n=0)
// h(n) = {1, 1}    (origin at index 1 -> n=0)
[yn, yorigin] = convolution([1, 2, 3], 1, [1, 1], 1);
yn      // expected answer: [1, 3, 5, 3]
yorigin // expected answer: 1
