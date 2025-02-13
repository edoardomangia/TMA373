function m = mymidpointrule(f, a, b, N)
    % Computes an approximation of int_a^b f(x) dx using the composite midpoint rule.
    % f: function handle
    % a, b: integration limits (a < b)
    % N: number of subintervals
    %
    % Compute the uniform step size
    h = (b - a) / N;
    
    % Compute the midpoints of each subinterval
    midpoints = a + h/2 : h : b - h/2;
    
    % Apply the composite midpoint rule
    m = h * sum(f(midpoints));
end



% Define the function
f = @(x) (x.*exp(x))./(x+1).^2;

% Set integration limits
a = 0;
b = 1;

% Test with N = 10
N = 10;
M10 = mymidpointrule(f, a, b, N);
fprintf('Composite midpoint rule with N = 10: %f\n', M10);

% Test with N = 100
N = 100;
M100 = mymidpointrule(f, a, b, N);
fprintf('Composite midpoint rule with N = 100: %f\n', M100);

% Exact value for comparison (as given)
exact = (exp(1) - 2) / 2;
fprintf('Exact value: %f\n', exact);