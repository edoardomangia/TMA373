function yy = MyLagrangeInterpol(x, y, xx)
% MyLagrangeInterpol computes the interpolation polynomial using Lagrange basis functions.
% Input:
%   x  - vector of nodes (length n)
%   y  - vector of function values at nodes (length n)
%   xx - vector of points where the interpolation is evaluated (length m)
% Output:
%   yy - vector of interpolated values at xx (length m)

n = length(x);
m = length(xx);
yy = zeros(1, m);  % initialize result

for i = 1:m
    % Evaluate the interpolating polynomial at xx(i)
    L_val = zeros(1, n);  % values of the Lagrange basis polynomials at xx(i)
    for k = 1:n
        % Compute Lagrange basis polynomial L_k(xx(i))
        % L_k(x) = prod_{j=1, j~=k}^{n} (x - x(j))/(x(k) - x(j))
        numerator = 1;
        denominator = 1;
        for j = 1:n
            if j ~= k
                numerator = numerator * (xx(i) - x(j));
                denominator = denominator * (x(k) - x(j));
            end
        end
        L_val(k) = numerator / denominator;
    end
    % Combine the contributions from each basis polynomial
    yy(i) = sum(y .* L_val);
end

end


% Data points
x = [2, 3, 4, 5, 6];
y = [2, 6, 5, 5, 6];

% Evaluate using built-in polyfit/polyval
c = polyfit(x, y, 4);
xx = linspace(min(x), max(x), 50);
yy_polyval = polyval(c, xx);

% Evaluate using the custom Lagrange interpolation function
yy_lagrange = MyLagrangeInterpol(x, y, xx);

% Compute the error between the two methods
error = norm(yy_polyval - yy_lagrange, inf);  % max norm error
fprintf('Maximum difference between polyfit/polyval and MyLagrangeInterpol: %e\n', error);

figure;
plot(xx, yy_polyval, 'b-', 'LineWidth', 2);
hold on;
plot(xx, yy_lagrange, 'r--', 'LineWidth', 2);
plot(x, y, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
xlabel('x');
ylabel('Interpolated y');
title('Comparison: Built-in vs. Lagrange Interpolation');
legend('polyval', 'MyLagrangeInterpol', 'Data points');
hold off;

