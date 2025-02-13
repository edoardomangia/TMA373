function t = mytrapezoidalrule (f,a,b,N)
    % computes approximation of int_a ^b f(x) dx
    % using the composite trapezoidal rule

    % Computes an approximation of int_a^b f(x) dx using the composite trapezoidal rule.
    % f: function handle
    % a, b: integration limits (a < b)
    % N: number of subintervals

    h= (b - a) / N;
    x = a:h:b;
    
    y = f(x);
    
    % result of the composite trapezoidal rule
    t = h * (0.5*y(1) + sum(y(2:end-1)) + 0.5*y(end)); 
    end

% Define test function f(x) = sin(x) on [0,pi]
f = @(x) sin(x);
I_exact = 2;    % exact value of ∫_0^pi sin(x) dx
err_prev = NaN;

fprintf('Convergence study for composite trapezoidal rule:\n');
for n = 0:7
    N = 2^n;
    I_approx = mytrapezoidalrule(f, 0, pi, N);
    err = abs(I_approx - I_exact);
    if n > 0
        reduction = err / err_prev;
        fprintf('N = %d, error = %e, reduction factor = %f\n', N, err, reduction);
    else
        fprintf('N = %d, error = %e\n', N, err);
    end
    err_prev = err;
end