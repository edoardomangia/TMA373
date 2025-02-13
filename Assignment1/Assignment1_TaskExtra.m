% Define the years and life expectancy data
years = [1970, 1975, 1980, 1985, 1990];

% Western Europe data (including given actual value for 1970)
LE_west = [71.8, 72.8, 74.2, 75.2, 76.4];
% Eastern Europe data (including given actual value for 1970)
LE_east = [69.6, 70.2, 70.2, 70.3, 71.2];

% Points where we want to estimate life expectancy
years_est = [1983, 1988];

% Interpolation for Western Europe
coeff_west = polyfit(years, LE_west, 5);
LE_west_est = polyval(coeff_west, years_est);

% Interpolation for Eastern Europe
coeff_east = polyfit(years, LE_east, 5);
LE_east_est = polyval(coeff_east, years_est);

% Plot the results for Western Europe
figure;
subplot(1,2,1);
plot(years, LE_west, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
hold on;
xx_west = linspace(min(years)-5, max(years)+5, 100);
yy_west = polyval(coeff_west, xx_west);
plot(xx_west, yy_west, 'b-', 'LineWidth', 2);
plot(years_est, LE_west_est, 'ks', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
xlabel('Year');
ylabel('Life Expectancy');
title('Western Europe');
legend('Data points', 'Interpolant', 'Estimates');
hold off;

% Plot the results for Eastern Europe
subplot(1,2,2);
plot(years, LE_east, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
hold on;
xx_east = linspace(min(years)-5, max(years)+5, 100);
yy_east = polyval(coeff_east, xx_east);
plot(xx_east, yy_east, 'b-', 'LineWidth', 2);
plot(years_est, LE_east_est, 'ks', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
xlabel('Year');
ylabel('Life Expectancy');
title('Eastern Europe');
legend('Data points', 'Interpolant', 'Estimates');
hold off;

% Print the estimated values
fprintf('Western Europe estimates:\n');
fprintf('Year 1983: %.2f\n', LE_west_est(1));
fprintf('Year 1988: %.2f\n', LE_west_est(2));

fprintf('\nEastern Europe estimates:\n');
fprintf('Year 1983: %.2f\n', LE_east_est(1));
fprintf('Year 1988: %.2f\n', LE_east_est(2));
