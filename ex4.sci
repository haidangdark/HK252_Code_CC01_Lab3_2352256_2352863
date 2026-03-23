clc; close; clear; clf;

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    // Determine the exact time ranges for both signals
    n1_start = 1 - x1origin;
    n1_end = length(x1n) - x1origin;
    
    n2_start = 1 - x2origin;
    n2_end = length(x2n) - x2origin;
    
    // Determine the time range for the output signal y(n)
    n_start = min(n1_start, n2_start);
    n_end = max(n1_end, n2_end);
    
    // Create the time axis for the output signal
    n_y = n_start:n_end;
    
    // Initialize the output vector with zeros
    yn = zeros(1, length(n_y));
    
    // Calculate the mathematical origin position for y(n)
    yorigin = 1 - n_start; 
    
    // Perform addition by iterating through the common time axis
    for i = 1:length(n_y)
        t = n_y(i);
        val1 = 0;
        val2 = 0;
        
        // Extract value from x1 if t is within its range
        if (t >= n1_start) & (t <= n1_end) then
            val1 = x1n(t + x1origin);
        end
        // Extract value from x2 if t is within its range
        if (t >= n2_start) & (t <= n2_end) then
            val2 = x2n(t + x2origin);
        end
        
        yn(i) = val1 + val2;
    end
    
    // --- Determine common axes bounds for perfect alignment ---
    n_x1 = n1_start:n1_end;
    n_x2 = n2_start:n2_end;
    x_min = n_start - 1;
    x_max = n_end + 1;
    
    // Find common Y limits to align the height proportionally
    y_min_all = min([min(x1n), min(x2n), min(yn), 0]) - 1;
    y_max_all = max([max(x1n), max(x2n), max(yn)]) + 2;
    
    // Plot x1(n)
    subplot(3, 1, 1);
    plot2d3(n_x1, x1n, style=2); // Blue stems
    plot(n_x1, x1n, 'bo');
    for i = 1:length(x1n)
        xstring(n_x1(i) + 0.1, x1n(i) + 0.2, string(x1n(i))); 
    end
    xtitle("Signal x1(n)", "n", "x1(n)");
    xgrid();
    a = gca();
    a.data_bounds = [x_min, y_min_all; x_max, y_max_all];
    
    // Plot x2(n)
    subplot(3, 1, 2);
    plot2d3(n_x2, x2n, style=5); // Red stems
    plot(n_x2, x2n, 'ro');
    for i = 1:length(x2n)
        xstring(n_x2(i) + 0.1, x2n(i) + 0.2, string(x2n(i))); 
    end
    xtitle("Signal x2(n)", "n", "x2(n)");
    xgrid();
    a = gca();
    a.data_bounds = [x_min, y_min_all; x_max, y_max_all];
    
    // Plot y(n)
    subplot(3, 1, 3);
    plot2d3(n_y, yn, style=3);   // Green stems
    plot(n_y, yn, 'go');
    for i = 1:length(yn)
        xstring(n_y(i) + 0.1, yn(i) + 0.2, string(yn(i))); 
    end
    xtitle("Sum signal y(n) = x1(n) + x2(n)", "n", "y(n)");
    xgrid();
    a = gca();
    a.data_bounds = [x_min, y_min_all; x_max, y_max_all];
endfunction

// Test the given example
[yn, yorigin] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
yn      // expected answer: [1, 1, 3, 6, -2]
yorigin // expected answer: 2 (Mathematically corrected)
