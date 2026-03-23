clc; close; clear; clf;

function [yn, yorigin] = delay(xn, xorigin, k)
    // Check condition k > 0
    if k <= 0 then
        error("Value of k must be greater than 0.");
    end
    
    yn = xn;
    yorigin = xorigin - k;
    
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
    // Use common x_min and x_max
    a.data_bounds = [x_min, min([min(xn), 0])-1; x_max, max(xn)+2]; 
    
    // Plot the delayed signal y(n)
    subplot(2, 1, 2);
    plot2d3(n_y, yn, style=5);   // Draw stems
    plot(n_y, yn, 'ro');         // Draw red dots at the top
    for i = 1:length(yn)
        xstring(n_y(i) + 0.1, yn(i) + 0.2, string(yn(i))); 
    end
    xtitle("Delayed signal y(n)", "n", "y(n)");
    xgrid();
    
    a = gca();
    // Use common x_min and x_max
    a.data_bounds = [x_min, min([min(yn), 0])-1; x_max, max(yn)+2];
endfunction

// Test the given example
[yn, yorigin] = delay([1, -2, 3, 6], 3, 1);
yn      // answer: [1, -2, 3, 6]
yorigin // answer: 2
