clc; close; clear; clf;

function [yn, yorigin] = fold(xn, xorigin)
    // The fold operation reverses the signal array (equivalent to flipdim)
    yn = xn($:-1:1); 
    
    // The new origin position is mirrored across the array length
    yorigin = length(xn) - xorigin + 1;
    
    n_x = (1:length(xn)) - xorigin; // Time axis for x(n)
    n_y = (1:length(yn)) - yorigin; // Time axis for y(n)
    
    // --- Determine common X-axis bounds for alignment ---
    x_min = min([n_x, n_y]) - 1;
    x_max = max([n_x, n_y]) + 1;
    
    // Plot the original signal x(n)
    subplot(2, 1, 1);
    plot2d3(n_x, xn, style=2);   // Draw stems
    plot(n_x, xn, 'bo');         // Draw blue dots at the top
    for i = 1:length(xn)
        xstring(n_x(i) + 0.1, xn(i) + 0.2, string(xn(i))); 
    end
    xtitle("Original signal x(n)", "n", "x(n)");
    xgrid();
    
    a = gca(); 
    a.data_bounds = [x_min, min([min(xn), 0])-1; x_max, max(xn)+2]; 
    
    // Plot the folded signal y(n)
    subplot(2, 1, 2);
    plot2d3(n_y, yn, style=5);   // Draw stems
    plot(n_y, yn, 'ro');         // Draw red dots at the top
    for i = 1:length(yn)
        xstring(n_y(i) + 0.1, yn(i) + 0.2, string(yn(i))); 
    end
    xtitle("Folded signal y(n) = x(-n)", "n", "y(n)");
    xgrid();
    
    a = gca();
    a.data_bounds = [x_min, min([min(yn), 0])-1; x_max, max(yn)+2];
endfunction

// Test the given example
//[yn, yorigin] = fold([4, 0, -3, 7, 2], 2);
//yn      // expected answer: [2, 7, -3, 0, 4]
//yorigin // expected answer: 4
[yn, yorigin] = fold([1, -2, 3, 6], 3);
yn      // expected answer: [6, 3, -2, 1]
yorigin // expected answer: 2
