% Task 1a: Plot the given data points
x = [2, 3, 4, 5, 6];      % nodes
y = [2, 6, 5, 5, 6];      % data values

figure;
plot(x, y, 'r*', 'MarkerSize', 16);
xlabel('x');
ylabel('y');
title('Data Points and Interpolating Polynomial');
hold on;  

% Task 1b: Compute and plot the polynomial interpolant of degree 4
n = 4;  
c = polyfit(x, y, n);   % coefficients of the interpolant (highest degree first)

xx = linspace(min(x), max(x), 50);  % 50 evenly spaced points between min(x) and max(x)
yy = polyval(c, xx);                % evaluate the polynomial at these points

plot(xx, yy, 'b-', 'LineWidth', 2);  % plot the polynomial curve in blue
legend('Data points', 'Polynomial interpolant');
hold off;
