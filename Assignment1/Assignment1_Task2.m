% Define the years and life expectancy data
years = [1975, 1980, 1985, 1990];

% Western Europe data
LE_west = [72.8, 74.2, 75.2, 76.4];
% Eastern Europe data
LE_east = [70.2, 70.2, 70.3, 71.2];

% Points where we want to estimate life expectancy
years_est = [1970, 1983, 1988];

% Interpolation for Western Europe
coeff_west = polyfit(years, LE_west, 3);
LE_west_est = polyval(coeff_west, years_est);

% Interpolation for Eastern Europe
coeff_east = polyfit(years, LE_east, 3);
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

fprintf('Western Europe estimates:\n');
fprintf('Year 1970: %.2f (Actual: 71.8)\n', LE_west_est(1));
fprintf('Year 1983: %.2f\n', LE_west_est(2));
fprintf('Year 1988: %.2f\n', LE_west_est(3));

fprintf('\nEastern Europe estimates:\n');
fprintf('Year 1970: %.2f (Actual: 69.6)\n', LE_east_est(1));
fprintf('Year 1983: %.2f\n', LE_east_est(2));
fprintf('Year 1988: %.2f\n', LE_east_est(3));
