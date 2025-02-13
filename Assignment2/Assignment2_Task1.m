function t = mytrapezoidalrule (f,a,b,N)
    % computes approximation of int_a ^b f(x) dx
    % using the composite trapezoidal rule

    % Computes an approximation of int_a^b f(x) dx using the composite trapezoidal rule.
    % f: function handle
    % a, b: integration limits (a < b)
    % N: number of subintervals

    h= (b -a) / N;
    x = a:h:b;
    
    y = f(x);
    
    % result of the composite trapezoidal rule
    t = h * (0.5*y(1) + sum(y(2:end-1)) + 0.5*y(end)); 
    end
    


% Test     

f = @(x) (x.*exp(x))./(x+1).^2;

a = 0;
b = 1;

N = 10;
T10 = mytrapezoidalrule(f, a, b, N);
fprintf('Composite trapezoidal rule with N = 10: %f\n', T10);

N = 100;
T100 = mytrapezoidalrule(f, a, b, N);
fprintf('Composite trapezoidal rule with N = 100: %f\n', T100);

exact = (exp(1) - 2) / 2;
fprintf('Exact value: %f\n', exact);


