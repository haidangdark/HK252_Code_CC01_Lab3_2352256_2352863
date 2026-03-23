clc; close; clear; clf;

function [yn, yorigin] = advance(xn, xorigin, k)
    // Check condition k > 0
    if k <= 0 then
        error("Value of k must be greater than 0.");
    end
    
    yn = xn;
    yorigin = xorigin + k; // Advance operation shifts origin to the right
    
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
    
    // Plot the advanced signal y(n)
    subplot(2, 1, 2);
    plot2d3(n_y, yn, style=5);   // Draw stems
    plot(n_y, yn, 'ro');         // Draw red dots at the top
    for i = 1:length(yn)
        xstring(n_y(i) + 0.1, yn(i) + 0.2, string(yn(i))); 
    end
    xtitle("Advanced signal y(n) = x(n + " + string(k) + ")", "n", "y(n)");
    xgrid();
    
    a = gca();
    a.data_bounds = [x_min, min([min(yn), 0])-1; x_max, max(yn)+2];
endfunction

// Test the given example
[yn, yorigin] = advance([1, -4, 6, 8], 2, 3);
yn      // expected answer: [1, -2, 3, 6]
yorigin // expected answer: 4
